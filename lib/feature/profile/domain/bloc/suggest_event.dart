import 'package:rus_bal_dict/core/model/word/suggest_word.dart';

sealed class SuggestEvent {}

class GetSuggestsEvent extends SuggestEvent {
  final String? name;
  final int? size;
  final Function(List<SuggestWord> suggests, int totalSuggestsCount)? onSuccess;
  final Function()? onError;

  GetSuggestsEvent({this.name, this.size, this.onSuccess, this.onError});
}

class SuggestWordEvent extends SuggestEvent {
  final String word;
  final String meaning;
  final Function(String? message)? onSuccess;
  final Function()? onError;

  SuggestWordEvent(this.word, this.meaning, {this.onSuccess, this.onError});
}
