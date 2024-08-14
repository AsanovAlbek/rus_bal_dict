import 'dart:async';
import 'dart:io';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rus_bal_dict/core/model/user/user.dart';
import 'package:rus_bal_dict/feature/auth/data/exceptions/exceptions.dart';
import 'package:rus_bal_dict/feature/auth/domain/bloc/auth_event.dart';
import 'package:rus_bal_dict/feature/auth/domain/bloc/auth_state.dart';
import 'package:talker/talker.dart';

import '../repository/auth_repository.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repository;

  AuthBloc(this.repository) : super(AuthState()) {
    on<SignUpEvent>(_signUp);
    on<SignInEvent>(_signIn);
    on<SignOutEvent>(_signOut);
    on<ChangeAuthPageEvent>(_changeAuthPage);
    on<MaskPasswordEvent>(_maskPassword);
    on<SendCodeToEmailAuthEvent>(_sendCodeToEmail, transformer: droppable());
    on<UpdateUserPasswordAuthEvent>(_updateUserPassword);
  }

  FutureOr<void> _signUp(SignUpEvent event, Emitter<AuthState> emit) async {
    final deviceId = await _deviceId();
    final user = User(
        name: event.name,
        email: event.email,
        password: event.password,
        imei: deviceId ?? 'unknown');
    final signUpEither = await repository.registerUser(user: user);
    signUpEither.either((userSignUpException) {
      String errorMessage = userSignUpException is UserAlreadyExistException
          ? userSignUpException.message
          : 'Неизвестная ошибка';
      event.onError?.call(errorMessage);
    }, (newUser) {
      event.onSuccess?.call(newUser, 'Вы успешно зарегистрировались');
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
    final signInEither =
        await repository.signIn(email: event.email, password: event.password);
    signInEither.either((userSignInException) {
      String errorMessage = userSignInException is UserNotFoundException
          ? userSignInException.message
          : 'Неизвестная ошибка';
      event.onError?.call(errorMessage);
    }, (user) {
      event.onSuccess?.call(user, 'Вы успешно вошли');
    });
  }

  FutureOr<void> _signOut(SignOutEvent event, Emitter<AuthState> emit) async {
    repository.signOut();
  }

  FutureOr<void> _changeAuthPage(
      ChangeAuthPageEvent event, Emitter<AuthState> emit) {
    emit(state.copyWith(pageState: event.pageState));
  }

  FutureOr<void> _maskPassword(
      MaskPasswordEvent event, Emitter<AuthState> emit) {
    emit(state.copyWith(isPasswordMasked: event.isPasswordMasked));
  }

  FutureOr<void> _sendCodeToEmail(
      SendCodeToEmailAuthEvent event, Emitter<AuthState> emit) async {
    final email =
        event.email.isNotEmpty ? event.email : state.emailForRestorePassword;
    final sendCodeEither =
        await repository.sendCodeToEmail(email: email ?? event.email);
    sendCodeEither.either((userSendCodeException) {
      event.onError?.call(userSendCodeException.toString());
    }, (code) {
      emit(state.copyWith(
          codeFromEmail: code, emailForRestorePassword: event.email));
      event.onSuccess?.call(code);
    });
    if (event.email.trim().isNotEmpty) {
      emit(state.copyWith(emailForRestorePassword: event.email));
    }
  }

  FutureOr<void> _updateUserPassword(
      UpdateUserPasswordAuthEvent event, Emitter<AuthState> emit) async {
    try {
      if (event.newPassword == event.confirmPassword) {
        await repository.resetUserPassword(email: event.email, newPassword:  event.newPassword);
        event.onSuccess?.call();
        // Обнулить состояние
        emit(AuthState());
      } else {
        event.onError?.call('Пароли не совпадают');
      }
    } on Exception catch (e, s) {
      event.onError?.call(e.toString());
      Talker().handle(e, s);
    }
  }
}
