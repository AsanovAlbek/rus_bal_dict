import '../../../../core/model/word.dart';

sealed class HistoryEvent {
  static AddToHistoryEvent addToHistory({required Word word}) => AddToHistoryEvent(word: word);
  static ClearHistoryEvent clearHistory() => ClearHistoryEvent();
  static GetHistoryEvent getHistory() => GetHistoryEvent();
}

class AddToHistoryEvent extends HistoryEvent {
  final Word word;

  AddToHistoryEvent({required this.word});
}

class ClearHistoryEvent extends HistoryEvent {

}

class GetHistoryEvent extends HistoryEvent {

}