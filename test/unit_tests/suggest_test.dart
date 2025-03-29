import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rus_bal_dict/core/model/word/suggest_word.dart';
import 'package:rus_bal_dict/core/network/models/suggest/suggest_models.dart';
import 'package:rus_bal_dict/feature/profile/domain/repository/suggest_word_repository.dart';

import 'mock_models.dart';

class MockSuggestRepository extends Mock implements SuggestWordRepository {}

void main() {
  final repository = MockSuggestRepository();
  const testSuggestWord =
      SuggestWord(id: 1, word: 'word', meaning: 'meaning', userId: 1);
  group('Проверка на предложение слова пользователем', () {
    test('Тест на успешное предложение слова', () async {
      const mockResponse = SuggestResponse(
          message: "Слово отправлено на рассмотрение",
          suggestWord: testSuggestWord);
      when(() => repository.suggestWord(testSuggestWord)).thenAnswer(
          (_) async => Either.cond(true, Exception(), mockResponse));
      final suggestResponse = await repository.suggestWord(testSuggestWord);
      verifyOnce(() => repository.suggestWord(testSuggestWord));
      expect(suggestResponse.isRight, isTrue);
      expect(suggestResponse.isLeft, isFalse);
      expect(suggestResponse.right, mockResponse);
      debugPrint('Предложить слово. Успешно');
    });

    test("Тест на ошибку предложения слова", () async {
      const mockResponse = SuggestResponse(
          message: "Слово отправлено на рассмотрение",
          suggestWord: testSuggestWord);
      when(() => repository.suggestWord(testSuggestWord)).thenAnswer(
          (_) async => Either.cond(false, Exception(), mockResponse));
      final suggestResponse = await repository.suggestWord(testSuggestWord);
      verifyOnce(() => repository.suggestWord(testSuggestWord));
      expect(suggestResponse.isRight, isFalse);
      expect(suggestResponse.isLeft, isTrue);
      expect(suggestResponse.left, isA<Exception>());
    });

    test('Тест на получение слов, предложенных пользователем', () async {
      when(() => repository.suggestedWords(name: '', size: 5, page: 0))
          .thenAnswer(
              (_) async => Either.cond(true, Exception(), mockSuggests));

      final suggests = await repository.suggestedWords(name: '', size: 5, page: 0);
      verifyOnce(() => repository.suggestedWords(name: '', size: 5, page: 0));
      expect(suggests.isRight, isTrue);
      expect(suggests.isLeft, isFalse);
      expect(suggests.right, mockSuggests);
    });

    test('Тест на ошибку получения слов, предложенных пользователем', () async {
      when(() => repository.suggestedWords(name: '', size: 5, page: 0))
          .thenAnswer(
              (_) async => Either.cond(false, Exception(), mockSuggests));

      final suggests = await repository.suggestedWords(name: '', size: 5, page: 0);
      verifyOnce(() => repository.suggestedWords(name: '', size: 5, page: 0));
      expect(suggests.isRight, isFalse);
      expect(suggests.isLeft, isTrue);
      expect(suggests.left, isA<Exception>());
    });
  });
}
