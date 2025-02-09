// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserRegisterResponse _$UserRegisterResponseFromJson(Map<String, dynamic> json) {
  return _UserRegisterResponse.fromJson(json);
}

/// @nodoc
mixin _$UserRegisterResponse {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'email')
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  bool get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_admin')
  bool get isAdmin => throw _privateConstructorUsedError;
  @JsonKey(name: 'imei')
  String get imei => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;

  /// Serializes this UserRegisterResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserRegisterResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserRegisterResponseCopyWith<UserRegisterResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserRegisterResponseCopyWith<$Res> {
  factory $UserRegisterResponseCopyWith(UserRegisterResponse value,
          $Res Function(UserRegisterResponse) then) =
      _$UserRegisterResponseCopyWithImpl<$Res, UserRegisterResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'email') String email,
      @JsonKey(name: 'is_active') bool isActive,
      @JsonKey(name: 'is_admin') bool isAdmin,
      @JsonKey(name: 'imei') String imei,
      @JsonKey(name: 'name') String name});
}

/// @nodoc
class _$UserRegisterResponseCopyWithImpl<$Res,
        $Val extends UserRegisterResponse>
    implements $UserRegisterResponseCopyWith<$Res> {
  _$UserRegisterResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserRegisterResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? isActive = null,
    Object? isAdmin = null,
    Object? imei = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      isAdmin: null == isAdmin
          ? _value.isAdmin
          : isAdmin // ignore: cast_nullable_to_non_nullable
              as bool,
      imei: null == imei
          ? _value.imei
          : imei // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserRegisterResponseImplCopyWith<$Res>
    implements $UserRegisterResponseCopyWith<$Res> {
  factory _$$UserRegisterResponseImplCopyWith(_$UserRegisterResponseImpl value,
          $Res Function(_$UserRegisterResponseImpl) then) =
      __$$UserRegisterResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'email') String email,
      @JsonKey(name: 'is_active') bool isActive,
      @JsonKey(name: 'is_admin') bool isAdmin,
      @JsonKey(name: 'imei') String imei,
      @JsonKey(name: 'name') String name});
}

/// @nodoc
class __$$UserRegisterResponseImplCopyWithImpl<$Res>
    extends _$UserRegisterResponseCopyWithImpl<$Res, _$UserRegisterResponseImpl>
    implements _$$UserRegisterResponseImplCopyWith<$Res> {
  __$$UserRegisterResponseImplCopyWithImpl(_$UserRegisterResponseImpl _value,
      $Res Function(_$UserRegisterResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserRegisterResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? isActive = null,
    Object? isAdmin = null,
    Object? imei = null,
    Object? name = null,
  }) {
    return _then(_$UserRegisterResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      isAdmin: null == isAdmin
          ? _value.isAdmin
          : isAdmin // ignore: cast_nullable_to_non_nullable
              as bool,
      imei: null == imei
          ? _value.imei
          : imei // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserRegisterResponseImpl implements _UserRegisterResponse {
  const _$UserRegisterResponseImpl(
      {@JsonKey(name: 'id') this.id = 0,
      @JsonKey(name: 'email') this.email = '',
      @JsonKey(name: 'is_active') this.isActive = true,
      @JsonKey(name: 'is_admin') this.isAdmin = false,
      @JsonKey(name: 'imei') this.imei = '',
      @JsonKey(name: 'name') this.name = ''});

  factory _$UserRegisterResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserRegisterResponseImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'email')
  final String email;
  @override
  @JsonKey(name: 'is_active')
  final bool isActive;
  @override
  @JsonKey(name: 'is_admin')
  final bool isAdmin;
  @override
  @JsonKey(name: 'imei')
  final String imei;
  @override
  @JsonKey(name: 'name')
  final String name;

  @override
  String toString() {
    return 'UserRegisterResponse(id: $id, email: $email, isActive: $isActive, isAdmin: $isAdmin, imei: $imei, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserRegisterResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.isAdmin, isAdmin) || other.isAdmin == isAdmin) &&
            (identical(other.imei, imei) || other.imei == imei) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, email, isActive, isAdmin, imei, name);

  /// Create a copy of UserRegisterResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserRegisterResponseImplCopyWith<_$UserRegisterResponseImpl>
      get copyWith =>
          __$$UserRegisterResponseImplCopyWithImpl<_$UserRegisterResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserRegisterResponseImplToJson(
      this,
    );
  }
}

abstract class _UserRegisterResponse implements UserRegisterResponse {
  const factory _UserRegisterResponse(
      {@JsonKey(name: 'id') final int id,
      @JsonKey(name: 'email') final String email,
      @JsonKey(name: 'is_active') final bool isActive,
      @JsonKey(name: 'is_admin') final bool isAdmin,
      @JsonKey(name: 'imei') final String imei,
      @JsonKey(name: 'name') final String name}) = _$UserRegisterResponseImpl;

  factory _UserRegisterResponse.fromJson(Map<String, dynamic> json) =
      _$UserRegisterResponseImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'email')
  String get email;
  @override
  @JsonKey(name: 'is_active')
  bool get isActive;
  @override
  @JsonKey(name: 'is_admin')
  bool get isAdmin;
  @override
  @JsonKey(name: 'imei')
  String get imei;
  @override
  @JsonKey(name: 'name')
  String get name;

  /// Create a copy of UserRegisterResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserRegisterResponseImplCopyWith<_$UserRegisterResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

RegisterResponse _$RegisterResponseFromJson(Map<String, dynamic> json) {
  return _RegisterResponse.fromJson(json);
}

/// @nodoc
mixin _$RegisterResponse {
  @JsonKey(name: 'message')
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'user')
  UserRegisterResponse get user => throw _privateConstructorUsedError;

  /// Serializes this RegisterResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RegisterResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RegisterResponseCopyWith<RegisterResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterResponseCopyWith<$Res> {
  factory $RegisterResponseCopyWith(
          RegisterResponse value, $Res Function(RegisterResponse) then) =
      _$RegisterResponseCopyWithImpl<$Res, RegisterResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'message') String message,
      @JsonKey(name: 'user') UserRegisterResponse user});

  $UserRegisterResponseCopyWith<$Res> get user;
}

/// @nodoc
class _$RegisterResponseCopyWithImpl<$Res, $Val extends RegisterResponse>
    implements $RegisterResponseCopyWith<$Res> {
  _$RegisterResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RegisterResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? user = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserRegisterResponse,
    ) as $Val);
  }

  /// Create a copy of RegisterResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserRegisterResponseCopyWith<$Res> get user {
    return $UserRegisterResponseCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RegisterResponseImplCopyWith<$Res>
    implements $RegisterResponseCopyWith<$Res> {
  factory _$$RegisterResponseImplCopyWith(_$RegisterResponseImpl value,
          $Res Function(_$RegisterResponseImpl) then) =
      __$$RegisterResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'message') String message,
      @JsonKey(name: 'user') UserRegisterResponse user});

  @override
  $UserRegisterResponseCopyWith<$Res> get user;
}

