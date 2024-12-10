import 'dart:typed_data';

import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rus_bal_dict/feature/word_detail/domain/repository/detail_repository.dart';

class MockWordDetailRepository extends Mock implements DetailRepository {}

void main() {
  late MockWordDetailRepository repository;
  const testAudioPath = 'example/folder/file.mp3';
  setUp(() {
    repository = MockWordDetailRepository();
  });
  group('Проверка на детали слова', () {
    test('Тест на наличие аудиозаписи. Успешно', () async {
      when(() => repository.getAudioByPath(audioPath: any<String>(named: 'audioPath')))
          .thenAnswer(
              (_) async => Either.cond(true, Exception(), Uint8List(16)));

      final successEither =
          await repository.getAudioByPath(audioPath: testAudioPath);
      expect(successEither.isLeft, isFalse);
      expect(successEither.isRight, isTrue);
      expect(successEither.right, isNotNull);
      expect(successEither.right, isA<Uint8List?>());
    });

    test('Проверка на отсутсвие аудиозаписи по слову', () async {
      when(() => repository.getAudioByPath(audioPath: any<String>(named: 'audioPath')))
          .thenAnswer((_) async =>
              Either.cond<Exception, Uint8List?>(true, Exception(), null));

      final notFoundAudioEither =
          await repository.getAudioByPath(audioPath: testAudioPath);
      expect(notFoundAudioEither.isLeft, isFalse);
      expect(notFoundAudioEither.isRight, isTrue);
      expect(notFoundAudioEither.right, isNull);
      expect(notFoundAudioEither.right, isA<Uint8List?>());
    });

    test('Проверка на иную ошибку получения аудиозаписи', () async {
      when(() => repository.getAudioByPath(audioPath: any<String>(named: 'audioPath')))
          .thenAnswer(
              (_) async => Either.cond(false, Exception(), Uint8List(16)));
      final errorEither = await repository.getAudioByPath(audioPath: testAudioPath);
      expect(errorEither.isLeft, isTrue);
      expect(errorEither.isRight, isFalse);
      expect(errorEither.left, isException);
    });
  });
}
