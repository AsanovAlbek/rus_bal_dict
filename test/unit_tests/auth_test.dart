import 'dart:math';

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rus_bal_dict/core/model/token/token.dart';
import 'package:rus_bal_dict/core/model/user/user.dart';
import 'package:rus_bal_dict/feature/auth/data/exceptions/exceptions.dart';
import 'package:rus_bal_dict/feature/auth/domain/repository/new_auth_repository.dart';

import 'mock_models.dart';

class MockAuthRepository extends Mock implements NewAuthRepository {}

void main() {
  group('Тесты для регистрации пользователя', () {
    late MockAuthRepository authRepository;
    late User user;

    setUp(() {
      authRepository = MockAuthRepository();
      user = const User(
        id: 1,
        name: 'John Doe',
        email: 'johndoe@example.com',
        password: 'password',
      );
    });

    test('Регистрация пользователя. Тестирование успешной регистрации',
        () async {
      const userSuccessRegisterMessage = "Пользователь успешно зарегистрирован";
      when(() => authRepository.register(
              email: user.email,
              password: user.password,
              name: user.name,
              imei: "user_imei"))
          .thenAnswer((_) async =>
              Either.cond(true, Exception(), userSuccessRegisterMessage));

      final result = await authRepository.register(
          email: user.email,
          password: user.password,
          name: user.name,
          imei: "user_imei");
      expect(result.isLeft, isFalse);
      expect(result.isRight, isTrue);
      expect(result.right, userSuccessRegisterMessage);
    });

    test('Регистрация пользователя. Тестирование ошибки регистрации', () async {
      const userSuccessRegisterMessage = "Пользователь успешно зарегистрирован";
      when(() => authRepository.register(
              email: user.email,
              password: user.password,
              name: user.name,
              imei: "user_imei"))
          .thenAnswer((_) async =>
              Either.cond(false, Exception(), userSuccessRegisterMessage));

      final result = await authRepository.register(
          email: user.email,
          password: user.password,
          name: user.name,
          imei: "user_imei");
      expect(result.isLeft, isTrue);
      expect(result.isRight, isFalse);
      expect(result.left, isA<Exception>());
    });
    test('Вход пользователя в аккаунт. Проверка на успешность входа', () async {
      const email = 'johndoe@example.com';
      const password = 'password';
      const token =
          Token(accessToken: "access_token", refreshToken: "refresh_token");
      when(() => authRepository.login(email: email, password: password))
          .thenAnswer((_) async => Either.cond(true, Exception(), token));
      final loginEither =
          await authRepository.login(email: email, password: password);
      expect(loginEither.isLeft, isFalse);
      expect(loginEither.isRight, isTrue);
      expect(loginEither.right, token);
    });

    test('Вход пользователя в аккаунт. Проверка на неправильные почту и пароль',
        () async {
      const email = 'johndoe@example.com';
      const password = 'password';
      const token =
          Token(accessToken: "access_token", refreshToken: "refresh_token");
      when(() => authRepository.login(email: email, password: password))
          .thenAnswer((_) async => Either.cond(false, Exception(), token));
      final loginEither =
          await authRepository.login(email: email, password: password);
      expect(loginEither.isLeft, isTrue);
      expect(loginEither.isRight, isFalse);
      expect(loginEither.left, isA<Exception>());
    });

    test('Проверка на успешный вызов функции выхода из аккаунта', () async {
      when(() => authRepository.logout())
          .thenAnswer((_) async => Either.cond(true, Exception(), null));
      await authRepository.logout();
      verifyOnce(() => authRepository.logout());
    });

    test('Проверка на успешный вызов отправки кода восстановления пароля',
        () async {
      const email = 'user@mail.ru';
      const message = "Код для восстановления пароля отправлен успешно";
      when(() => authRepository.sendResetCode(email))
          .thenAnswer((_) async => message);
      final sendActivationCode = await authRepository.sendResetCode(email);
      verifyOnce(() => authRepository.sendResetCode(email));
      expect(sendActivationCode, message);
    });

    test('Проверка на ошибку отправки кода.', () async {
      const email = 'user@mail.ru';
      when(() => authRepository.sendResetCode(email)).thenThrow(Exception());
      expect(() async => await authRepository.sendResetCode(email),
          throwsException);
    });

    test('Проверка на смену пароля', () async {
      const email = 'user@mail.ru';
      const newPassword = 'Password12345';
      const message = "Пароль успешно сменен";
      when(() => authRepository.changePassword(email, newPassword))
          .thenAnswer((_) async => message);
      final changePasswordMessage =
          await authRepository.changePassword(email, newPassword);
      verifyOnce(() => authRepository.changePassword(email, newPassword));
      expect(changePasswordMessage, message);
    });

    test('Проверка на ошибку смены пароля', () async {
      const email = 'user@mail.ru';
      const newPassword = 'Password12345';
      when(() => authRepository.changePassword(email, newPassword))
          .thenThrow(Exception());
      expect(
          () async => await authRepository.changePassword(email, newPassword),
          throwsException);
    });

    test('Проверка на отправку кода активации аккаунта', () async {
      const message = "Отправлен код активации";
      when(() => authRepository.sendActivationCode()).thenAnswer((_) async => message);
      final sendCodeMessage = await authRepository.sendActivationCode();
      verifyOnce(() => authRepository.sendActivationCode());
      expect(sendCodeMessage, message);
    });

    test('Проверка на ошибку отправки кода активации аккаунта', () async {
      when(() => authRepository.sendActivationCode()).thenThrow(Exception());
      expect(() => authRepository.sendActivationCode(), throwsException);
    });

    test('Проверка на активацию аккаунта', () async {
      const code = "123456";
      const message = "Аккаунт успешно активирован";
      when(() => authRepository.activateUser(code)).thenAnswer((_) async => message);
      final activateMessage = await authRepository.activateUser(code);
      verifyOnce(() => authRepository.activateUser(code));
      expect(activateMessage, message);
    });

    test('Проверка на ошибку активации аккаунта', () async {
      const code = "123456";
      when(() => authRepository.activateUser(code)).thenThrow(Exception());
      expect(() => authRepository.activateUser(code), throwsException);
    });
  });
}
