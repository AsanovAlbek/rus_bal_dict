import 'package:freezed_annotation/freezed_annotation.dart';

part 'suggest_word.freezed.dart';
part 'suggest_word.g.dart';

@freezed
class SuggestWord with _$SuggestWord {
  const factory SuggestWord(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'word') @Default('') String word,
      @JsonKey(name: 'meaning') @Default('') String meaning,
      @JsonKey(name: 'user_id') @Default(0) int userId}) = _SuggestWord;

  factory SuggestWord.fromJson(Map<String, dynamic> json) =>
      _$SuggestWordFromJson(json);
}
