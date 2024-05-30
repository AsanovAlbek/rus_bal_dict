import '../../../../core/model/word/word.dart';

abstract interface class HistoryRepository {
  Stream<Word> wordsFromHistory();
  Future<void> saveWord(Word word);
  Future<List<Word>> clearHistory();
}