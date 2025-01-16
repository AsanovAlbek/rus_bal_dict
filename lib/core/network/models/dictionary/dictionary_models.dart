// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rus_bal_dict/core/model/word/word.dart';

part 'dictionary_models.freezed.dart';
part 'dictionary_models.g.dart';

//Responses
@freezed
class WordActionResponse with _$WordActionResponse {
  const factory WordActionResponse({
    @JsonKey(name: 'message') @Default('') String message,
    @JsonKey(name: 'word') @Default('') Word word
  }) = _WordActionResponse;

  factory WordActionResponse.fromJson(Map<String, dynamic> json) => _$WordActionResponseFromJson(json);
}

//Bodies
@freezed
class OnlyWordBody with _$OnlyWordBody {
  const factory OnlyWordBody({
    @JsonKey(name: 'word') @Default(Word()) Word word
  }) = _OnlyWordBody;

  factory OnlyWordBody.fromJson(Map<String, dynamic> json) => _$OnlyWordBodyFromJson(json);
}

@freezed
class RemoveWordBody with _$RemoveWordBody {
  const factory RemoveWordBody({
    @JsonKey(name: 'word_id') @Default(-1) int wordId 
  }) = _RemoveWordBody;

  factory RemoveWordBody.fromJson(Map<String, dynamic> json) => _$RemoveWordBodyFromJson(json);
}

@freezed
class GetWordsBody with _$GetWordsBody {
  const factory GetWordsBody({
    @JsonKey(name: 'name') @Default('') String name,
    @JsonKey(name: 'page') @Default(0) int page,
    @JsonKey(name: 'size') @Default(100) int size
  }) = _GetWordsBody;

  factory GetWordsBody.fromJson(Map<String, dynamic> json) => _$GetWordsBodyFromJson(json);
}

@freezed
class WordByIdBody with _$WordByIdBody {
  const factory WordByIdBody({
    @JsonKey(name: 'id') @Default(-1) int id
  }) = _WordByIdBody;

  factory WordByIdBody.fromJson(Map<String, dynamic> json) => _$WordByIdBodyFromJson(json);
}

