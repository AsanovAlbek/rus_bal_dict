// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'media_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UploadFileResponse _$UploadFileResponseFromJson(Map<String, dynamic> json) {
  return _UploadFileResponse.fromJson(json);
}

/// @nodoc
mixin _$UploadFileResponse {
  @JsonKey(name: 'message')
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'file_path')
  String get filePath => throw _privateConstructorUsedError;
  @JsonKey(name: 'file_url')
  String get fileUrl => throw _privateConstructorUsedError;

  /// Serializes this UploadFileResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UploadFileResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UploadFileResponseCopyWith<UploadFileResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UploadFileResponseCopyWith<$Res> {
  factory $UploadFileResponseCopyWith(
          UploadFileResponse value, $Res Function(UploadFileResponse) then) =
      _$UploadFileResponseCopyWithImpl<$Res, UploadFileResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'message') String message,
      @JsonKey(name: 'file_path') String filePath,
      @JsonKey(name: 'file_url') String fileUrl});
}

/// @nodoc
class _$UploadFileResponseCopyWithImpl<$Res, $Val extends UploadFileResponse>
    implements $UploadFileResponseCopyWith<$Res> {
  _$UploadFileResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UploadFileResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? filePath = null,
    Object? fileUrl = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      filePath: null == filePath
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String,
      fileUrl: null == fileUrl
          ? _value.fileUrl
          : fileUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UploadFileResponseImplCopyWith<$Res>
    implements $UploadFileResponseCopyWith<$Res> {
  factory _$$UploadFileResponseImplCopyWith(_$UploadFileResponseImpl value,
          $Res Function(_$UploadFileResponseImpl) then) =
      __$$UploadFileResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'message') String message,
      @JsonKey(name: 'file_path') String filePath,
      @JsonKey(name: 'file_url') String fileUrl});
}

/// @nodoc
class __$$UploadFileResponseImplCopyWithImpl<$Res>
    extends _$UploadFileResponseCopyWithImpl<$Res, _$UploadFileResponseImpl>
    implements _$$UploadFileResponseImplCopyWith<$Res> {
  __$$UploadFileResponseImplCopyWithImpl(_$UploadFileResponseImpl _value,
      $Res Function(_$UploadFileResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of UploadFileResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? filePath = null,
    Object? fileUrl = null,
  }) {
    return _then(_$UploadFileResponseImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      filePath: null == filePath
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String,
      fileUrl: null == fileUrl
          ? _value.fileUrl
          : fileUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UploadFileResponseImpl implements _UploadFileResponse {
  const _$UploadFileResponseImpl(
      {@JsonKey(name: 'message') this.message = '',
      @JsonKey(name: 'file_path') this.filePath = '',
      @JsonKey(name: 'file_url') this.fileUrl = ''});

  factory _$UploadFileResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$UploadFileResponseImplFromJson(json);

  @override
  @JsonKey(name: 'message')
  final String message;
  @override
  @JsonKey(name: 'file_path')
  final String filePath;
  @override
  @JsonKey(name: 'file_url')
  final String fileUrl;

  @override
  String toString() {
    return 'UploadFileResponse(message: $message, filePath: $filePath, fileUrl: $fileUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadFileResponseImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.filePath, filePath) ||
                other.filePath == filePath) &&
            (identical(other.fileUrl, fileUrl) || other.fileUrl == fileUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message, filePath, fileUrl);

  /// Create a copy of UploadFileResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadFileResponseImplCopyWith<_$UploadFileResponseImpl> get copyWith =>
      __$$UploadFileResponseImplCopyWithImpl<_$UploadFileResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UploadFileResponseImplToJson(
      this,
    );
  }
}

abstract class _UploadFileResponse implements UploadFileResponse {
  const factory _UploadFileResponse(
          {@JsonKey(name: 'message') final String message,
          @JsonKey(name: 'file_path') final String filePath,
          @JsonKey(name: 'file_url') final String fileUrl}) =
      _$UploadFileResponseImpl;

  factory _UploadFileResponse.fromJson(Map<String, dynamic> json) =
      _$UploadFileResponseImpl.fromJson;

  @override
  @JsonKey(name: 'message')
  String get message;
  @override
  @JsonKey(name: 'file_path')
  String get filePath;
  @override
  @JsonKey(name: 'file_url')
  String get fileUrl;

  /// Create a copy of UploadFileResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UploadFileResponseImplCopyWith<_$UploadFileResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DeleteFileResponse _$DeleteFileResponseFromJson(Map<String, dynamic> json) {
  return _DeleteFileResponse.fromJson(json);
}

/// @nodoc
mixin _$DeleteFileResponse {
  @JsonKey(name: 'message')
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'file_path')
  String get filePath => throw _privateConstructorUsedError;

  /// Serializes this DeleteFileResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeleteFileResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeleteFileResponseCopyWith<DeleteFileResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeleteFileResponseCopyWith<$Res> {
  factory $DeleteFileResponseCopyWith(
          DeleteFileResponse value, $Res Function(DeleteFileResponse) then) =
      _$DeleteFileResponseCopyWithImpl<$Res, DeleteFileResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'message') String message,
      @JsonKey(name: 'file_path') String filePath});
}

