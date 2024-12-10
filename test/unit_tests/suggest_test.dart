import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rus_bal_dict/core/model/word/suggest_word.dart';
import 'package:rus_bal_dict/feature/profile/domain/repository/suggest_word_repository.dart';

import 'mock_models.dart';

class MockSuggestRepository extends Mock implements SuggestWordRepository {}

void main() {
  final repository = MockSuggestRepository();
  const testSuggestWord = SuggestWord(id: 1, word: 'word', meaning: 'meaning', userId: 1);
  group('Проверка на предложение слова пользователем',() {
    test('Тест на успешное предложение слова', () async {
      when(() => repository.suggestWord(testSuggestWord)).thenAnswer((_) => Future.value(null));
      await repository.suggestWord(testSuggestWord);
      verifyOnce(() => repository.suggestWord(testSuggestWord));
      debugPrint('Предложить слово. Успешно');
    });

    test('Тест на успешное предложение слова', () async {
      when(() => repository.suggestWord(testSuggestWord)).thenThrow(Exception());
      expect(() => repository.suggestWord(testSuggestWord), throwsA(isA<Exception>()));
      debugPrint('Проверка на ошибку при предложении слова. Успешно');
    });
  });
}