/// @nodoc
class __$$RegisterResponseImplCopyWithImpl<$Res>
    extends _$RegisterResponseCopyWithImpl<$Res, _$RegisterResponseImpl>
    implements _$$RegisterResponseImplCopyWith<$Res> {
  __$$RegisterResponseImplCopyWithImpl(_$RegisterResponseImpl _value,
      $Res Function(_$RegisterResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of RegisterResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? user = null,
  }) {
    return _then(_$RegisterResponseImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserRegisterResponse,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RegisterResponseImpl implements _RegisterResponse {
  const _$RegisterResponseImpl(
      {@JsonKey(name: 'message') this.message = '',
      @JsonKey(name: 'user') this.user = const UserRegisterResponse()});

  factory _$RegisterResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$RegisterResponseImplFromJson(json);

  @override
  @JsonKey(name: 'message')
  final String message;
  @override
  @JsonKey(name: 'user')
  final UserRegisterResponse user;

  @override
  String toString() {
    return 'RegisterResponse(message: $message, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterResponseImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message, user);

  /// Create a copy of RegisterResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterResponseImplCopyWith<_$RegisterResponseImpl> get copyWith =>
      __$$RegisterResponseImplCopyWithImpl<_$RegisterResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RegisterResponseImplToJson(
      this,
    );
  }
}

abstract class _RegisterResponse implements RegisterResponse {
  const factory _RegisterResponse(
          {@JsonKey(name: 'message') final String message,
          @JsonKey(name: 'user') final UserRegisterResponse user}) =
      _$RegisterResponseImpl;

  factory _RegisterResponse.fromJson(Map<String, dynamic> json) =
      _$RegisterResponseImpl.fromJson;

  @override
  @JsonKey(name: 'message')
  String get message;
  @override
  @JsonKey(name: 'user')
  UserRegisterResponse get user;

  /// Create a copy of RegisterResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegisterResponseImplCopyWith<_$RegisterResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TokenResponse _$TokenResponseFromJson(Map<String, dynamic> json) {
  return _TokenResponse.fromJson(json);
}

/// @nodoc
mixin _$TokenResponse {
  @JsonKey(name: 'access_token')
  String get accessToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'refresh_token')
  String get refreshToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'token_type')
  String get tokenType => throw _privateConstructorUsedError;

  /// Serializes this TokenResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TokenResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TokenResponseCopyWith<TokenResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokenResponseCopyWith<$Res> {
  factory $TokenResponseCopyWith(
          TokenResponse value, $Res Function(TokenResponse) then) =
      _$TokenResponseCopyWithImpl<$Res, TokenResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'access_token') String accessToken,
      @JsonKey(name: 'refresh_token') String refreshToken,
      @JsonKey(name: 'token_type') String tokenType});
}

/// @nodoc
class _$TokenResponseCopyWithImpl<$Res, $Val extends TokenResponse>
    implements $TokenResponseCopyWith<$Res> {
  _$TokenResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TokenResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
    Object? tokenType = null,
  }) {
    return _then(_value.copyWith(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      tokenType: null == tokenType
          ? _value.tokenType
          : tokenType // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TokenResponseImplCopyWith<$Res>
    implements $TokenResponseCopyWith<$Res> {
  factory _$$TokenResponseImplCopyWith(
          _$TokenResponseImpl value, $Res Function(_$TokenResponseImpl) then) =
      __$$TokenResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'access_token') String accessToken,
      @JsonKey(name: 'refresh_token') String refreshToken,
      @JsonKey(name: 'token_type') String tokenType});
}

/// @nodoc
class __$$TokenResponseImplCopyWithImpl<$Res>
    extends _$TokenResponseCopyWithImpl<$Res, _$TokenResponseImpl>
    implements _$$TokenResponseImplCopyWith<$Res> {
  __$$TokenResponseImplCopyWithImpl(
      _$TokenResponseImpl _value, $Res Function(_$TokenResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of TokenResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
    Object? tokenType = null,
  }) {
    return _then(_$TokenResponseImpl(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      tokenType: null == tokenType
          ? _value.tokenType
          : tokenType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TokenResponseImpl implements _TokenResponse {
  const _$TokenResponseImpl(
      {@JsonKey(name: 'access_token') this.accessToken = '',
      @JsonKey(name: 'refresh_token') this.refreshToken = '',
      @JsonKey(name: 'token_type') this.tokenType = ''});

  factory _$TokenResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$TokenResponseImplFromJson(json);

  @override
  @JsonKey(name: 'access_token')
  final String accessToken;
  @override
  @JsonKey(name: 'refresh_token')
  final String refreshToken;
  @override
  @JsonKey(name: 'token_type')
  final String tokenType;

  @override
  String toString() {
    return 'TokenResponse(accessToken: $accessToken, refreshToken: $refreshToken, tokenType: $tokenType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TokenResponseImpl &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.tokenType, tokenType) ||
                other.tokenType == tokenType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, accessToken, refreshToken, tokenType);

  /// Create a copy of TokenResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TokenResponseImplCopyWith<_$TokenResponseImpl> get copyWith =>
      __$$TokenResponseImplCopyWithImpl<_$TokenResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TokenResponseImplToJson(
      this,
    );
  }
}

abstract class _TokenResponse implements TokenResponse {
  const factory _TokenResponse(
          {@JsonKey(name: 'access_token') final String accessToken,
          @JsonKey(name: 'refresh_token') final String refreshToken,
          @JsonKey(name: 'token_type') final String tokenType}) =
      _$TokenResponseImpl;

  factory _TokenResponse.fromJson(Map<String, dynamic> json) =
      _$TokenResponseImpl.fromJson;

  @override
  @JsonKey(name: 'access_token')
  String get accessToken;
  @override
  @JsonKey(name: 'refresh_token')
  String get refreshToken;
  @override
  @JsonKey(name: 'token_type')
  String get tokenType;

  /// Create a copy of TokenResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TokenResponseImplCopyWith<_$TokenResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) {
  return _UseResponse.fromJson(json);
}

/// @nodoc
mixin _$UserResponse {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'email')
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  bool get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_admin')
  bool get isAdmin => throw _privateConstructorUsedError;
  @JsonKey(name: 'imei')
  String get imei => throw _privateConstructorUsedError;

  /// Serializes this UserResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserResponseCopyWith<UserResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserResponseCopyWith<$Res> {
  factory $UserResponseCopyWith(
          UserResponse value, $Res Function(UserResponse) then) =
      _$UserResponseCopyWithImpl<$Res, UserResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'email') String email,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'is_active') bool isActive,
      @JsonKey(name: 'is_admin') bool isAdmin,
      @JsonKey(name: 'imei') String imei});
}

/// @nodoc
class _$UserResponseCopyWithImpl<$Res, $Val extends UserResponse>
    implements $UserResponseCopyWith<$Res> {
  _$UserResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? name = null,
    Object? isActive = null,
    Object? isAdmin = null,
    Object? imei = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      isAdmin: null == isAdmin
          ? _value.isAdmin
          : isAdmin // ignore: cast_nullable_to_non_nullable
              as bool,
      imei: null == imei
          ? _value.imei
          : imei // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UseResponseImplCopyWith<$Res>
    implements $UserResponseCopyWith<$Res> {
  factory _$$UseResponseImplCopyWith(
          _$UseResponseImpl value, $Res Function(_$UseResponseImpl) then) =
      __$$UseResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'email') String email,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'is_active') bool isActive,
      @JsonKey(name: 'is_admin') bool isAdmin,
      @JsonKey(name: 'imei') String imei});
}

