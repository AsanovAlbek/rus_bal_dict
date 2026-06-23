import 'package:mocktail/mocktail.dart';
import 'package:rus_bal_dict/core/model/word/suggest_word.dart';
import 'package:rus_bal_dict/core/model/word/word.dart';

var mockWords = [
  const Word(id: 1, word: 'АБА'),
  const Word(id: 2, word: 'АБАЗА')
];

const mockSuggests = [
    SuggestWord(id: 1, word: 'АЛЮМИНИЙ'),
    SuggestWord(id: 2, word: 'АЛЮМИН'),
    SuggestWord(id: 3, word: 'АЛЬПИНИСТ'),
    SuggestWord(id: 4, word: 'АЛЬПИНИЗМ'),
    SuggestWord(id: 5, word: 'АЛЬМАНАХ'),
];

const testWord = Word(id: 1, word: 'АБА');

void verifyOnce<T>(T Function() testAction) => verify(testAction).called(1);
