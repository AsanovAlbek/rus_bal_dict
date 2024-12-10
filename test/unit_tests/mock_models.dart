import 'package:mocktail/mocktail.dart';
import 'package:rus_bal_dict/core/model/word/word.dart';

var mockWords = [
  const Word(id: 1, word: 'АБА'),
  const Word(id: 2, word: 'АБАЗА')
];

const testWord = Word(id: 1, word: 'АБА');

void verifyOnce<T>(T Function() testAction) => verify(testAction).called(1);