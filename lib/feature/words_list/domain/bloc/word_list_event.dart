import '../../../../core/model/word.dart';

sealed class WordsListEvent {
  static WordsListEventFetch fetch(
          {String? query,
          int? page,
          int? size,
          Function(List<Word> words, int totalCount)? onSuccess,
          Function(Exception?)? onError}) =>
      WordsListEventFetch(query: query, page: page, size: size);
}

class WordsListEventFetch extends WordsListEvent {
  final String? query;
  final int? page;
  final int? size;
  final Function(List<Word> words, int totalCount)? onSuccess;
  final Function(Exception?)? onError;

  WordsListEventFetch({this.query = '', this.page = 0, this.size = 100, this.onSuccess, this.onError});
}
