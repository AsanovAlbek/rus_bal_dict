// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'token.freezed.dart';
part 'token.g.dart';

@freezed
class Token with _$Token {
  const factory Token({
    @JsonKey(name: 'access_token') @Default('') String accessToken,
    @JsonKey(name: 'refresh_token') @Default('') String refreshToken, 
    @JsonKey(name: 'token_type') @Default('Bearer') String tokenType,
  }) = _Token;

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);
}