/// @nodoc
class __$$UseResponseImplCopyWithImpl<$Res>
    extends _$UserResponseCopyWithImpl<$Res, _$UseResponseImpl>
    implements _$$UseResponseImplCopyWith<$Res> {
  __$$UseResponseImplCopyWithImpl(
      _$UseResponseImpl _value, $Res Function(_$UseResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? name = null,
    Object? isActive = null,
    Object? isAdmin = null,
    Object? imei = null,
  }) {
    return _then(_$UseResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      isAdmin: null == isAdmin
          ? _value.isAdmin
          : isAdmin // ignore: cast_nullable_to_non_nullable
              as bool,
      imei: null == imei
          ? _value.imei
          : imei // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UseResponseImpl implements _UseResponse {
  const _$UseResponseImpl(
      {@JsonKey(name: 'id') this.id = 0,
      @JsonKey(name: 'email') this.email = '',
      @JsonKey(name: 'name') this.name = '',
      @JsonKey(name: 'is_active') this.isActive = false,
      @JsonKey(name: 'is_admin') this.isAdmin = false,
      @JsonKey(name: 'imei') this.imei = ''});

  factory _$UseResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$UseResponseImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'email')
  final String email;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'is_active')
  final bool isActive;
  @override
  @JsonKey(name: 'is_admin')
  final bool isAdmin;
  @override
  @JsonKey(name: 'imei')
  final String imei;

  @override
  String toString() {
    return 'UserResponse(id: $id, email: $email, name: $name, isActive: $isActive, isAdmin: $isAdmin, imei: $imei)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UseResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.isAdmin, isAdmin) || other.isAdmin == isAdmin) &&
            (identical(other.imei, imei) || other.imei == imei));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, email, name, isActive, isAdmin, imei);

  /// Create a copy of UserResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UseResponseImplCopyWith<_$UseResponseImpl> get copyWith =>
      __$$UseResponseImplCopyWithImpl<_$UseResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UseResponseImplToJson(
      this,
    );
  }
}

abstract class _UseResponse implements UserResponse {
  const factory _UseResponse(
      {@JsonKey(name: 'id') final int id,
      @JsonKey(name: 'email') final String email,
      @JsonKey(name: 'name') final String name,
      @JsonKey(name: 'is_active') final bool isActive,
      @JsonKey(name: 'is_admin') final bool isAdmin,
      @JsonKey(name: 'imei') final String imei}) = _$UseResponseImpl;

  factory _UseResponse.fromJson(Map<String, dynamic> json) =
      _$UseResponseImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'email')
  String get email;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'is_active')
  bool get isActive;
  @override
  @JsonKey(name: 'is_admin')
  bool get isAdmin;
  @override
  @JsonKey(name: 'imei')
  String get imei;

  /// Create a copy of UserResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UseResponseImplCopyWith<_$UseResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RefreshTokenResponse _$RefreshTokenResponseFromJson(Map<String, dynamic> json) {
  return _RefreshTokenResponse.fromJson(json);
}

/// @nodoc
mixin _$RefreshTokenResponse {
  @JsonKey(name: 'access_token')
  String get accessToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'token_type')
  String get tokenType => throw _privateConstructorUsedError;

  /// Serializes this RefreshTokenResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RefreshTokenResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RefreshTokenResponseCopyWith<RefreshTokenResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RefreshTokenResponseCopyWith<$Res> {
  factory $RefreshTokenResponseCopyWith(RefreshTokenResponse value,
          $Res Function(RefreshTokenResponse) then) =
      _$RefreshTokenResponseCopyWithImpl<$Res, RefreshTokenResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'access_token') String accessToken,
      @JsonKey(name: 'token_type') String tokenType});
}

/// @nodoc
class _$RefreshTokenResponseCopyWithImpl<$Res,
        $Val extends RefreshTokenResponse>
    implements $RefreshTokenResponseCopyWith<$Res> {
  _$RefreshTokenResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RefreshTokenResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? tokenType = null,
  }) {
    return _then(_value.copyWith(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      tokenType: null == tokenType
          ? _value.tokenType
          : tokenType // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RefreshTokenResponseImplCopyWith<$Res>
    implements $RefreshTokenResponseCopyWith<$Res> {
  factory _$$RefreshTokenResponseImplCopyWith(_$RefreshTokenResponseImpl value,
          $Res Function(_$RefreshTokenResponseImpl) then) =
      __$$RefreshTokenResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'access_token') String accessToken,
      @JsonKey(name: 'token_type') String tokenType});
}

