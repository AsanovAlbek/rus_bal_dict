import '../../../../core/model/word.dart';

abstract interface class HistoryRepository {
  Stream<Word> wordsFromHistory();
  Future<void> saveWord(Word word);
  Future<List<Word>> clearHistory();
}