import 'dart:math';

import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rus_bal_dict/core/model/user/user.dart';
import 'package:rus_bal_dict/feature/auth/data/exceptions/exceptions.dart';
import 'package:rus_bal_dict/feature/auth/domain/repository/auth_repository.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

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

    test('Регистрация пользователя. Проверка на его наличие', () async {
      // Эмулируем вызов метода registerUser и выброс исключения UserAlreadyExistException.
      when(() => authRepository.registerUser(user: user)).thenAnswer(
          (_) async => Either.cond(
              false,
              UserAlreadyExistException('Пользователь уже зарегистирован'),
              user));

      // Вызываем метод registerUser и проверяем, что возвращается исключение UserAlreadyExistException.
      final result = await authRepository.registerUser(user: user);
      expect(result.isLeft, isTrue);
      expect(result.isRight, isFalse);
      expect(result.left, isA<UserAlreadyExistException>());
    });

    test('Регистрация пользователя. Проверка на то, что пользователь новый',
        () async {
      // Эмулируем вызов метода registerUser и выброс исключения UserAlreadyExistException.
      when(() => authRepository.registerUser(user: user)).thenAnswer(
          (_) async => Either.cond(
              true,
              UserAlreadyExistException('Пользователь уже зарегистирован'),
              user));

      // Вызываем метод registerUser и проверяем, что возвращается исключение UserAlreadyExistException.
      final result = await authRepository.registerUser(user: user);
      expect(result.isLeft, isFalse);
      expect(result.isRight, isTrue);
      expect(result.right, isA<User>());
    });
    test('Вход пользователя в аккаунт. Проверка на успешность входа', () async {
      const email = 'johndoe@example.com';
      const password = 'password';
      when(() => authRepository.signIn(email: email, password: password))
          .thenAnswer((_) async => Either.cond(true, Exception(), user));
      final signedUserEither =
          await authRepository.signIn(email: email, password: password);
      expect(signedUserEither.isLeft, isFalse);
      expect(signedUserEither.isRight, isTrue);
      expect(signedUserEither.right.email, email);
      expect(signedUserEither.right.password, password);
      expect(signedUserEither.right, user);
      expect(signedUserEither.right, isA<User>());
    });

    test('Вход пользователя в аккаунт. Проверка на неправильные почту и пароль',
        () async {
      const email = 'johnsnow@gameofthrones.ru';
      const password = 'WinterIsNear';
      when(() => authRepository.signIn(email: email, password: password))
          .thenAnswer((_) async => Either.cond(
              false, UserNotFoundException('Пользователь не найден'), user));
      final signFailedEither =
          await authRepository.signIn(email: email, password: password);
      expect(signFailedEither.isLeft, isTrue);
      expect(signFailedEither.isRight, isFalse);
      expect(user.email != email || user.password != password, isTrue);
      expect(signFailedEither.left, isException);
      expect(signFailedEither.left, isA<UserNotFoundException>());
    });

    test('Проверка на успешный вызов функции выхода из аккаунта', () async {
      when(() => authRepository.signOut())
          .thenAnswer((_) async => Either.cond(true, Exception(), null));

      await authRepository.signOut();

      verify(() => authRepository.signOut()).called(1);
    });

    test('Проверка на успешный вызов отправки кода восстановления пароля',
        () async {
      final randomCode = Random().nextInt(999999) + 100000;
      const email = 'user@mail.ru';
      when(() => authRepository.sendCodeToEmail(email: email))
          .thenAnswer((_) async => Either.cond(true, Exception(), randomCode));
      final code = await authRepository.sendCodeToEmail(email: email);
      expect(code.isLeft, isFalse);
      expect(code.isRight, isTrue);
      expect(code.right, randomCode);
      expect(code.right, isA<int>());
    });

    test('Проверка на ошибку отправки кода.', () async {
      final randomCode = Random().nextInt(999999) + 100000;
      const email = 'user@mail.ru';
      when(() => authRepository.sendCodeToEmail(email: email))
          .thenAnswer((_) async => Either.cond(false, Exception(), randomCode));
      final codeEitherWithError =
          await authRepository.sendCodeToEmail(email: email);
      expect(codeEitherWithError.isLeft, isTrue);
      expect(codeEitherWithError.isRight, isFalse);
      expect(codeEitherWithError.left, isA<Exception>());
    });

    test('Проверка на смену пароля', () async {
      const email = 'user@mail.ru';
      const newPassword = 'Password12345';
      when(() => authRepository.resetUserPassword(
              email: email, newPassword: newPassword))
          .thenAnswer((_) async => Either.cond(true, Exception(), null));
      await authRepository.resetUserPassword(
          email: email, newPassword: newPassword);

      verify(() => authRepository.resetUserPassword(
          email: email, newPassword: newPassword)).called(1);
    });
  });
}