/// @nodoc
class __$$RefreshTokenResponseImplCopyWithImpl<$Res>
    extends _$RefreshTokenResponseCopyWithImpl<$Res, _$RefreshTokenResponseImpl>
    implements _$$RefreshTokenResponseImplCopyWith<$Res> {
  __$$RefreshTokenResponseImplCopyWithImpl(_$RefreshTokenResponseImpl _value,
      $Res Function(_$RefreshTokenResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of RefreshTokenResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? tokenType = null,
  }) {
    return _then(_$RefreshTokenResponseImpl(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      tokenType: null == tokenType
          ? _value.tokenType
          : tokenType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RefreshTokenResponseImpl implements _RefreshTokenResponse {
  const _$RefreshTokenResponseImpl(
      {@JsonKey(name: 'access_token') this.accessToken = '',
      @JsonKey(name: 'token_type') this.tokenType = 'Bearer'});

  factory _$RefreshTokenResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$RefreshTokenResponseImplFromJson(json);

  @override
  @JsonKey(name: 'access_token')
  final String accessToken;
  @override
  @JsonKey(name: 'token_type')
  final String tokenType;

  @override
  String toString() {
    return 'RefreshTokenResponse(accessToken: $accessToken, tokenType: $tokenType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefreshTokenResponseImpl &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.tokenType, tokenType) ||
                other.tokenType == tokenType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, accessToken, tokenType);

  /// Create a copy of RefreshTokenResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RefreshTokenResponseImplCopyWith<_$RefreshTokenResponseImpl>
      get copyWith =>
          __$$RefreshTokenResponseImplCopyWithImpl<_$RefreshTokenResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RefreshTokenResponseImplToJson(
      this,
    );
  }
}

abstract class _RefreshTokenResponse implements RefreshTokenResponse {
  const factory _RefreshTokenResponse(
          {@JsonKey(name: 'access_token') final String accessToken,
          @JsonKey(name: 'token_type') final String tokenType}) =
      _$RefreshTokenResponseImpl;

  factory _RefreshTokenResponse.fromJson(Map<String, dynamic> json) =
      _$RefreshTokenResponseImpl.fromJson;

  @override
  @JsonKey(name: 'access_token')
  String get accessToken;
  @override
  @JsonKey(name: 'token_type')
  String get tokenType;

  /// Create a copy of RefreshTokenResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RefreshTokenResponseImplCopyWith<_$RefreshTokenResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

UserActivationResponse _$UserActivationResponseFromJson(
    Map<String, dynamic> json) {
  return _UserActivationResponse.fromJson(json);
}

/// @nodoc
mixin _$UserActivationResponse {
  @JsonKey(name: 'message')
  String get message => throw _privateConstructorUsedError;

  /// Serializes this UserActivationResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserActivationResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserActivationResponseCopyWith<UserActivationResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserActivationResponseCopyWith<$Res> {
  factory $UserActivationResponseCopyWith(UserActivationResponse value,
          $Res Function(UserActivationResponse) then) =
      _$UserActivationResponseCopyWithImpl<$Res, UserActivationResponse>;
  @useResult
  $Res call({@JsonKey(name: 'message') String message});
}

/// @nodoc
class _$UserActivationResponseCopyWithImpl<$Res,
        $Val extends UserActivationResponse>
    implements $UserActivationResponseCopyWith<$Res> {
  _$UserActivationResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserActivationResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserActivationResponseImplCopyWith<$Res>
    implements $UserActivationResponseCopyWith<$Res> {
  factory _$$UserActivationResponseImplCopyWith(
          _$UserActivationResponseImpl value,
          $Res Function(_$UserActivationResponseImpl) then) =
      __$$UserActivationResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'message') String message});
}

/// @nodoc
class __$$UserActivationResponseImplCopyWithImpl<$Res>
    extends _$UserActivationResponseCopyWithImpl<$Res,
        _$UserActivationResponseImpl>
    implements _$$UserActivationResponseImplCopyWith<$Res> {
  __$$UserActivationResponseImplCopyWithImpl(
      _$UserActivationResponseImpl _value,
      $Res Function(_$UserActivationResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserActivationResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$UserActivationResponseImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserActivationResponseImpl implements _UserActivationResponse {
  const _$UserActivationResponseImpl(
      {@JsonKey(name: 'message') this.message = ''});

  factory _$UserActivationResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserActivationResponseImplFromJson(json);

  @override
  @JsonKey(name: 'message')
  final String message;

  @override
  String toString() {
    return 'UserActivationResponse(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserActivationResponseImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of UserActivationResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserActivationResponseImplCopyWith<_$UserActivationResponseImpl>
      get copyWith => __$$UserActivationResponseImplCopyWithImpl<
          _$UserActivationResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserActivationResponseImplToJson(
      this,
    );
  }
}

abstract class _UserActivationResponse implements UserActivationResponse {
  const factory _UserActivationResponse(
          {@JsonKey(name: 'message') final String message}) =
      _$UserActivationResponseImpl;

  factory _UserActivationResponse.fromJson(Map<String, dynamic> json) =
      _$UserActivationResponseImpl.fromJson;

  @override
  @JsonKey(name: 'message')
  String get message;

  /// Create a copy of UserActivationResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserActivationResponseImplCopyWith<_$UserActivationResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ConfirmResetPasswordResponse _$ConfirmResetPasswordResponseFromJson(
    Map<String, dynamic> json) {
  return _ConfirmResetPasswordResponse.fromJson(json);
}

/// @nodoc
mixin _$ConfirmResetPasswordResponse {
  @JsonKey(name: 'message')
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'success')
  bool get success => throw _privateConstructorUsedError;

  /// Serializes this ConfirmResetPasswordResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ConfirmResetPasswordResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConfirmResetPasswordResponseCopyWith<ConfirmResetPasswordResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConfirmResetPasswordResponseCopyWith<$Res> {
  factory $ConfirmResetPasswordResponseCopyWith(
          ConfirmResetPasswordResponse value,
          $Res Function(ConfirmResetPasswordResponse) then) =
      _$ConfirmResetPasswordResponseCopyWithImpl<$Res,
          ConfirmResetPasswordResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'message') String message,
      @JsonKey(name: 'success') bool success});
}

/// @nodoc
class _$ConfirmResetPasswordResponseCopyWithImpl<$Res,
        $Val extends ConfirmResetPasswordResponse>
    implements $ConfirmResetPasswordResponseCopyWith<$Res> {
  _$ConfirmResetPasswordResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConfirmResetPasswordResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? success = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConfirmResetPasswordResponseImplCopyWith<$Res>
    implements $ConfirmResetPasswordResponseCopyWith<$Res> {
  factory _$$ConfirmResetPasswordResponseImplCopyWith(
          _$ConfirmResetPasswordResponseImpl value,
          $Res Function(_$ConfirmResetPasswordResponseImpl) then) =
      __$$ConfirmResetPasswordResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'message') String message,
      @JsonKey(name: 'success') bool success});
}

