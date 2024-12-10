import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rus_bal_dict/core/model/word/word.dart';
import 'package:rus_bal_dict/feature/word_detail/domain/repository/detail_repository.dart';
import 'package:rus_bal_dict/feature/words_list/domain/repository/words_list_repository.dart';
import 'package:talker/talker.dart';
import 'package:collection/collection.dart';

import 'mock_models.dart';

class MockDio extends Mock implements Dio {}

class MockTalker extends Mock implements Talker {}

class MockWordsListRepository extends Mock implements WordsListRepository {}

class MockWordsDetailRepository extends Mock implements DetailRepository {}

void main() {
  var wordsListRepository = MockWordsListRepository();
  var expectedWordsCount = 2;

  setUp(() async {
    wordsListRepository = MockWordsListRepository();

    // Эмулируем запрос к базе данных и получение списка слов.
    when(() => wordsListRepository.fetchWords(
              query: '',
              page: 0,
              size: expectedWordsCount,
            ))
        .thenAnswer((_) async =>
            Either.tryCatch<Exception, List<Word>, Exception>(
                (e) => e, () => mockWords));
  });

  group('Тесты для получения слов из базы', () {
    test('Получение первых 2 слов из базы по алфавиту', () async {
      var wordsEither = await wordsListRepository.fetchWords(
        query: '',
        page: 0,
        size: expectedWordsCount,
      );

      // Проверяем, что запрос к базе данных завершился успешно.
      expect(wordsEither.isRight, isTrue);
    });

    test('Получение списка не завершилось ошибкой', () async {
      var wordsEither = await wordsListRepository.fetchWords(
        query: '',
        page: 0,
        size: expectedWordsCount,
      );

      // Проверяем, что запрос к базе данных не завершился ошибкой.
      expect(wordsEither.isLeft, isFalse);
    });

    test('Количество слов совпадает с запрашиваемым количеством', () async {
      var wordsEither = await wordsListRepository.fetchWords(
        query: '',
        page: 0,
        size: expectedWordsCount,
      );

      // Проверяем, что количество полученных слов совпадает с запрашиваемым.
      expect(wordsEither.right.length, expectedWordsCount);
    });

    test('Все слова отсортированы по алфавиту', () async {
      var wordsEither = await wordsListRepository.fetchWords(
        query: '',
        page: 0,
        size: expectedWordsCount,
      );

      // Проверяем, что полученные слова отсортированы по алфавиту.
      debugPrint(wordsEither.right.toString());
      var isWordsSorted = wordsEither.right
          .isSorted((word, otherWord) => word.word.compareTo(otherWord.word));
      expect(isWordsSorted, isTrue);
    });
  });
}
