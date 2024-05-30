import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/model/word/word.dart';

sealed class WordsListEvent {
  static WordsListEventFetch fetch(
          {String? query,
          int? size,
          Function(List<Word> words, int totalCount)? onSuccess,
          Function(Exception?)? onError}) =>
      WordsListEventFetch(query: query, size: size);
  static ChangeScrollableUpEvent changeScrollableUp({bool canScroll = false}) {
    return ChangeScrollableUpEvent(canScroll: canScroll);
  }
}

@immutable
class WordsListEventFetch extends WordsListEvent {
  final String? query;
  final int? size;
  final Function(List<Word> words, int totalCount)? onSuccess;
  final Function(Exception?)? onError;

  WordsListEventFetch({this.query = '', this.size = 100, this.onSuccess, this.onError});
}

@immutable
class ChangeScrollableUpEvent extends WordsListEvent {
  final bool canScroll;

  ChangeScrollableUpEvent({required this.canScroll});
}
