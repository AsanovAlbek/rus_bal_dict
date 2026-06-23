// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mail_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetCodeResponse _$GetCodeResponseFromJson(Map<String, dynamic> json) {
  return _GetCodeResponse.fromJson(json);
}

/// @nodoc
mixin _$GetCodeResponse {
  @JsonKey(name: 'success')
  bool get success => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  String get message => throw _privateConstructorUsedError;

  /// Serializes this GetCodeResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GetCodeResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetCodeResponseCopyWith<GetCodeResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetCodeResponseCopyWith<$Res> {
  factory $GetCodeResponseCopyWith(
          GetCodeResponse value, $Res Function(GetCodeResponse) then) =
      _$GetCodeResponseCopyWithImpl<$Res, GetCodeResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'success') bool success,
      @JsonKey(name: 'message') String message});
}

/// @nodoc
class _$GetCodeResponseCopyWithImpl<$Res, $Val extends GetCodeResponse>
    implements $GetCodeResponseCopyWith<$Res> {
  _$GetCodeResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetCodeResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetCodeResponseImplCopyWith<$Res>
    implements $GetCodeResponseCopyWith<$Res> {
  factory _$$GetCodeResponseImplCopyWith(_$GetCodeResponseImpl value,
          $Res Function(_$GetCodeResponseImpl) then) =
      __$$GetCodeResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'success') bool success,
      @JsonKey(name: 'message') String message});
}

/// @nodoc
class __$$GetCodeResponseImplCopyWithImpl<$Res>
    extends _$GetCodeResponseCopyWithImpl<$Res, _$GetCodeResponseImpl>
    implements _$$GetCodeResponseImplCopyWith<$Res> {
  __$$GetCodeResponseImplCopyWithImpl(
      _$GetCodeResponseImpl _value, $Res Function(_$GetCodeResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetCodeResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
  }) {
    return _then(_$GetCodeResponseImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetCodeResponseImpl implements _GetCodeResponse {
  const _$GetCodeResponseImpl(
      {@JsonKey(name: 'success') this.success = false,
      @JsonKey(name: 'message') this.message = ''});

  factory _$GetCodeResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetCodeResponseImplFromJson(json);

  @override
  @JsonKey(name: 'success')
  final bool success;
  @override
  @JsonKey(name: 'message')
  final String message;

  @override
  String toString() {
    return 'GetCodeResponse(success: $success, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetCodeResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, message);

  /// Create a copy of GetCodeResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetCodeResponseImplCopyWith<_$GetCodeResponseImpl> get copyWith =>
      __$$GetCodeResponseImplCopyWithImpl<_$GetCodeResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetCodeResponseImplToJson(
      this,
    );
  }
}

abstract class _GetCodeResponse implements GetCodeResponse {
  const factory _GetCodeResponse(
      {@JsonKey(name: 'success') final bool success,
      @JsonKey(name: 'message') final String message}) = _$GetCodeResponseImpl;

  factory _GetCodeResponse.fromJson(Map<String, dynamic> json) =
      _$GetCodeResponseImpl.fromJson;

  @override
  @JsonKey(name: 'success')
  bool get success;
  @override
  @JsonKey(name: 'message')
  String get message;

  /// Create a copy of GetCodeResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetCodeResponseImplCopyWith<_$GetCodeResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
