import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rus_bal_dict/core/model/payment_info/payment_info.dart';
import 'package:rus_bal_dict/feature/profile/domain/repository/payment_repository.dart';

import 'mock_models.dart';

class MockPaymentRepository extends Mock implements PaymentRepository {}

void main() {
  final repository = MockPaymentRepository();
  const freeUserPaymentInfo = UserPaymentInfo(dayLimit: 5, isSubscribe: false);
  const premiumUserPaymentInfo =
      UserPaymentInfo(dayLimit: 30, isSubscribe: true);
  const freeUserTriesLimit = 5;
  const amount = "300";
  const email = "user@mail.ru";
  final uri = Uri.dataFromString('https://example.com');
  group('Тестирование логики платежей', () {
    test('Тест на успешное получение страницы с оплатой', () async {
      when(() => repository.getPaymentWebViewBody(amount: amount, email: email))
          .thenAnswer((_) async => uri);
      final paymentUriSuccess =
          await repository.getPaymentWebViewBody(amount: amount, email: email);
      expect(paymentUriSuccess, isA<Uri?>());
      expect(paymentUriSuccess, isNotNull);
      expect(paymentUriSuccess, uri);
      debugPrint('Получение страницы для оплаты. Успешно');
    });

    test('Тест на ошибку получения страницы с оплатой', () {
      when(() => repository.getPaymentWebViewBody(amount: amount, email: email))
          .thenThrow(Exception());
      expect(
          () => repository.getPaymentWebViewBody(amount: amount, email: email),
          throwsA(isA<Exception>()));
      debugPrint('Проверка на ошибку получения страницы оплаты. Успешно');
    });

    test('Тест на ошибку перехода на нужную веб страницу', () async {
      when(() => repository.getPaymentWebViewBody(amount: amount, email: email))
          .thenAnswer((_) async => null);
      final notRedirectedUri =
          await repository.getPaymentWebViewBody(amount: amount, email: email);
      expect(notRedirectedUri, isNull);
      expect(notRedirectedUri, isA<Uri?>());
      debugPrint('Проверка на ошибку перехода на нужную веб страницу. Успешно');
    });

    test('Тест на успешное получение данных о пользователя с подпиской',
        () async {
      when(() => repository.paymentInfo()).thenAnswer(
          (_) async => Either.cond(true, Exception(), premiumUserPaymentInfo));
      final premiumUserInfo = await repository.paymentInfo();
      expect(premiumUserInfo.isLeft, isFalse);
      expect(premiumUserInfo.isRight, isTrue);
      expect(premiumUserInfo.right, isA<UserPaymentInfo>());
      expect(premiumUserInfo.right, premiumUserPaymentInfo);
      expect(premiumUserInfo.right.isSubscribe, isTrue);
      debugPrint('Получение данных о пользователе с подпиской. Успешно');
    });

    test('Тест на успешное получение данных о пользователе без подписки',
        () async {
      when(() => repository.paymentInfo()).thenAnswer(
          (_) async => Either.cond(true, Exception(), freeUserPaymentInfo));
      final freeUserInfo = await repository.paymentInfo();
      expect(freeUserInfo.isLeft, isFalse);
      expect(freeUserInfo.isRight, isTrue);
      expect(freeUserInfo.right, isA<UserPaymentInfo>());
      expect(freeUserInfo.right, freeUserPaymentInfo);
      expect(freeUserInfo.right.isSubscribe, isFalse);
      expect(freeUserInfo.right.dayLimit, lessThanOrEqualTo(freeUserTriesLimit));
      debugPrint('Получение данных о пользователе без подписки. Успешно');
    });

    test('Тест на ошибку получения данных о пользователе', () async {
      when(() => repository.paymentInfo()).thenAnswer(
          (_) async => Either.cond(false, Exception(), freeUserPaymentInfo));
      final errorUserInfo = await repository.paymentInfo();
      expect(errorUserInfo.isLeft, isTrue);
      expect(errorUserInfo.isRight, isFalse);
      expect(errorUserInfo.left, isA<Exception>());
      debugPrint('Проверка на ошибку получения данных о пользователе. Успешно');
    });

    test('Тест на подтверждение платежа', () async {
      when(() => repository.confirmPayment()).thenAnswer((_) async {});
      await repository.confirmPayment();
      verifyOnce(() => repository.confirmPayment());
      debugPrint('Подтверждение платежа. Успешно');
    });

    test('Тест на ошибку подтверждения платежа', () {
      when(() => repository.confirmPayment()).thenThrow(Exception());
      expect(() => repository.confirmPayment(), throwsA(isA<Exception>()));
      debugPrint('Проверка на ошибку подтверждения платежа. Успешно');
    });

    test('Тест на уменьшение попыток не премиум пользователя', () async {
      when(() => repository.decrementNonPremiumUserTries()).thenAnswer((_) async {});
      await repository.decrementNonPremiumUserTries();
      verifyOnce(() => repository.decrementNonPremiumUserTries());
      debugPrint('Уменьшение бесплатных попыток. Успешно');
    });

    test('Тест на ошибку уменьшения попыток не премиум пользователя', () {
      when(() => repository.decrementNonPremiumUserTries()).thenThrow(Exception());
      expect(() => repository.decrementNonPremiumUserTries(), throwsA(isA<Exception>()));
      debugPrint('Проверка на ошибку уменьшения бесплатных попыток. Успешно');
    });
  });
}
