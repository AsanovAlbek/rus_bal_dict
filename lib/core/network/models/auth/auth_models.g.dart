// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserRegisterResponseImpl _$$UserRegisterResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$UserRegisterResponseImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      email: json['email'] as String? ?? '',
      isActive: json['is_active'] as bool? ?? true,
      isAdmin: json['is_admin'] as bool? ?? false,
      imei: json['imei'] as String? ?? '',
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$$UserRegisterResponseImplToJson(
        _$UserRegisterResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'is_active': instance.isActive,
      'is_admin': instance.isAdmin,
      'imei': instance.imei,
      'name': instance.name,
    };

_$RegisterResponseImpl _$$RegisterResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$RegisterResponseImpl(
      message: json['message'] as String? ?? '',
      user: json['user'] == null
          ? const UserRegisterResponse()
          : UserRegisterResponse.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RegisterResponseImplToJson(
        _$RegisterResponseImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'user': instance.user,
    };

_$TokenResponseImpl _$$TokenResponseImplFromJson(Map<String, dynamic> json) =>
    _$TokenResponseImpl(
      accessToken: json['access_token'] as String? ?? '',
      refreshToken: json['refresh_token'] as String? ?? '',
      tokenType: json['token_type'] as String? ?? '',
    );

Map<String, dynamic> _$$TokenResponseImplToJson(_$TokenResponseImpl instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
      'token_type': instance.tokenType,
    };

_$UseResponseImpl _$$UseResponseImplFromJson(Map<String, dynamic> json) =>
    _$UseResponseImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      email: json['email'] as String? ?? '',
      name: json['name'] as String? ?? '',
      isActive: json['is_active'] as bool? ?? false,
      isAdmin: json['is_admin'] as bool? ?? false,
      imei: json['imei'] as String? ?? '',
    );

Map<String, dynamic> _$$UseResponseImplToJson(_$UseResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'is_active': instance.isActive,
      'is_admin': instance.isAdmin,
      'imei': instance.imei,
    };

_$RefreshTokenResponseImpl _$$RefreshTokenResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$RefreshTokenResponseImpl(
      accessToken: json['access_token'] as String? ?? '',
      tokenType: json['token_type'] as String? ?? 'Bearer',
    );

Map<String, dynamic> _$$RefreshTokenResponseImplToJson(
        _$RefreshTokenResponseImpl instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'token_type': instance.tokenType,
    };

_$UserLoginBodyImpl _$$UserLoginBodyImplFromJson(Map<String, dynamic> json) =>
    _$UserLoginBodyImpl(
      grantType: json['grant_type'] as String? ?? '',
      email: json['email'] as String? ?? '',
      password: json['password'] as String? ?? '',
      scope: json['scope'] as String? ?? '',
      clientSecret: json['client_secret'] as String? ?? '',
    );

Map<String, dynamic> _$$UserLoginBodyImplToJson(_$UserLoginBodyImpl instance) =>
    <String, dynamic>{
      'grant_type': instance.grantType,
      'email': instance.email,
      'password': instance.password,
      'scope': instance.scope,
      'client_secret': instance.clientSecret,
    };

_$UserRegisterBodyImpl _$$UserRegisterBodyImplFromJson(
        Map<String, dynamic> json) =>
    _$UserRegisterBodyImpl(
      email: json['email'] as String? ?? '',
      password: json['password'] as String? ?? '',
      isActive: json['is_active'] as bool? ?? true,
      imei: json['imei'] as String? ?? '',
      isAdmin: json['is_admin'] as bool? ?? false,
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$$UserRegisterBodyImplToJson(
        _$UserRegisterBodyImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'is_active': instance.isActive,
      'imei': instance.imei,
      'is_admin': instance.isAdmin,
      'name': instance.name,
    };

_$GetRestorePasswordCodeBodyImpl _$$GetRestorePasswordCodeBodyImplFromJson(
        Map<String, dynamic> json) =>
    _$GetRestorePasswordCodeBodyImpl(
      email: json['email'] as String? ?? '',
    );

Map<String, dynamic> _$$GetRestorePasswordCodeBodyImplToJson(
        _$GetRestorePasswordCodeBodyImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
    };

_$ChangePasswordBodyImpl _$$ChangePasswordBodyImplFromJson(
        Map<String, dynamic> json) =>
    _$ChangePasswordBodyImpl(
      email: json['email'] as String? ?? '',
      newPassword: json['new_password'] as String? ?? '',
    );

Map<String, dynamic> _$$ChangePasswordBodyImplToJson(
        _$ChangePasswordBodyImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'new_password': instance.newPassword,
    };

_$ResetPasswordBodyImpl _$$ResetPasswordBodyImplFromJson(
        Map<String, dynamic> json) =>
    _$ResetPasswordBodyImpl(
      email: json['email'] as String? ?? '',
      code: json['code'] as String? ?? '',
    );

Map<String, dynamic> _$$ResetPasswordBodyImplToJson(
        _$ResetPasswordBodyImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'code': instance.code,
    };

_$UserActivationBodyImpl _$$UserActivationBodyImplFromJson(
        Map<String, dynamic> json) =>
    _$UserActivationBodyImpl(
      code: json['code'] as String? ?? '',
    );

Map<String, dynamic> _$$UserActivationBodyImplToJson(
        _$UserActivationBodyImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
    };

_$RefreshTokenBodyImpl _$$RefreshTokenBodyImplFromJson(
        Map<String, dynamic> json) =>
    _$RefreshTokenBodyImpl(
      refreshToken: json['token'] as String? ?? '',
    );

Map<String, dynamic> _$$RefreshTokenBodyImplToJson(
        _$RefreshTokenBodyImpl instance) =>
    <String, dynamic>{
      'token': instance.refreshToken,
    };
