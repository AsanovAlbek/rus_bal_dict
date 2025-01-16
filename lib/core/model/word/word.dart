// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'word.freezed.dart';
part 'word.g.dart';

@freezed
class Word with _$Word {
  const factory Word(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'name') @Default('') String word,
      @JsonKey(name: 'meaning') @Default('') String meaning,
      @JsonKey(name: 'audio_url') @Default('') String audioUrl,
      @JsonKey(name: 'audio_path') @Default('') String audioPath,
      @JsonKey(includeToJson: false, includeFromJson: false)
      @Default(false)
      bool isFavorite}) = _Word;
  factory Word.fromJson(Map<String, dynamic> json) => _$WordFromJson(json);
}