/// @nodoc
class _$DeleteFileResponseCopyWithImpl<$Res, $Val extends DeleteFileResponse>
    implements $DeleteFileResponseCopyWith<$Res> {
  _$DeleteFileResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeleteFileResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? filePath = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      filePath: null == filePath
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeleteFileResponseImplCopyWith<$Res>
    implements $DeleteFileResponseCopyWith<$Res> {
  factory _$$DeleteFileResponseImplCopyWith(_$DeleteFileResponseImpl value,
          $Res Function(_$DeleteFileResponseImpl) then) =
      __$$DeleteFileResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'message') String message,
      @JsonKey(name: 'file_path') String filePath});
}

/// @nodoc
class __$$DeleteFileResponseImplCopyWithImpl<$Res>
    extends _$DeleteFileResponseCopyWithImpl<$Res, _$DeleteFileResponseImpl>
    implements _$$DeleteFileResponseImplCopyWith<$Res> {
  __$$DeleteFileResponseImplCopyWithImpl(_$DeleteFileResponseImpl _value,
      $Res Function(_$DeleteFileResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeleteFileResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? filePath = null,
  }) {
    return _then(_$DeleteFileResponseImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      filePath: null == filePath
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeleteFileResponseImpl implements _DeleteFileResponse {
  const _$DeleteFileResponseImpl(
      {@JsonKey(name: 'message') this.message = '',
      @JsonKey(name: 'file_path') this.filePath = ''});

  factory _$DeleteFileResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeleteFileResponseImplFromJson(json);

  @override
  @JsonKey(name: 'message')
  final String message;
  @override
  @JsonKey(name: 'file_path')
  final String filePath;

  @override
  String toString() {
    return 'DeleteFileResponse(message: $message, filePath: $filePath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteFileResponseImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.filePath, filePath) ||
                other.filePath == filePath));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message, filePath);

  /// Create a copy of DeleteFileResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteFileResponseImplCopyWith<_$DeleteFileResponseImpl> get copyWith =>
      __$$DeleteFileResponseImplCopyWithImpl<_$DeleteFileResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeleteFileResponseImplToJson(
      this,
    );
  }
}

abstract class _DeleteFileResponse implements DeleteFileResponse {
  const factory _DeleteFileResponse(
          {@JsonKey(name: 'message') final String message,
          @JsonKey(name: 'file_path') final String filePath}) =
      _$DeleteFileResponseImpl;

  factory _DeleteFileResponse.fromJson(Map<String, dynamic> json) =
      _$DeleteFileResponseImpl.fromJson;

