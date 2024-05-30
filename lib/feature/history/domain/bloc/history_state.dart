import '../../../../core/model/word/word.dart';

sealed class HistoryState {
  static HistoryStateLoading loading() => HistoryStateLoading();
  static HistoryStateError error([String? message]) => HistoryStateError(message: message);
  static HistoryStateLoaded loaded({List<Word> words = const <Word>[]}) => HistoryStateLoaded(wordsFromHistory: words);
}

class HistoryStateLoading extends HistoryState {}
class HistoryStateError extends HistoryState {
  final String? message;

  HistoryStateError({this.message});
}

class HistoryStateLoaded extends HistoryState {
  final List<Word> wordsFromHistory;

  HistoryStateLoaded({required this.wordsFromHistory});

  HistoryStateLoaded copyWith({List<Word>? words}) {
    return HistoryStateLoaded(wordsFromHistory: words ?? wordsFromHistory);
  }
}