import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorite_word.freezed.dart';
part 'favorite_word.g.dart';

@freezed
class FavoriteWord with _$FavoriteWord {
  const factory FavoriteWord(
      {@JsonKey(name: 'id') @Default(0) int id,
      @JsonKey(name: 'user_id') @Default(0) int userId,
      @JsonKey(name: 'word_id') @Default(0) int wordId}) = _FavoriteWord;
  factory FavoriteWord.fromJson(Map<String, dynamic> json) =>
      _$FavoriteWordFromJson(json);
}
