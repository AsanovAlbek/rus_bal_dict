import '../../../../core/model/word.dart';

sealed class WordsListState {
  static WordsListStateLoading loading() => WordsListStateLoading();

  static WordsListStateLoaded loaded({List<Word> words = const <Word>[],
    int itemsCount = 50,
    int currentPage = 0,
    String query = '',
    int totalWordsCount = 0}) =>
      WordsListStateLoaded(
          words: words,
          itemsCount: itemsCount,
          currentPage: currentPage,
          query: query,
          totalWordsCount: totalWordsCount);

  static WordsListStateError error({String? message}) => WordsListStateError(message: message);
}

class WordsListStateLoading extends WordsListState {}

class WordsListStateLoaded extends WordsListState {
  final List<Word> words;
  final int itemsCount;
  final int currentPage;
  final String query;
  final bool isLastPage;
  final int totalWordsCount;

  WordsListStateLoaded({this.words = const <Word>[],
    this.itemsCount = 100,
    this.currentPage = 0,
    this.query = '',
    this.isLastPage = false,
    this.totalWordsCount = 0});

  WordsListStateLoaded copyWith(
      {List<Word>? words, int? itemsCount, int? currentPage, String? query, bool? isLastPage, int? totalWordsCount}) {
    return WordsListStateLoaded(
        words: words ?? this.words,
        itemsCount: itemsCount ?? this.itemsCount,
        currentPage: currentPage ?? this.currentPage,
        query: query ?? this.query,
        isLastPage: isLastPage ?? this.isLastPage,
        totalWordsCount: totalWordsCount ?? this.totalWordsCount);
  }
}

class WordsListStateError extends WordsListState {
  final String? message;

  WordsListStateError({this.message});
}