  @override
  @JsonKey(name: 'message')
  String get message;
  @override
  @JsonKey(name: 'file_path')
  String get filePath;

  /// Create a copy of DeleteFileResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeleteFileResponseImplCopyWith<_$DeleteFileResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GetFileResponse _$GetFileResponseFromJson(Map<String, dynamic> json) {
  return _GetFileResponse.fromJson(json);
}

/// @nodoc
mixin _$GetFileResponse {
  @JsonKey(name: 'message')
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'file_bytes')
  String get rawFileBytes => throw _privateConstructorUsedError;

  /// Serializes this GetFileResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GetFileResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetFileResponseCopyWith<GetFileResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetFileResponseCopyWith<$Res> {
  factory $GetFileResponseCopyWith(
          GetFileResponse value, $Res Function(GetFileResponse) then) =
      _$GetFileResponseCopyWithImpl<$Res, GetFileResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'message') String message,
      @JsonKey(name: 'file_bytes') String rawFileBytes});
}

/// @nodoc
class _$GetFileResponseCopyWithImpl<$Res, $Val extends GetFileResponse>
    implements $GetFileResponseCopyWith<$Res> {
  _$GetFileResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetFileResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? rawFileBytes = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      rawFileBytes: null == rawFileBytes
          ? _value.rawFileBytes
          : rawFileBytes // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetFileResponseImplCopyWith<$Res>
    implements $GetFileResponseCopyWith<$Res> {
  factory _$$GetFileResponseImplCopyWith(_$GetFileResponseImpl value,
          $Res Function(_$GetFileResponseImpl) then) =
      __$$GetFileResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'message') String message,
      @JsonKey(name: 'file_bytes') String rawFileBytes});
}

/// @nodoc
class __$$GetFileResponseImplCopyWithImpl<$Res>
    extends _$GetFileResponseCopyWithImpl<$Res, _$GetFileResponseImpl>
    implements _$$GetFileResponseImplCopyWith<$Res> {
  __$$GetFileResponseImplCopyWithImpl(
      _$GetFileResponseImpl _value, $Res Function(_$GetFileResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetFileResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? rawFileBytes = null,
  }) {
    return _then(_$GetFileResponseImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      rawFileBytes: null == rawFileBytes
          ? _value.rawFileBytes
          : rawFileBytes // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetFileResponseImpl implements _GetFileResponse {
  const _$GetFileResponseImpl(
      {@JsonKey(name: 'message') this.message = '',
      @JsonKey(name: 'file_bytes') this.rawFileBytes = ''});

  factory _$GetFileResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetFileResponseImplFromJson(json);

  @override
  @JsonKey(name: 'message')
  final String message;
  @override
  @JsonKey(name: 'file_bytes')
  final String rawFileBytes;

  @override
  String toString() {
    return 'GetFileResponse(message: $message, rawFileBytes: $rawFileBytes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetFileResponseImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.rawFileBytes, rawFileBytes) ||
                other.rawFileBytes == rawFileBytes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message, rawFileBytes);

  /// Create a copy of GetFileResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetFileResponseImplCopyWith<_$GetFileResponseImpl> get copyWith =>
      __$$GetFileResponseImplCopyWithImpl<_$GetFileResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetFileResponseImplToJson(
      this,
    );
  }
}

abstract class _GetFileResponse implements GetFileResponse {
  const factory _GetFileResponse(
          {@JsonKey(name: 'message') final String message,
          @JsonKey(name: 'file_bytes') final String rawFileBytes}) =
      _$GetFileResponseImpl;

  factory _GetFileResponse.fromJson(Map<String, dynamic> json) =
      _$GetFileResponseImpl.fromJson;

  @override
  @JsonKey(name: 'message')
  String get message;
  @override
  @JsonKey(name: 'file_bytes')
  String get rawFileBytes;

  /// Create a copy of GetFileResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetFileResponseImplCopyWith<_$GetFileResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
