// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'mail_models.freezed.dart';
part 'mail_models.g.dart';

@freezed
class GetCodeResponse with _$GetCodeResponse {
  const factory GetCodeResponse(
          {@JsonKey(name: 'success') @Default(false) bool success,
          @JsonKey(name: 'message') @Default('') String message}) =
      _GetCodeResponse;

  factory GetCodeResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCodeResponseFromJson(json);
}