/// @nodoc
class __$$ConfirmResetPasswordResponseImplCopyWithImpl<$Res>
    extends _$ConfirmResetPasswordResponseCopyWithImpl<$Res,
        _$ConfirmResetPasswordResponseImpl>
    implements _$$ConfirmResetPasswordResponseImplCopyWith<$Res> {
  __$$ConfirmResetPasswordResponseImplCopyWithImpl(
      _$ConfirmResetPasswordResponseImpl _value,
      $Res Function(_$ConfirmResetPasswordResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConfirmResetPasswordResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? success = null,
  }) {
    return _then(_$ConfirmResetPasswordResponseImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConfirmResetPasswordResponseImpl
    implements _ConfirmResetPasswordResponse {
  const _$ConfirmResetPasswordResponseImpl(
      {@JsonKey(name: 'message') this.message = '',
      @JsonKey(name: 'success') this.success = false});

  factory _$ConfirmResetPasswordResponseImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ConfirmResetPasswordResponseImplFromJson(json);

  @override
  @JsonKey(name: 'message')
  final String message;
  @override
  @JsonKey(name: 'success')
  final bool success;

  @override
  String toString() {
    return 'ConfirmResetPasswordResponse(message: $message, success: $success)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConfirmResetPasswordResponseImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.success, success) || other.success == success));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message, success);

  /// Create a copy of ConfirmResetPasswordResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConfirmResetPasswordResponseImplCopyWith<
          _$ConfirmResetPasswordResponseImpl>
      get copyWith => __$$ConfirmResetPasswordResponseImplCopyWithImpl<
          _$ConfirmResetPasswordResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConfirmResetPasswordResponseImplToJson(
      this,
    );
  }
}

abstract class _ConfirmResetPasswordResponse
    implements ConfirmResetPasswordResponse {
  const factory _ConfirmResetPasswordResponse(
          {@JsonKey(name: 'message') final String message,
          @JsonKey(name: 'success') final bool success}) =
      _$ConfirmResetPasswordResponseImpl;

  factory _ConfirmResetPasswordResponse.fromJson(Map<String, dynamic> json) =
      _$ConfirmResetPasswordResponseImpl.fromJson;

  @override
  @JsonKey(name: 'message')
  String get message;
  @override
  @JsonKey(name: 'success')
  bool get success;

  /// Create a copy of ConfirmResetPasswordResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConfirmResetPasswordResponseImplCopyWith<
          _$ConfirmResetPasswordResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

UserLoginBody _$UserLoginBodyFromJson(Map<String, dynamic> json) {
  return _UserLoginBody.fromJson(json);
}

/// @nodoc
mixin _$UserLoginBody {
  @JsonKey(name: 'grant_type')
  String get grantType => throw _privateConstructorUsedError;
  @JsonKey(name: 'email')
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'password')
  String get password => throw _privateConstructorUsedError;
  @JsonKey(name: 'scope')
  String get scope => throw _privateConstructorUsedError;
  @JsonKey(name: 'client_secret')
  String get clientSecret => throw _privateConstructorUsedError;

  /// Serializes this UserLoginBody to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserLoginBody
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserLoginBodyCopyWith<UserLoginBody> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserLoginBodyCopyWith<$Res> {
  factory $UserLoginBodyCopyWith(
          UserLoginBody value, $Res Function(UserLoginBody) then) =
      _$UserLoginBodyCopyWithImpl<$Res, UserLoginBody>;
  @useResult
  $Res call(
      {@JsonKey(name: 'grant_type') String grantType,
      @JsonKey(name: 'email') String email,
      @JsonKey(name: 'password') String password,
      @JsonKey(name: 'scope') String scope,
      @JsonKey(name: 'client_secret') String clientSecret});
}

/// @nodoc
class _$UserLoginBodyCopyWithImpl<$Res, $Val extends UserLoginBody>
    implements $UserLoginBodyCopyWith<$Res> {
  _$UserLoginBodyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserLoginBody
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? grantType = null,
    Object? email = null,
    Object? password = null,
    Object? scope = null,
    Object? clientSecret = null,
  }) {
    return _then(_value.copyWith(
      grantType: null == grantType
          ? _value.grantType
          : grantType // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      scope: null == scope
          ? _value.scope
          : scope // ignore: cast_nullable_to_non_nullable
              as String,
      clientSecret: null == clientSecret
          ? _value.clientSecret
          : clientSecret // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserLoginBodyImplCopyWith<$Res>
    implements $UserLoginBodyCopyWith<$Res> {
  factory _$$UserLoginBodyImplCopyWith(
          _$UserLoginBodyImpl value, $Res Function(_$UserLoginBodyImpl) then) =
      __$$UserLoginBodyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'grant_type') String grantType,
      @JsonKey(name: 'email') String email,
      @JsonKey(name: 'password') String password,
      @JsonKey(name: 'scope') String scope,
      @JsonKey(name: 'client_secret') String clientSecret});
}

/// @nodoc
class __$$UserLoginBodyImplCopyWithImpl<$Res>
    extends _$UserLoginBodyCopyWithImpl<$Res, _$UserLoginBodyImpl>
    implements _$$UserLoginBodyImplCopyWith<$Res> {
  __$$UserLoginBodyImplCopyWithImpl(
      _$UserLoginBodyImpl _value, $Res Function(_$UserLoginBodyImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserLoginBody
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? grantType = null,
    Object? email = null,
    Object? password = null,
    Object? scope = null,
    Object? clientSecret = null,
  }) {
    return _then(_$UserLoginBodyImpl(
      grantType: null == grantType
          ? _value.grantType
          : grantType // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      scope: null == scope
          ? _value.scope
          : scope // ignore: cast_nullable_to_non_nullable
              as String,
      clientSecret: null == clientSecret
          ? _value.clientSecret
          : clientSecret // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserLoginBodyImpl implements _UserLoginBody {
  const _$UserLoginBodyImpl(
      {@JsonKey(name: 'grant_type') this.grantType = '',
      @JsonKey(name: 'email') this.email = '',
      @JsonKey(name: 'password') this.password = '',
      @JsonKey(name: 'scope') this.scope = '',
      @JsonKey(name: 'client_secret') this.clientSecret = ''});

  factory _$UserLoginBodyImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserLoginBodyImplFromJson(json);

  @override
  @JsonKey(name: 'grant_type')
  final String grantType;
  @override
  @JsonKey(name: 'email')
  final String email;
  @override
  @JsonKey(name: 'password')
  final String password;
  @override
  @JsonKey(name: 'scope')
  final String scope;
  @override
  @JsonKey(name: 'client_secret')
  final String clientSecret;

  @override
  String toString() {
    return 'UserLoginBody(grantType: $grantType, email: $email, password: $password, scope: $scope, clientSecret: $clientSecret)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserLoginBodyImpl &&
            (identical(other.grantType, grantType) ||
                other.grantType == grantType) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.scope, scope) || other.scope == scope) &&
            (identical(other.clientSecret, clientSecret) ||
                other.clientSecret == clientSecret));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, grantType, email, password, scope, clientSecret);

  /// Create a copy of UserLoginBody
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserLoginBodyImplCopyWith<_$UserLoginBodyImpl> get copyWith =>
      __$$UserLoginBodyImplCopyWithImpl<_$UserLoginBodyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserLoginBodyImplToJson(
      this,
    );
  }
}

abstract class _UserLoginBody implements UserLoginBody {
  const factory _UserLoginBody(
          {@JsonKey(name: 'grant_type') final String grantType,
          @JsonKey(name: 'email') final String email,
          @JsonKey(name: 'password') final String password,
          @JsonKey(name: 'scope') final String scope,
          @JsonKey(name: 'client_secret') final String clientSecret}) =
      _$UserLoginBodyImpl;

  factory _UserLoginBody.fromJson(Map<String, dynamic> json) =
      _$UserLoginBodyImpl.fromJson;

  @override
  @JsonKey(name: 'grant_type')
  String get grantType;
  @override
  @JsonKey(name: 'email')
  String get email;
  @override
  @JsonKey(name: 'password')
  String get password;
  @override
  @JsonKey(name: 'scope')
  String get scope;
  @override
  @JsonKey(name: 'client_secret')
  String get clientSecret;

  /// Create a copy of UserLoginBody
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserLoginBodyImplCopyWith<_$UserLoginBodyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserRegisterBody _$UserRegisterBodyFromJson(Map<String, dynamic> json) {
  return _UserRegisterBody.fromJson(json);
}

/// @nodoc
mixin _$UserRegisterBody {
  @JsonKey(name: 'email')
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'password')
  String get password => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  bool get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'imei')
  String get imei => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_admin')
  bool get isAdmin => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;

  /// Serializes this UserRegisterBody to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserRegisterBody
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserRegisterBodyCopyWith<UserRegisterBody> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserRegisterBodyCopyWith<$Res> {
  factory $UserRegisterBodyCopyWith(
          UserRegisterBody value, $Res Function(UserRegisterBody) then) =
      _$UserRegisterBodyCopyWithImpl<$Res, UserRegisterBody>;
  @useResult
  $Res call(
      {@JsonKey(name: 'email') String email,
      @JsonKey(name: 'password') String password,
      @JsonKey(name: 'is_active') bool isActive,
      @JsonKey(name: 'imei') String imei,
      @JsonKey(name: 'is_admin') bool isAdmin,
      @JsonKey(name: 'name') String name});
}

/// @nodoc
class _$UserRegisterBodyCopyWithImpl<$Res, $Val extends UserRegisterBody>
    implements $UserRegisterBodyCopyWith<$Res> {
  _$UserRegisterBodyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserRegisterBody
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? isActive = null,
    Object? imei = null,
    Object? isAdmin = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      imei: null == imei
          ? _value.imei
          : imei // ignore: cast_nullable_to_non_nullable
              as String,
      isAdmin: null == isAdmin
          ? _value.isAdmin
          : isAdmin // ignore: cast_nullable_to_non_nullable
              as bool,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserRegisterBodyImplCopyWith<$Res>
    implements $UserRegisterBodyCopyWith<$Res> {
  factory _$$UserRegisterBodyImplCopyWith(_$UserRegisterBodyImpl value,
          $Res Function(_$UserRegisterBodyImpl) then) =
      __$$UserRegisterBodyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'email') String email,
      @JsonKey(name: 'password') String password,
      @JsonKey(name: 'is_active') bool isActive,
      @JsonKey(name: 'imei') String imei,
      @JsonKey(name: 'is_admin') bool isAdmin,
      @JsonKey(name: 'name') String name});
}

