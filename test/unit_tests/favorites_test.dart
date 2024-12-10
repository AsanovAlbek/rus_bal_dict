import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rus_bal_dict/core/model/word/word.dart';
import 'package:rus_bal_dict/feature/favorites/domain/repository/favorites_repository.dart';

import 'mock_models.dart';

class MockFavoritesRepository extends Mock implements FavoritesRepository {}

void main() {
  final repository = MockFavoritesRepository();
  

  group('Тестирование сохранения слов в избранное', () {
    test('Сохранение слова', () async {
      when(() => repository.saveToFavorites(mockWords.first))
          .thenAnswer((_) async => Either.cond(true, Exception(), testWord));

      final savedWord = await repository.saveToFavorites(mockWords.first);
      expect(savedWord.isLeft, isFalse);
      expect(savedWord.isRight, isTrue);
      expect(savedWord.right, mockWords.first);
      debugPrint('Проверка на сохранение слова в избранном. Успешно');
    });

    test('Сохранение слова. Проверка ошибки на сохранение', () async {
      when(() => repository.saveToFavorites(mockWords.first))
          .thenAnswer((_) async => Either.cond(false, Exception(), testWord));

      final savedWordWithError =
          await repository.saveToFavorites(mockWords.first);
      expect(savedWordWithError.isLeft, isTrue);
      expect(savedWordWithError.isRight, isFalse);
      expect(savedWordWithError.left, isA<Exception>());
      debugPrint('Проверка на ошибку сохранения в избранном. Успешно');
    });

    test('Получение сохраненных в избранном слов', () async {
      when(() => repository.getFavoriteWords()).thenAnswer(
          (_) async => Either.cond(true, Exception(), mockWords));
      final favoritesSuccessEither = await repository.getFavoriteWords();
      expect(favoritesSuccessEither.isLeft, isFalse);
      expect(favoritesSuccessEither.isRight, isTrue);
      expect(favoritesSuccessEither.right, mockWords);
      expect(favoritesSuccessEither.right, isA<List<Word>>());
      debugPrint('Получение слов из избранного. Успешно');
    });

    test('Тестирование ошибки получения сохраненных слов', () async {
      when(() => repository.getFavoriteWords()).thenAnswer(
          (_) async => Either.cond(false, Exception(), mockWords));
      final failFavoritesEither = await repository.getFavoriteWords();
      expect(failFavoritesEither.isLeft, isTrue);
      expect(failFavoritesEither.isRight, isFalse);
      expect(failFavoritesEither.left, isA<Exception>());
      debugPrint('Проверка на ошибку получения слов из избранного. Успешно');
    });

    test('Тестирование успешного удаления сохраненных в избранном слов', () async {
      when(() => repository.deleteFromFavorites(testWord)).thenAnswer(
          (_) async => Either.cond(true, Exception(), testWord));
      final deleteEitherSuccess = await repository.deleteFromFavorites(testWord);
      expect(deleteEitherSuccess.isLeft, isFalse);
      expect(deleteEitherSuccess.isRight, isTrue);
      expect(deleteEitherSuccess.right, testWord);
      debugPrint('Удаление сохраненных в избранном слов. Успешно');
    });

    test('Тестирование ошибки удаления сохраненного в избранном слова', () async {
      when(() => repository.deleteFromFavorites(testWord)).thenAnswer((_) async => Either.cond(false, Exception(), testWord));
      final deleteEitherFail = await repository.deleteFromFavorites(testWord);
      expect(deleteEitherFail.isLeft, isTrue);
      expect(deleteEitherFail.isRight, isFalse);
      expect(deleteEitherFail.left, isA<Exception>());
      debugPrint('Проверка на ошибку удаления сохраненных слов. Успешно');
    });
  });
}
