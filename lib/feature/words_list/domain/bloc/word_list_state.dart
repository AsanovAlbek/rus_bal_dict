import '../../../../core/model/word/word.dart';

sealed class WordsListState {
  static WordsListStateLoading loading() => WordsListStateLoading();

  static WordsListStateLoaded loaded(
          {List<Word> words = const <Word>[],
          int itemsCount = 50,
          int currentPage = 0,
          String query = '',
          bool isLastPage = false,
          bool canScrollUp = false,
          int totalWordsCount = 0}) =>
      WordsListStateLoaded(
          words: words,
          itemsCount: itemsCount,
          currentPage: currentPage,
          query: query,
          isLastPage: isLastPage,
          canScrollUp: canScrollUp,
          totalWordsCount: totalWordsCount);

  static WordsListStateError error({String? message}) =>
      WordsListStateError(message: message);
  static WordsListStateEmpty empty(
          {String message = 'Здесь пока ничего нет'}) =>
      WordsListStateEmpty(message);
}

class WordsListStateLoading extends WordsListState {}

class WordsListStateLoaded extends WordsListState {
  final List<Word> words;
  final int itemsCount;
  final int currentPage;
  final String query;
  final bool isLastPage;
  final int totalWordsCount;
  final bool canScrollUp;

  WordsListStateLoaded(
      {required this.words,
      required this.itemsCount,
      required this.currentPage,
      required this.query,
      required this.isLastPage,
      required this.canScrollUp,
      required this.totalWordsCount});

  WordsListStateLoaded copyWith(
      {List<Word>? words,
      int? itemsCount,
      int? currentPage,
      String? query,
      bool? isLastPage,
      bool? canScrollUp,
      int? totalWordsCount}) {
    return WordsListStateLoaded(
        words: words ?? this.words,
        itemsCount: itemsCount ?? this.itemsCount,
        currentPage: currentPage ?? this.currentPage,
        query: query ?? this.query,
        isLastPage: isLastPage ?? this.isLastPage,
        canScrollUp: canScrollUp ?? this.canScrollUp,
        totalWordsCount: totalWordsCount ?? this.totalWordsCount);
  }
}

class WordsListStateError extends WordsListState {
  final String? message;

  WordsListStateError({this.message});
}

class WordsListStateEmpty extends WordsListState {
  final String message;
  WordsListStateEmpty(this.message);
}
