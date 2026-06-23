// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_models.freezed.dart';
part 'auth_models.g.dart';

// Responses
@freezed
class UserRegisterResponse with _$UserRegisterResponse {
  const factory UserRegisterResponse(
      {@JsonKey(name: 'id') @Default(0) int id,
      @JsonKey(name: 'email') @Default('') String email,
      @JsonKey(name: 'is_active') @Default(true) bool isActive,
      @JsonKey(name: 'is_admin') @Default(false) bool isAdmin,
      @JsonKey(name: 'imei') @Default('') String imei,
      @JsonKey(name: 'name') @Default('') String name}) = _UserRegisterResponse;

  factory UserRegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$UserRegisterResponseFromJson(json);
}

@freezed
class RegisterResponse with _$RegisterResponse {
  const factory RegisterResponse({
    @JsonKey(name: 'message') @Default('') String message,
    @JsonKey(name: 'user')
    @Default(UserRegisterResponse())
    UserRegisterResponse user,
  }) = _RegisterResponse;

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);
}

@freezed
class TokenResponse with _$TokenResponse {
  const factory TokenResponse(
          {@JsonKey(name: 'access_token') @Default('') String accessToken,
          @JsonKey(name: 'refresh_token') @Default('') String refreshToken,
          @JsonKey(name: 'token_type') @Default('') String tokenType}) =
      _TokenResponse;

  factory TokenResponse.fromJson(Map<String, dynamic> json) =>
      _$TokenResponseFromJson(json);
}

@freezed
class UserResponse with _$UserResponse {
  const factory UserResponse(
      {@JsonKey(name: 'id') @Default(0) int id,
      @JsonKey(name: 'email') @Default('') String email,
      @JsonKey(name: 'name') @Default('') String name,
      @JsonKey(name: 'is_active') @Default(false) bool isActive,
      @JsonKey(name: 'is_admin') @Default(false) bool isAdmin,
      @JsonKey(name: 'imei') @Default('') String imei}) = _UseResponse;

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);
}

@freezed
class RefreshTokenResponse with _$RefreshTokenResponse {
  const factory RefreshTokenResponse(
          {@JsonKey(name: 'access_token') @Default('') String accessToken,
          @JsonKey(name: 'token_type') @Default('Bearer') String tokenType}) =
      _RefreshTokenResponse;

  factory RefreshTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenResponseFromJson(json);
}

@freezed
class UserActivationResponse with _$UserActivationResponse {
  const factory UserActivationResponse(
          {@JsonKey(name: 'message') @Default('') String message}) =
      _UserActivationResponse;

  factory UserActivationResponse.fromJson(Map<String, dynamic> json) =>
      _$UserActivationResponseFromJson(json);
}

@freezed
class ConfirmResetPasswordResponse with _$ConfirmResetPasswordResponse {
  const factory ConfirmResetPasswordResponse({
    @JsonKey(name: 'message') @Default('') String message,
    @JsonKey(name: 'success') @Default(false) bool success,
  }) = _ConfirmResetPasswordResponse;

  factory ConfirmResetPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ConfirmResetPasswordResponseFromJson(json);
}

// Bodies

@freezed
class UserLoginBody with _$UserLoginBody {
  const factory UserLoginBody(
          {@JsonKey(name: 'grant_type') @Default('') String grantType,
          @JsonKey(name: 'email') @Default('') String email,
          @JsonKey(name: 'password') @Default('') String password,
          @JsonKey(name: 'scope') @Default('') String scope,
          @JsonKey(name: 'client_secret') @Default('') String clientSecret}) =
      _UserLoginBody;
  factory UserLoginBody.fromJson(Map<String, dynamic> json) =>
      _$UserLoginBodyFromJson(json);
}

@freezed
class UserRegisterBody with _$UserRegisterBody {
  const factory UserRegisterBody(
      {@JsonKey(name: 'email') @Default('') String email,
      @JsonKey(name: 'password') @Default('') String password,
      @JsonKey(name: 'is_active') @Default(true) bool isActive,
      @JsonKey(name: 'imei') @Default('') String imei,
      @JsonKey(name: 'is_admin') @Default(false) bool isAdmin,
      @JsonKey(name: 'name') @Default('') String name}) = _UserRegisterBody;

  factory UserRegisterBody.fromJson(Map<String, dynamic> json) =>
      _$UserRegisterBodyFromJson(json);
}

@freezed
class GetRestorePasswordCodeBody with _$GetRestorePasswordCodeBody {
  const factory GetRestorePasswordCodeBody({
    @JsonKey(name: 'email') @Default('') String email,
  }) = _GetRestorePasswordCodeBody;

  factory GetRestorePasswordCodeBody.fromJson(Map<String, dynamic> json) =>
      _$GetRestorePasswordCodeBodyFromJson(json);
}

@freezed
class ChangePasswordBody with _$ChangePasswordBody {
  const factory ChangePasswordBody(
          {@JsonKey(name: 'email') @Default('') String email,
          @JsonKey(name: 'new_password') @Default('') String newPassword}) =
      _ChangePasswordBody;

  factory ChangePasswordBody.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordBodyFromJson(json);
}

@freezed
class ResetPasswordBody with _$ResetPasswordBody {
  const factory ResetPasswordBody(
      {@JsonKey(name: 'email') @Default('') String email,
      @JsonKey(name: 'code') @Default('') String code}) = _ResetPasswordBody;

  factory ResetPasswordBody.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordBodyFromJson(json);
}

@freezed
class UserActivationBody with _$UserActivationBody {
  const factory UserActivationBody(
      {@JsonKey(name: 'code') @Default('') String code}) = _UserActivationBody;

  factory UserActivationBody.fromJson(Map<String, dynamic> json) =>
      _$UserActivationBodyFromJson(json);
}

@freezed
class RefreshTokenBody with _$RefreshTokenBody {
  const factory RefreshTokenBody(
          {@JsonKey(name: 'token') @Default('') String refreshToken}) =
      _RefreshTokenBody;

  factory RefreshTokenBody.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenBodyFromJson(json);
}
