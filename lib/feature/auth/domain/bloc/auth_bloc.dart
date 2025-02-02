import 'dart:async';
import 'dart:io';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rus_bal_dict/core/model/user/user.dart';
import 'package:rus_bal_dict/core/utils/app_utils.dart';
import 'package:rus_bal_dict/feature/auth/data/exceptions/exceptions.dart';
import 'package:rus_bal_dict/feature/auth/domain/bloc/auth_event.dart';
import 'package:rus_bal_dict/feature/auth/domain/bloc/auth_state.dart';
import 'package:rus_bal_dict/feature/auth/domain/repository/new_auth_repository.dart';
import 'package:talker/talker.dart';

import '../repository/auth_repository.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repository;
  final NewAuthRepository newAuthRepository;
  final Talker? logger;

  AuthBloc(this.repository, this.newAuthRepository, {this.logger})
      : super(AuthState()) {
    on<SignUpEvent>(_signUp);
    on<SignInEvent>(_signIn);
    on<SignOutEvent>(_signOut);
    on<ChangeAuthPageEvent>(_changeAuthPage);
    on<MaskPasswordEvent>(_maskPassword);
    on<StartSessionEvent>(_startSession);
    on<SendRestoreCodeEvent>(_sendRestoreCode, transformer: droppable());
    on<ConfirmRestoreCodeEvent>(_confirmRestoreCode, transformer: droppable());
    on<SendActivationCodeEvent>(_sendActivationCode, transformer: droppable());
    on<ConfirmUserActivationEvent>(_confirmActivation,
        transformer: droppable());
    on<UpdateUserPasswordAuthEvent>(_updateUserPassword);
    on<ChangeAgreeWithPolicyAuthEvent>(_changeAgreeWithPolicy);
    on<ChangeAgreeWithTermOfUseEvent>(_changeAgreeWithTermOfUse);
    on<SaveUserSignUpInputAuthEvent>(_saveSignUpInput);
  }

  FutureOr<void> _startSession(
      StartSessionEvent event, Emitter<AuthState> emit) async {
    final startSessionEither = await newAuthRepository.startSession();
    startSessionEither.either((error) {
      event.onError?.call(error is DioException ? error.deails : 'Войдите снова');
    }, (user) {
      emit(state.copyWith(user: user));
      event.onSuccess?.call();
    });
  }

  FutureOr<void> _signUp(SignUpEvent event, Emitter<AuthState> emit) async {
    if (!state.policyAgree || !state.termOfUseAgree) {
      Future.sync(() => event.onUserNoAgreeWithPolicy?.call());
      return;
    }
    final deviceId = await _deviceId();
    // final user = User(
    //     name: event.name,
    //     email: event.email,
    //     password: event.password,
    //     imei: deviceId ?? 'unknown');
    //final signUpEither = await repository.registerUser(user: user);
    final signUpEither = await newAuthRepository.register(
        email: event.email,
        password: event.password,
        name: event.name,
        imei: deviceId ?? 'unknown');
    signUpEither.either((error) {
      if (error is DioException) {
        event.onError?.call(error.deails);
      } else {
        event.onError?.call('Ошибка $error');
      }
    }, (registerMessage) {
      event.onSuccess?.call(registerMessage);
    });
  }

  Future<String?> _deviceId() async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      return androidInfo.id;
    } else if (Platform.isIOS) {
      final iosInfo = await deviceInfo.iosInfo;
      return iosInfo.identifierForVendor;
    }
    // Иначе если платформа не ios и не android
    return null;
  }

  FutureOr<void> _signIn(SignInEvent event, Emitter<AuthState> emit) async {
    // final signInEither =
    //     await repository.signIn(email: event.email, password: event.password);
    final signInEither = await newAuthRepository.login(
        email: event.email, password: event.password);
    signInEither.either((userSignInException) {
      if (userSignInException is DioException) {
        event.onError?.call(userSignInException.deails);
      } else {
        event.onError?.call('Ошибка входа');
      }
    }, (token) async {
      final authEither = await newAuthRepository.getUser();
      authEither.either((authError) {
        if (authError is DioException) {
          event.onError?.call(authError.deails);
        } else {
          event.onError?.call('Ошибка авторизации');
        }
      }, (user) {
        event.onSuccess?.call(user, 'Вы успешно вошли');
      });
    });
  }

  FutureOr<void> _signOut(SignOutEvent event, Emitter<AuthState> emit) async {
    //repository.signOut();
    await newAuthRepository.logout();
  }

  FutureOr<void> _changeAuthPage(
      ChangeAuthPageEvent event, Emitter<AuthState> emit) {
    emit(state.copyWith(pageState: event.pageState));
  }

  FutureOr<void> _maskPassword(
      MaskPasswordEvent event, Emitter<AuthState> emit) {
    emit(state.copyWith(isPasswordMasked: event.isPasswordMasked));
  }

  FutureOr<void> _updateUserPassword(
      UpdateUserPasswordAuthEvent event, Emitter<AuthState> emit) async {
    try {
      if (event.newPassword == event.confirmPassword) {
        // await repository.resetUserPassword(
        //     email: event.email, newPassword: event.newPassword);
        // event.onSuccess?.call();
        // // Обнулить состояние
        // emit(AuthState());
        final changePasswordMessage = await newAuthRepository.changePassword(
            event.email, event.newPassword);
        event.onSuccess?.call(changePasswordMessage);
      } else {
        event.onError?.call('Пароли не совпадают');
      }
    } on DioException catch (dioException, stack) {
      event.onError?.call(dioException.deails);
      logger?.handle(dioException, stack);
    } on Exception catch (e, s) {
      event.onError?.call(e.toString());
      logger?.handle(e, s);
    }
  }

  FutureOr<void> _changeAgreeWithPolicy(
      ChangeAgreeWithPolicyAuthEvent event, Emitter<AuthState> emit) {
    emit(state.copyWith(policyAgree: event.agreeWithPolicy));
  }

  FutureOr<void> _changeAgreeWithTermOfUse(
      ChangeAgreeWithTermOfUseEvent event, Emitter<AuthState> emit) {
    emit(state.copyWith(termOfUseAgree: event.agreeWithTermOfUse));
  }

  FutureOr<void> _saveSignUpInput(
      SaveUserSignUpInputAuthEvent event, Emitter<AuthState> emit) {
    emit(state.copyWith(
        email: event.email, password: event.password, userName: event.name));
    event.onComplete?.call();
  }

  FutureOr<void> _sendRestoreCode(
      SendRestoreCodeEvent event, Emitter<AuthState> emit) async {
    try {
      await newAuthRepository.sendResetCode(event.email);
      emit(state.copyWith(emailForRestorePassword: event.email));
      event.onSuccess?.call();
    } on DioException catch (dioException, stack) {
      event.onError?.call(dioException.deails);
      logger?.handle(dioException, stack, "Send restore code error");
    } on Exception catch (e, s) {
      event.onError?.call('Ошибка отправки кода восстановления пароля');
      logger?.handle(e, s, "Send restore code unknown error");
    }
  }

  FutureOr<void> _confirmRestoreCode(
      ConfirmRestoreCodeEvent event, Emitter<AuthState> emit) async {
    try {
      await newAuthRepository.resetPassword(event.email, event.code);
      emit(state.copyWith(emailForRestorePassword: null));
      event.onSuccess?.call();
    } on DioException catch (dioException, stack) {
      event.onError?.call(dioException.deails);
      logger?.handle(dioException, stack, "Confirm reset error");
    } on Exception catch (e, s) {
      event.onError?.call('Неизвестная ошибка $e');
      logger?.handle(e, s, "Confirm reset unknown error");
    }
  }

  FutureOr<void> _sendActivationCode(
      SendActivationCodeEvent event, Emitter<AuthState> emit) async {
    try {
      await newAuthRepository.sendActivationCode('');
      event.onSuccess?.call();
    } on DioException catch (dioException, stack) {
      event.onError?.call();
      logger?.handle(dioException, stack, "Send activation code error");
    } on Exception catch (e, s) {
      event.onError?.call();
      logger?.handle(e, s, "Send activation code unknown error");
    }
  }

  FutureOr<void> _confirmActivation(
      ConfirmUserActivationEvent event, Emitter<AuthState> emit) async {
    try {
      await newAuthRepository.activateUser(event.code);
      var authEither = await newAuthRepository.getUser();
      authEither.either((error) {
        event.onError
            ?.call(error is DioException ? error.deails : error.toString());
      }, (user) {
        event.onSuccess?.call();
      });
    } on DioException catch (dioException, stack) {
      logger?.handle(dioException, stack, 'Activation dio error');
      event.onError?.call(dioException.deails);
    } on Exception catch (e, s) {
      logger?.handle(e, s, "Activation unknown error");
      event.onError?.call('Неизвестная ошибка $e');
    }
  }
}
