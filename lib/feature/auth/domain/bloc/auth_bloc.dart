import 'dart:async';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rus_bal_dict/core/model/user/user.dart';
import 'package:rus_bal_dict/feature/auth/data/exceptions/exceptions.dart';
import 'package:rus_bal_dict/feature/auth/domain/bloc/auth_event.dart';
import 'package:rus_bal_dict/feature/auth/domain/bloc/auth_state.dart';

import '../repository/auth_repository.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repository;

  AuthBloc(this.repository) : super(AuthState()) {
    on<SignUpEvent>(_signUp);
    on<SignInEvent>(_signIn);
    on<SignOutEvent>(_signOut);
    on<ChangeAuthPageEvent>(_changeAuthPage);
    on<MaskPasswordEvent>(_maskPassword);
  }

  FutureOr<void> _signUp(SignUpEvent event, Emitter<AuthState> emit) async {
    final deviceId = await _deviceId();
    final user = User(name: event.name, email: event.email, password: event.password, imei: deviceId ?? 'unknown');
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
    final signInEither = await repository.signIn(email: event.email, password: event.password);
    signInEither.either((userSignInException) {
      String errorMessage =
          userSignInException is UserNotFoundException ? userSignInException.message : 'Неизвестная ошибка';
      event.onError?.call(errorMessage);
    }, (user) {
      event.onSuccess?.call(user, 'Вы успешно вошли');
    });
  }

  FutureOr<void> _signOut(SignOutEvent event, Emitter<AuthState> emit) async {
    repository.signOut();
  }

  FutureOr<void> _changeAuthPage(ChangeAuthPageEvent event, Emitter<AuthState> emit) {
    emit(state.copyWith(pageState: event.pageState));
  }

  FutureOr<void> _maskPassword(MaskPasswordEvent event, Emitter<AuthState> emit) {
    emit(state.copyWith(isPasswordMasked: event.isPasswordMasked));
  }
}
