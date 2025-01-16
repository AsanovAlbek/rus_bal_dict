// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rus_bal_dict/core/model/word/suggest_word.dart';
import 'package:rus_bal_dict/core/model/word/word.dart';
import 'package:rus_bal_dict/feature/word_detail/presentation/detail.dart';

part 'suggest_models.freezed.dart';
part 'suggest_models.g.dart';

//Responses
@freezed
class SuggestResponse with _$SuggestResponse {
  const factory SuggestResponse(
      {@JsonKey(name: 'message') @Default('') String message,
      @JsonKey(name: 'suggest_word')
      @Default(SuggestWord())
      SuggestWord suggestWord}) = _SuggestResponse;

  factory SuggestResponse.fromJson(Map<String, dynamic> json) =>
      _$SuggestResponseFromJson(json);
}

@freezed
class SuggestAcceptResponse with _$SuggestAcceptResponse {
  const factory SuggestAcceptResponse(
      {@JsonKey(name: 'message') @Default('') String message,
      @JsonKey(name: 'suggest') @Default(SuggestWord()) SuggestWord suggestWord,
      @JsonKey(name: 'word')
      @Default(Word())
      Word word}) = _SuggestAcceptResponse;

  factory SuggestAcceptResponse.fromJson(Map<String, dynamic> json) =>
      _$SuggestAcceptResponseFromJson(json);
}

@freezed
class SuggestRejectResponse with _$SuggestRejectResponse {
  const factory SuggestRejectResponse(
      {@JsonKey(name: 'message') @Default('') String message,
      @JsonKey(name: 'suggest') @Default(SuggestWord()) SuggestWord suggestWord,
      @JsonKey(name: 'word')
      @Default(Word())
      Word word}) = _SuggestRejectResponse;

  factory SuggestRejectResponse.fromJson(Map<String, dynamic> json) =>
      _$SuggestRejectResponseFromJson(json);
}

// Bodies
@freezed
class GetSuggestsBody with _$GetSuggestsBody {
  const factory GetSuggestsBody({
    @JsonKey(name: 'user_id') @Default(0) int userId,
    @JsonKey(name: 'name') @Default('') String name,
    @JsonKey(name: 'page') @Default(0) int page,
    @JsonKey(name: 'size') @Default(100) int size,
  }) = _GetSuggestsBody;

  factory GetSuggestsBody.fromJson(Map<String, dynamic> json) =>
      _$GetSuggestsBodyFromJson(json);
}

@freezed
class GetAllSuggestsBody with _$GetAllSuggestsBody {
  const factory GetAllSuggestsBody({
    @JsonKey(name: 'user_id') @Default(0) int userId,
    @JsonKey(name: 'name') @Default('') String name,
    @JsonKey(name: 'page') @Default(0) int page,
    @JsonKey(name: 'size') @Default(100) int size,
  }) = _GetAllSuggestsBody;

  factory GetAllSuggestsBody.fromJson(Map<String, dynamic> json) =>
      _$GetAllSuggestsBodyFromJson(json);
}

@freezed
class CreateSuggestBody with _$CreateSuggestBody {
  const factory CreateSuggestBody(
          {@JsonKey(name: 'word') @Default('') String word,
          @JsonKey(name: 'meaning') @Default('') String meaning}) =
      _CreateSuggestBody;

  factory CreateSuggestBody.fromJson(Map<String, dynamic> json) =>
      _$CreateSuggestBodyFromJson(json);
}
