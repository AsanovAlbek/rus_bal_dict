import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rus_bal_dict/core/model/word/word.dart';
import 'package:rus_bal_dict/feature/history/domain/repository/history_repository.dart';

import 'mock_models.dart';

class MockHistoryRepository extends Mock implements HistoryRepository {}

void main() {
  final repository = MockHistoryRepository();
  group('Тестирование истории поиска и просмотра слов', () {
    test('Получение слов из истории поиска', () async {
      when(() => repository.wordsFromHistory())
          .thenAnswer((_) => Stream.fromIterable(mockWords));

      final wordsStream = repository.wordsFromHistory();
      expect(wordsStream, isA<Stream<Word>>());
      expect(await wordsStream.first, mockWords.first);
      expect(await wordsStream.toList(), mockWords);
      debugPrint('Получение слов из истории просмотров. Успешно');
    });

    test('Тестирование ошибки получения истории поиска', () async {
      when(() => repository.wordsFromHistory()).thenThrow(Exception());
      expect(() => repository.wordsFromHistory(), throwsA(isA<Exception>()));
      debugPrint('Проверка на ошибку получения истории слов. Успешно');
    });


    test('Тестирование сохранения слова в историю', () async {
      when(() => repository.saveWord(testWord)).thenAnswer((_) => Future.value(null));
      await repository.saveWord(testWord);
      verify(() => repository.saveWord(testWord)).called(1);
      debugPrint('Сохранение слова в историю. Успешно');
    });

    test('Тестирование ошибки сохранения слова в историю', () async {
      when(() => repository.saveWord(testWord)).thenThrow(Exception());
      expect(() => repository.saveWord(testWord), throwsA(isA<Exception>()));
      debugPrint('Проверка на ошибку сохранения слова в историю. Успешно');
    });

    test('Удаление всей истории слов', () async {
      when(() => repository.clearHistory()).thenAnswer((_) async => mockWords);
      final deletedHistory = await repository.clearHistory();
      expect(deletedHistory, isA<List<Word>>());
      expect(deletedHistory, mockWords);
      verify(() => repository.clearHistory()).called(1);
      debugPrint('Удаление всей истории слов. Успешно');
    });

    test('Тестирование ошибки удаления истории слов', () async {
      when(() => repository.clearHistory()).thenThrow(Exception());
      expect(() => repository.clearHistory(), throwsA(isA<Exception>()));
      debugPrint('Проверка на ошибку удаления истории слов. Успешно');
    });
  });
}