/// @nodoc
class __$$UserRegisterBodyImplCopyWithImpl<$Res>
    extends _$UserRegisterBodyCopyWithImpl<$Res, _$UserRegisterBodyImpl>
    implements _$$UserRegisterBodyImplCopyWith<$Res> {
  __$$UserRegisterBodyImplCopyWithImpl(_$UserRegisterBodyImpl _value,
      $Res Function(_$UserRegisterBodyImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserRegisterBody
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? isActive = null,
    Object? imei = null,
    Object? isAdmin = null,
    Object? name = null,
  }) {
    return _then(_$UserRegisterBodyImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      imei: null == imei
          ? _value.imei
          : imei // ignore: cast_nullable_to_non_nullable
              as String,
      isAdmin: null == isAdmin
          ? _value.isAdmin
          : isAdmin // ignore: cast_nullable_to_non_nullable
              as bool,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserRegisterBodyImpl implements _UserRegisterBody {
  const _$UserRegisterBodyImpl(
      {@JsonKey(name: 'email') this.email = '',
      @JsonKey(name: 'password') this.password = '',
      @JsonKey(name: 'is_active') this.isActive = true,
      @JsonKey(name: 'imei') this.imei = '',
      @JsonKey(name: 'is_admin') this.isAdmin = false,
      @JsonKey(name: 'name') this.name = ''});

  factory _$UserRegisterBodyImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserRegisterBodyImplFromJson(json);

  @override
  @JsonKey(name: 'email')
  final String email;
  @override
  @JsonKey(name: 'password')
  final String password;
  @override
  @JsonKey(name: 'is_active')
  final bool isActive;
  @override
  @JsonKey(name: 'imei')
  final String imei;
  @override
  @JsonKey(name: 'is_admin')
  final bool isAdmin;
  @override
  @JsonKey(name: 'name')
  final String name;

  @override
  String toString() {
    return 'UserRegisterBody(email: $email, password: $password, isActive: $isActive, imei: $imei, isAdmin: $isAdmin, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserRegisterBodyImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.imei, imei) || other.imei == imei) &&
            (identical(other.isAdmin, isAdmin) || other.isAdmin == isAdmin) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, email, password, isActive, imei, isAdmin, name);

  /// Create a copy of UserRegisterBody
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserRegisterBodyImplCopyWith<_$UserRegisterBodyImpl> get copyWith =>
      __$$UserRegisterBodyImplCopyWithImpl<_$UserRegisterBodyImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserRegisterBodyImplToJson(
      this,
    );
  }
}

abstract class _UserRegisterBody implements UserRegisterBody {
  const factory _UserRegisterBody(
      {@JsonKey(name: 'email') final String email,
      @JsonKey(name: 'password') final String password,
      @JsonKey(name: 'is_active') final bool isActive,
      @JsonKey(name: 'imei') final String imei,
      @JsonKey(name: 'is_admin') final bool isAdmin,
      @JsonKey(name: 'name') final String name}) = _$UserRegisterBodyImpl;

  factory _UserRegisterBody.fromJson(Map<String, dynamic> json) =
      _$UserRegisterBodyImpl.fromJson;

  @override
  @JsonKey(name: 'email')
  String get email;
  @override
  @JsonKey(name: 'password')
  String get password;
  @override
  @JsonKey(name: 'is_active')
  bool get isActive;
  @override
  @JsonKey(name: 'imei')
  String get imei;
  @override
  @JsonKey(name: 'is_admin')
  bool get isAdmin;
  @override
  @JsonKey(name: 'name')
  String get name;

  /// Create a copy of UserRegisterBody
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserRegisterBodyImplCopyWith<_$UserRegisterBodyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GetRestorePasswordCodeBody _$GetRestorePasswordCodeBodyFromJson(
    Map<String, dynamic> json) {
  return _GetRestorePasswordCodeBody.fromJson(json);
}

/// @nodoc
mixin _$GetRestorePasswordCodeBody {
  @JsonKey(name: 'email')
  String get email => throw _privateConstructorUsedError;

  /// Serializes this GetRestorePasswordCodeBody to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GetRestorePasswordCodeBody
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetRestorePasswordCodeBodyCopyWith<GetRestorePasswordCodeBody>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetRestorePasswordCodeBodyCopyWith<$Res> {
  factory $GetRestorePasswordCodeBodyCopyWith(GetRestorePasswordCodeBody value,
          $Res Function(GetRestorePasswordCodeBody) then) =
      _$GetRestorePasswordCodeBodyCopyWithImpl<$Res,
          GetRestorePasswordCodeBody>;
  @useResult
  $Res call({@JsonKey(name: 'email') String email});
}

/// @nodoc
class _$GetRestorePasswordCodeBodyCopyWithImpl<$Res,
        $Val extends GetRestorePasswordCodeBody>
    implements $GetRestorePasswordCodeBodyCopyWith<$Res> {
  _$GetRestorePasswordCodeBodyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetRestorePasswordCodeBody
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetRestorePasswordCodeBodyImplCopyWith<$Res>
    implements $GetRestorePasswordCodeBodyCopyWith<$Res> {
  factory _$$GetRestorePasswordCodeBodyImplCopyWith(
          _$GetRestorePasswordCodeBodyImpl value,
          $Res Function(_$GetRestorePasswordCodeBodyImpl) then) =
      __$$GetRestorePasswordCodeBodyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'email') String email});
}

/// @nodoc
class __$$GetRestorePasswordCodeBodyImplCopyWithImpl<$Res>
    extends _$GetRestorePasswordCodeBodyCopyWithImpl<$Res,
        _$GetRestorePasswordCodeBodyImpl>
    implements _$$GetRestorePasswordCodeBodyImplCopyWith<$Res> {
  __$$GetRestorePasswordCodeBodyImplCopyWithImpl(
      _$GetRestorePasswordCodeBodyImpl _value,
      $Res Function(_$GetRestorePasswordCodeBodyImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetRestorePasswordCodeBody
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_$GetRestorePasswordCodeBodyImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetRestorePasswordCodeBodyImpl implements _GetRestorePasswordCodeBody {
  const _$GetRestorePasswordCodeBodyImpl(
      {@JsonKey(name: 'email') this.email = ''});

  factory _$GetRestorePasswordCodeBodyImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$GetRestorePasswordCodeBodyImplFromJson(json);

  @override
  @JsonKey(name: 'email')
  final String email;

  @override
  String toString() {
    return 'GetRestorePasswordCodeBody(email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetRestorePasswordCodeBodyImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email);

  /// Create a copy of GetRestorePasswordCodeBody
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetRestorePasswordCodeBodyImplCopyWith<_$GetRestorePasswordCodeBodyImpl>
      get copyWith => __$$GetRestorePasswordCodeBodyImplCopyWithImpl<
          _$GetRestorePasswordCodeBodyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetRestorePasswordCodeBodyImplToJson(
      this,
    );
  }
}

abstract class _GetRestorePasswordCodeBody
    implements GetRestorePasswordCodeBody {
  const factory _GetRestorePasswordCodeBody(
          {@JsonKey(name: 'email') final String email}) =
      _$GetRestorePasswordCodeBodyImpl;

  factory _GetRestorePasswordCodeBody.fromJson(Map<String, dynamic> json) =
      _$GetRestorePasswordCodeBodyImpl.fromJson;

  @override
  @JsonKey(name: 'email')
  String get email;

  /// Create a copy of GetRestorePasswordCodeBody
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetRestorePasswordCodeBodyImplCopyWith<_$GetRestorePasswordCodeBodyImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ChangePasswordBody _$ChangePasswordBodyFromJson(Map<String, dynamic> json) {
  return _ChangePasswordBody.fromJson(json);
}

/// @nodoc
mixin _$ChangePasswordBody {
  @JsonKey(name: 'email')
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'new_password')
  String get newPassword => throw _privateConstructorUsedError;

  /// Serializes this ChangePasswordBody to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChangePasswordBody
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChangePasswordBodyCopyWith<ChangePasswordBody> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChangePasswordBodyCopyWith<$Res> {
  factory $ChangePasswordBodyCopyWith(
          ChangePasswordBody value, $Res Function(ChangePasswordBody) then) =
      _$ChangePasswordBodyCopyWithImpl<$Res, ChangePasswordBody>;
  @useResult
  $Res call(
      {@JsonKey(name: 'email') String email,
      @JsonKey(name: 'new_password') String newPassword});
}

/// @nodoc
class _$ChangePasswordBodyCopyWithImpl<$Res, $Val extends ChangePasswordBody>
    implements $ChangePasswordBodyCopyWith<$Res> {
  _$ChangePasswordBodyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChangePasswordBody
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? newPassword = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      newPassword: null == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChangePasswordBodyImplCopyWith<$Res>
    implements $ChangePasswordBodyCopyWith<$Res> {
  factory _$$ChangePasswordBodyImplCopyWith(_$ChangePasswordBodyImpl value,
          $Res Function(_$ChangePasswordBodyImpl) then) =
      __$$ChangePasswordBodyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'email') String email,
      @JsonKey(name: 'new_password') String newPassword});
}

/// @nodoc
class __$$ChangePasswordBodyImplCopyWithImpl<$Res>
    extends _$ChangePasswordBodyCopyWithImpl<$Res, _$ChangePasswordBodyImpl>
    implements _$$ChangePasswordBodyImplCopyWith<$Res> {
  __$$ChangePasswordBodyImplCopyWithImpl(_$ChangePasswordBodyImpl _value,
      $Res Function(_$ChangePasswordBodyImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChangePasswordBody
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? newPassword = null,
  }) {
    return _then(_$ChangePasswordBodyImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      newPassword: null == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChangePasswordBodyImpl implements _ChangePasswordBody {
  const _$ChangePasswordBodyImpl(
      {@JsonKey(name: 'email') this.email = '',
      @JsonKey(name: 'new_password') this.newPassword = ''});

  factory _$ChangePasswordBodyImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChangePasswordBodyImplFromJson(json);

  @override
  @JsonKey(name: 'email')
  final String email;
  @override
  @JsonKey(name: 'new_password')
  final String newPassword;

  @override
  String toString() {
    return 'ChangePasswordBody(email: $email, newPassword: $newPassword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangePasswordBodyImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.newPassword, newPassword) ||
                other.newPassword == newPassword));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email, newPassword);

  /// Create a copy of ChangePasswordBody
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangePasswordBodyImplCopyWith<_$ChangePasswordBodyImpl> get copyWith =>
      __$$ChangePasswordBodyImplCopyWithImpl<_$ChangePasswordBodyImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChangePasswordBodyImplToJson(
      this,
    );
  }
}

abstract class _ChangePasswordBody implements ChangePasswordBody {
  const factory _ChangePasswordBody(
          {@JsonKey(name: 'email') final String email,
          @JsonKey(name: 'new_password') final String newPassword}) =
      _$ChangePasswordBodyImpl;

  factory _ChangePasswordBody.fromJson(Map<String, dynamic> json) =
      _$ChangePasswordBodyImpl.fromJson;

  @override
  @JsonKey(name: 'email')
  String get email;
  @override
  @JsonKey(name: 'new_password')
  String get newPassword;

  /// Create a copy of ChangePasswordBody
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChangePasswordBodyImplCopyWith<_$ChangePasswordBodyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ResetPasswordBody _$ResetPasswordBodyFromJson(Map<String, dynamic> json) {
  return _ResetPasswordBody.fromJson(json);
}

/// @nodoc
mixin _$ResetPasswordBody {
  @JsonKey(name: 'email')
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'code')
  String get code => throw _privateConstructorUsedError;

  /// Serializes this ResetPasswordBody to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ResetPasswordBody
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResetPasswordBodyCopyWith<ResetPasswordBody> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResetPasswordBodyCopyWith<$Res> {
  factory $ResetPasswordBodyCopyWith(
          ResetPasswordBody value, $Res Function(ResetPasswordBody) then) =
      _$ResetPasswordBodyCopyWithImpl<$Res, ResetPasswordBody>;
  @useResult
  $Res call(
      {@JsonKey(name: 'email') String email,
      @JsonKey(name: 'code') String code});
}

/// @nodoc
class _$ResetPasswordBodyCopyWithImpl<$Res, $Val extends ResetPasswordBody>
    implements $ResetPasswordBodyCopyWith<$Res> {
  _$ResetPasswordBodyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResetPasswordBody
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? code = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResetPasswordBodyImplCopyWith<$Res>
    implements $ResetPasswordBodyCopyWith<$Res> {
  factory _$$ResetPasswordBodyImplCopyWith(_$ResetPasswordBodyImpl value,
          $Res Function(_$ResetPasswordBodyImpl) then) =
      __$$ResetPasswordBodyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'email') String email,
      @JsonKey(name: 'code') String code});
}

/// @nodoc
class __$$ResetPasswordBodyImplCopyWithImpl<$Res>
    extends _$ResetPasswordBodyCopyWithImpl<$Res, _$ResetPasswordBodyImpl>
    implements _$$ResetPasswordBodyImplCopyWith<$Res> {
  __$$ResetPasswordBodyImplCopyWithImpl(_$ResetPasswordBodyImpl _value,
      $Res Function(_$ResetPasswordBodyImpl) _then)
      : super(_value, _then);

  /// Create a copy of ResetPasswordBody
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? code = null,
  }) {
    return _then(_$ResetPasswordBodyImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResetPasswordBodyImpl implements _ResetPasswordBody {
  const _$ResetPasswordBodyImpl(
      {@JsonKey(name: 'email') this.email = '',
      @JsonKey(name: 'code') this.code = ''});

  factory _$ResetPasswordBodyImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResetPasswordBodyImplFromJson(json);

  @override
  @JsonKey(name: 'email')
  final String email;
  @override
  @JsonKey(name: 'code')
  final String code;

  @override
  String toString() {
    return 'ResetPasswordBody(email: $email, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResetPasswordBodyImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email, code);

  /// Create a copy of ResetPasswordBody
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResetPasswordBodyImplCopyWith<_$ResetPasswordBodyImpl> get copyWith =>
      __$$ResetPasswordBodyImplCopyWithImpl<_$ResetPasswordBodyImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResetPasswordBodyImplToJson(
      this,
    );
  }
}

abstract class _ResetPasswordBody implements ResetPasswordBody {
  const factory _ResetPasswordBody(
      {@JsonKey(name: 'email') final String email,
      @JsonKey(name: 'code') final String code}) = _$ResetPasswordBodyImpl;

  factory _ResetPasswordBody.fromJson(Map<String, dynamic> json) =
      _$ResetPasswordBodyImpl.fromJson;

  @override
  @JsonKey(name: 'email')
  String get email;
  @override
  @JsonKey(name: 'code')
  String get code;

  /// Create a copy of ResetPasswordBody
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResetPasswordBodyImplCopyWith<_$ResetPasswordBodyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserActivationBody _$UserActivationBodyFromJson(Map<String, dynamic> json) {
  return _UserActivationBody.fromJson(json);
}

/// @nodoc
mixin _$UserActivationBody {
  @JsonKey(name: 'code')
  String get code => throw _privateConstructorUsedError;

  /// Serializes this UserActivationBody to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserActivationBody
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserActivationBodyCopyWith<UserActivationBody> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserActivationBodyCopyWith<$Res> {
  factory $UserActivationBodyCopyWith(
          UserActivationBody value, $Res Function(UserActivationBody) then) =
      _$UserActivationBodyCopyWithImpl<$Res, UserActivationBody>;
  @useResult
  $Res call({@JsonKey(name: 'code') String code});
}

/// @nodoc
class _$UserActivationBodyCopyWithImpl<$Res, $Val extends UserActivationBody>
    implements $UserActivationBodyCopyWith<$Res> {
  _$UserActivationBodyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserActivationBody
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserActivationBodyImplCopyWith<$Res>
    implements $UserActivationBodyCopyWith<$Res> {
  factory _$$UserActivationBodyImplCopyWith(_$UserActivationBodyImpl value,
          $Res Function(_$UserActivationBodyImpl) then) =
      __$$UserActivationBodyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'code') String code});
}

/// @nodoc
class __$$UserActivationBodyImplCopyWithImpl<$Res>
    extends _$UserActivationBodyCopyWithImpl<$Res, _$UserActivationBodyImpl>
    implements _$$UserActivationBodyImplCopyWith<$Res> {
  __$$UserActivationBodyImplCopyWithImpl(_$UserActivationBodyImpl _value,
      $Res Function(_$UserActivationBodyImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserActivationBody
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
  }) {
    return _then(_$UserActivationBodyImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserActivationBodyImpl implements _UserActivationBody {
  const _$UserActivationBodyImpl({@JsonKey(name: 'code') this.code = ''});

  factory _$UserActivationBodyImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserActivationBodyImplFromJson(json);

  @override
  @JsonKey(name: 'code')
  final String code;

  @override
  String toString() {
    return 'UserActivationBody(code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserActivationBodyImpl &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code);

  /// Create a copy of UserActivationBody
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserActivationBodyImplCopyWith<_$UserActivationBodyImpl> get copyWith =>
      __$$UserActivationBodyImplCopyWithImpl<_$UserActivationBodyImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserActivationBodyImplToJson(
      this,
    );
  }
}

abstract class _UserActivationBody implements UserActivationBody {
  const factory _UserActivationBody(
      {@JsonKey(name: 'code') final String code}) = _$UserActivationBodyImpl;

  factory _UserActivationBody.fromJson(Map<String, dynamic> json) =
      _$UserActivationBodyImpl.fromJson;

  @override
  @JsonKey(name: 'code')
  String get code;

  /// Create a copy of UserActivationBody
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserActivationBodyImplCopyWith<_$UserActivationBodyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RefreshTokenBody _$RefreshTokenBodyFromJson(Map<String, dynamic> json) {
  return _RefreshTokenBody.fromJson(json);
}

/// @nodoc
mixin _$RefreshTokenBody {
  @JsonKey(name: 'token')
  String get refreshToken => throw _privateConstructorUsedError;

  /// Serializes this RefreshTokenBody to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RefreshTokenBody
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RefreshTokenBodyCopyWith<RefreshTokenBody> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RefreshTokenBodyCopyWith<$Res> {
  factory $RefreshTokenBodyCopyWith(
          RefreshTokenBody value, $Res Function(RefreshTokenBody) then) =
      _$RefreshTokenBodyCopyWithImpl<$Res, RefreshTokenBody>;
  @useResult
  $Res call({@JsonKey(name: 'token') String refreshToken});
}

/// @nodoc
class _$RefreshTokenBodyCopyWithImpl<$Res, $Val extends RefreshTokenBody>
    implements $RefreshTokenBodyCopyWith<$Res> {
  _$RefreshTokenBodyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RefreshTokenBody
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? refreshToken = null,
  }) {
    return _then(_value.copyWith(
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RefreshTokenBodyImplCopyWith<$Res>
    implements $RefreshTokenBodyCopyWith<$Res> {
  factory _$$RefreshTokenBodyImplCopyWith(_$RefreshTokenBodyImpl value,
          $Res Function(_$RefreshTokenBodyImpl) then) =
      __$$RefreshTokenBodyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'token') String refreshToken});
}

/// @nodoc
class __$$RefreshTokenBodyImplCopyWithImpl<$Res>
    extends _$RefreshTokenBodyCopyWithImpl<$Res, _$RefreshTokenBodyImpl>
    implements _$$RefreshTokenBodyImplCopyWith<$Res> {
  __$$RefreshTokenBodyImplCopyWithImpl(_$RefreshTokenBodyImpl _value,
      $Res Function(_$RefreshTokenBodyImpl) _then)
      : super(_value, _then);

  /// Create a copy of RefreshTokenBody
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? refreshToken = null,
  }) {
    return _then(_$RefreshTokenBodyImpl(
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RefreshTokenBodyImpl implements _RefreshTokenBody {
  const _$RefreshTokenBodyImpl(
      {@JsonKey(name: 'token') this.refreshToken = ''});

  factory _$RefreshTokenBodyImpl.fromJson(Map<String, dynamic> json) =>
      _$$RefreshTokenBodyImplFromJson(json);

  @override
  @JsonKey(name: 'token')
  final String refreshToken;

  @override
  String toString() {
    return 'RefreshTokenBody(refreshToken: $refreshToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefreshTokenBodyImpl &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, refreshToken);

  /// Create a copy of RefreshTokenBody
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RefreshTokenBodyImplCopyWith<_$RefreshTokenBodyImpl> get copyWith =>
      __$$RefreshTokenBodyImplCopyWithImpl<_$RefreshTokenBodyImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RefreshTokenBodyImplToJson(
      this,
    );
  }
}

abstract class _RefreshTokenBody implements RefreshTokenBody {
  const factory _RefreshTokenBody(
          {@JsonKey(name: 'token') final String refreshToken}) =
      _$RefreshTokenBodyImpl;

  factory _RefreshTokenBody.fromJson(Map<String, dynamic> json) =
      _$RefreshTokenBodyImpl.fromJson;

  @override
  @JsonKey(name: 'token')
  String get refreshToken;

  /// Create a copy of RefreshTokenBody
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RefreshTokenBodyImplCopyWith<_$RefreshTokenBodyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
