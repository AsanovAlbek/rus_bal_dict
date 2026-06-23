// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dictionary_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WordActionResponse _$WordActionResponseFromJson(Map<String, dynamic> json) {
  return _WordActionResponse.fromJson(json);
}

/// @nodoc
mixin _$WordActionResponse {
  @JsonKey(name: 'message')
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'word')
  Word get word => throw _privateConstructorUsedError;

  /// Serializes this WordActionResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WordActionResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WordActionResponseCopyWith<WordActionResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WordActionResponseCopyWith<$Res> {
  factory $WordActionResponseCopyWith(
          WordActionResponse value, $Res Function(WordActionResponse) then) =
      _$WordActionResponseCopyWithImpl<$Res, WordActionResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'message') String message,
      @JsonKey(name: 'word') Word word});

  $WordCopyWith<$Res> get word;
}

/// @nodoc
class _$WordActionResponseCopyWithImpl<$Res, $Val extends WordActionResponse>
    implements $WordActionResponseCopyWith<$Res> {
  _$WordActionResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WordActionResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? word = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      word: null == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as Word,
    ) as $Val);
  }

  /// Create a copy of WordActionResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WordCopyWith<$Res> get word {
    return $WordCopyWith<$Res>(_value.word, (value) {
      return _then(_value.copyWith(word: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WordActionResponseImplCopyWith<$Res>
    implements $WordActionResponseCopyWith<$Res> {
  factory _$$WordActionResponseImplCopyWith(_$WordActionResponseImpl value,
          $Res Function(_$WordActionResponseImpl) then) =
      __$$WordActionResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'message') String message,
      @JsonKey(name: 'word') Word word});

  @override
  $WordCopyWith<$Res> get word;
}

/// @nodoc
class __$$WordActionResponseImplCopyWithImpl<$Res>
    extends _$WordActionResponseCopyWithImpl<$Res, _$WordActionResponseImpl>
    implements _$$WordActionResponseImplCopyWith<$Res> {
  __$$WordActionResponseImplCopyWithImpl(_$WordActionResponseImpl _value,
      $Res Function(_$WordActionResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of WordActionResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? word = null,
  }) {
    return _then(_$WordActionResponseImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      word: null == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as Word,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WordActionResponseImpl implements _WordActionResponse {
  const _$WordActionResponseImpl(
      {@JsonKey(name: 'message') this.message = '',
      @JsonKey(name: 'word') this.word = const Word()});

  factory _$WordActionResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$WordActionResponseImplFromJson(json);

  @override
  @JsonKey(name: 'message')
  final String message;
  @override
  @JsonKey(name: 'word')
  final Word word;

  @override
  String toString() {
    return 'WordActionResponse(message: $message, word: $word)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WordActionResponseImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.word, word) || other.word == word));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message, word);

  /// Create a copy of WordActionResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WordActionResponseImplCopyWith<_$WordActionResponseImpl> get copyWith =>
      __$$WordActionResponseImplCopyWithImpl<_$WordActionResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WordActionResponseImplToJson(
      this,
    );
  }
}

abstract class _WordActionResponse implements WordActionResponse {
  const factory _WordActionResponse(
      {@JsonKey(name: 'message') final String message,
      @JsonKey(name: 'word') final Word word}) = _$WordActionResponseImpl;

  factory _WordActionResponse.fromJson(Map<String, dynamic> json) =
      _$WordActionResponseImpl.fromJson;

  @override
  @JsonKey(name: 'message')
  String get message;
  @override
  @JsonKey(name: 'word')
  Word get word;

  /// Create a copy of WordActionResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WordActionResponseImplCopyWith<_$WordActionResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OnlyWordBody _$OnlyWordBodyFromJson(Map<String, dynamic> json) {
  return _OnlyWordBody.fromJson(json);
}

/// @nodoc
mixin _$OnlyWordBody {
  @JsonKey(name: 'word')
  Word get word => throw _privateConstructorUsedError;

  /// Serializes this OnlyWordBody to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OnlyWordBody
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OnlyWordBodyCopyWith<OnlyWordBody> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnlyWordBodyCopyWith<$Res> {
  factory $OnlyWordBodyCopyWith(
          OnlyWordBody value, $Res Function(OnlyWordBody) then) =
      _$OnlyWordBodyCopyWithImpl<$Res, OnlyWordBody>;
  @useResult
  $Res call({@JsonKey(name: 'word') Word word});

  $WordCopyWith<$Res> get word;
}

/// @nodoc
class _$OnlyWordBodyCopyWithImpl<$Res, $Val extends OnlyWordBody>
    implements $OnlyWordBodyCopyWith<$Res> {
  _$OnlyWordBodyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OnlyWordBody
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? word = null,
  }) {
    return _then(_value.copyWith(
      word: null == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as Word,
    ) as $Val);
  }

  /// Create a copy of OnlyWordBody
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WordCopyWith<$Res> get word {
    return $WordCopyWith<$Res>(_value.word, (value) {
      return _then(_value.copyWith(word: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OnlyWordBodyImplCopyWith<$Res>
    implements $OnlyWordBodyCopyWith<$Res> {
  factory _$$OnlyWordBodyImplCopyWith(
          _$OnlyWordBodyImpl value, $Res Function(_$OnlyWordBodyImpl) then) =
      __$$OnlyWordBodyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'word') Word word});

  @override
  $WordCopyWith<$Res> get word;
}

/// @nodoc
class __$$OnlyWordBodyImplCopyWithImpl<$Res>
    extends _$OnlyWordBodyCopyWithImpl<$Res, _$OnlyWordBodyImpl>
    implements _$$OnlyWordBodyImplCopyWith<$Res> {
  __$$OnlyWordBodyImplCopyWithImpl(
      _$OnlyWordBodyImpl _value, $Res Function(_$OnlyWordBodyImpl) _then)
      : super(_value, _then);

  /// Create a copy of OnlyWordBody
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? word = null,
  }) {
    return _then(_$OnlyWordBodyImpl(
      word: null == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as Word,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OnlyWordBodyImpl implements _OnlyWordBody {
  const _$OnlyWordBodyImpl({@JsonKey(name: 'word') this.word = const Word()});

  factory _$OnlyWordBodyImpl.fromJson(Map<String, dynamic> json) =>
      _$$OnlyWordBodyImplFromJson(json);

  @override
  @JsonKey(name: 'word')
  final Word word;

  @override
  String toString() {
    return 'OnlyWordBody(word: $word)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnlyWordBodyImpl &&
            (identical(other.word, word) || other.word == word));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, word);

  /// Create a copy of OnlyWordBody
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OnlyWordBodyImplCopyWith<_$OnlyWordBodyImpl> get copyWith =>
      __$$OnlyWordBodyImplCopyWithImpl<_$OnlyWordBodyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OnlyWordBodyImplToJson(
      this,
    );
  }
}

abstract class _OnlyWordBody implements OnlyWordBody {
  const factory _OnlyWordBody({@JsonKey(name: 'word') final Word word}) =
      _$OnlyWordBodyImpl;

  factory _OnlyWordBody.fromJson(Map<String, dynamic> json) =
      _$OnlyWordBodyImpl.fromJson;

  @override
  @JsonKey(name: 'word')
  Word get word;

  /// Create a copy of OnlyWordBody
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OnlyWordBodyImplCopyWith<_$OnlyWordBodyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RemoveWordBody _$RemoveWordBodyFromJson(Map<String, dynamic> json) {
  return _RemoveWordBody.fromJson(json);
}

/// @nodoc
mixin _$RemoveWordBody {
  @JsonKey(name: 'word_id')
  int get wordId => throw _privateConstructorUsedError;

  /// Serializes this RemoveWordBody to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RemoveWordBody
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RemoveWordBodyCopyWith<RemoveWordBody> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RemoveWordBodyCopyWith<$Res> {
  factory $RemoveWordBodyCopyWith(
          RemoveWordBody value, $Res Function(RemoveWordBody) then) =
      _$RemoveWordBodyCopyWithImpl<$Res, RemoveWordBody>;
  @useResult
  $Res call({@JsonKey(name: 'word_id') int wordId});
}

/// @nodoc
class _$RemoveWordBodyCopyWithImpl<$Res, $Val extends RemoveWordBody>
    implements $RemoveWordBodyCopyWith<$Res> {
  _$RemoveWordBodyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RemoveWordBody
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wordId = null,
  }) {
    return _then(_value.copyWith(
      wordId: null == wordId
          ? _value.wordId
          : wordId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RemoveWordBodyImplCopyWith<$Res>
    implements $RemoveWordBodyCopyWith<$Res> {
  factory _$$RemoveWordBodyImplCopyWith(_$RemoveWordBodyImpl value,
          $Res Function(_$RemoveWordBodyImpl) then) =
      __$$RemoveWordBodyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'word_id') int wordId});
}

/// @nodoc
class __$$RemoveWordBodyImplCopyWithImpl<$Res>
    extends _$RemoveWordBodyCopyWithImpl<$Res, _$RemoveWordBodyImpl>
    implements _$$RemoveWordBodyImplCopyWith<$Res> {
  __$$RemoveWordBodyImplCopyWithImpl(
      _$RemoveWordBodyImpl _value, $Res Function(_$RemoveWordBodyImpl) _then)
      : super(_value, _then);

  /// Create a copy of RemoveWordBody
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wordId = null,
  }) {
    return _then(_$RemoveWordBodyImpl(
      wordId: null == wordId
          ? _value.wordId
          : wordId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RemoveWordBodyImpl implements _RemoveWordBody {
  const _$RemoveWordBodyImpl({@JsonKey(name: 'word_id') this.wordId = -1});

  factory _$RemoveWordBodyImpl.fromJson(Map<String, dynamic> json) =>
      _$$RemoveWordBodyImplFromJson(json);

  @override
  @JsonKey(name: 'word_id')
  final int wordId;

  @override
  String toString() {
    return 'RemoveWordBody(wordId: $wordId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveWordBodyImpl &&
            (identical(other.wordId, wordId) || other.wordId == wordId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, wordId);

  /// Create a copy of RemoveWordBody
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveWordBodyImplCopyWith<_$RemoveWordBodyImpl> get copyWith =>
      __$$RemoveWordBodyImplCopyWithImpl<_$RemoveWordBodyImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RemoveWordBodyImplToJson(
      this,
    );
  }
}

abstract class _RemoveWordBody implements RemoveWordBody {
  const factory _RemoveWordBody({@JsonKey(name: 'word_id') final int wordId}) =
      _$RemoveWordBodyImpl;

  factory _RemoveWordBody.fromJson(Map<String, dynamic> json) =
      _$RemoveWordBodyImpl.fromJson;

  @override
  @JsonKey(name: 'word_id')
  int get wordId;

  /// Create a copy of RemoveWordBody
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RemoveWordBodyImplCopyWith<_$RemoveWordBodyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GetWordsBody _$GetWordsBodyFromJson(Map<String, dynamic> json) {
  return _GetWordsBody.fromJson(json);
}

/// @nodoc
mixin _$GetWordsBody {
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'page')
  int get page => throw _privateConstructorUsedError;
  @JsonKey(name: 'size')
  int get size => throw _privateConstructorUsedError;

  /// Serializes this GetWordsBody to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GetWordsBody
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetWordsBodyCopyWith<GetWordsBody> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetWordsBodyCopyWith<$Res> {
  factory $GetWordsBodyCopyWith(
          GetWordsBody value, $Res Function(GetWordsBody) then) =
      _$GetWordsBodyCopyWithImpl<$Res, GetWordsBody>;
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String name,
      @JsonKey(name: 'page') int page,
      @JsonKey(name: 'size') int size});
}

/// @nodoc
class _$GetWordsBodyCopyWithImpl<$Res, $Val extends GetWordsBody>
    implements $GetWordsBodyCopyWith<$Res> {
  _$GetWordsBodyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetWordsBody
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? page = null,
    Object? size = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetWordsBodyImplCopyWith<$Res>
    implements $GetWordsBodyCopyWith<$Res> {
  factory _$$GetWordsBodyImplCopyWith(
          _$GetWordsBodyImpl value, $Res Function(_$GetWordsBodyImpl) then) =
      __$$GetWordsBodyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String name,
      @JsonKey(name: 'page') int page,
      @JsonKey(name: 'size') int size});
}

/// @nodoc
class __$$GetWordsBodyImplCopyWithImpl<$Res>
    extends _$GetWordsBodyCopyWithImpl<$Res, _$GetWordsBodyImpl>
    implements _$$GetWordsBodyImplCopyWith<$Res> {
  __$$GetWordsBodyImplCopyWithImpl(
      _$GetWordsBodyImpl _value, $Res Function(_$GetWordsBodyImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetWordsBody
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? page = null,
    Object? size = null,
  }) {
    return _then(_$GetWordsBodyImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetWordsBodyImpl implements _GetWordsBody {
  const _$GetWordsBodyImpl(
      {@JsonKey(name: 'name') this.name = '',
      @JsonKey(name: 'page') this.page = 0,
      @JsonKey(name: 'size') this.size = 100});

  factory _$GetWordsBodyImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetWordsBodyImplFromJson(json);

  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'page')
  final int page;
  @override
  @JsonKey(name: 'size')
  final int size;

  @override
  String toString() {
    return 'GetWordsBody(name: $name, page: $page, size: $size)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetWordsBodyImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.size, size) || other.size == size));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, page, size);

  /// Create a copy of GetWordsBody
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetWordsBodyImplCopyWith<_$GetWordsBodyImpl> get copyWith =>
      __$$GetWordsBodyImplCopyWithImpl<_$GetWordsBodyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetWordsBodyImplToJson(
      this,
    );
  }
}

abstract class _GetWordsBody implements GetWordsBody {
  const factory _GetWordsBody(
      {@JsonKey(name: 'name') final String name,
      @JsonKey(name: 'page') final int page,
      @JsonKey(name: 'size') final int size}) = _$GetWordsBodyImpl;

  factory _GetWordsBody.fromJson(Map<String, dynamic> json) =
      _$GetWordsBodyImpl.fromJson;

  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'page')
  int get page;
  @override
  @JsonKey(name: 'size')
  int get size;

  /// Create a copy of GetWordsBody
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetWordsBodyImplCopyWith<_$GetWordsBodyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WordByIdBody _$WordByIdBodyFromJson(Map<String, dynamic> json) {
  return _WordByIdBody.fromJson(json);
}

/// @nodoc
mixin _$WordByIdBody {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;

  /// Serializes this WordByIdBody to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WordByIdBody
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WordByIdBodyCopyWith<WordByIdBody> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WordByIdBodyCopyWith<$Res> {
  factory $WordByIdBodyCopyWith(
          WordByIdBody value, $Res Function(WordByIdBody) then) =
      _$WordByIdBodyCopyWithImpl<$Res, WordByIdBody>;
  @useResult
  $Res call({@JsonKey(name: 'id') int id});
}

/// @nodoc
class _$WordByIdBodyCopyWithImpl<$Res, $Val extends WordByIdBody>
    implements $WordByIdBodyCopyWith<$Res> {
  _$WordByIdBodyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WordByIdBody
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WordByIdBodyImplCopyWith<$Res>
    implements $WordByIdBodyCopyWith<$Res> {
  factory _$$WordByIdBodyImplCopyWith(
          _$WordByIdBodyImpl value, $Res Function(_$WordByIdBodyImpl) then) =
      __$$WordByIdBodyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'id') int id});
}

/// @nodoc
class __$$WordByIdBodyImplCopyWithImpl<$Res>
    extends _$WordByIdBodyCopyWithImpl<$Res, _$WordByIdBodyImpl>
    implements _$$WordByIdBodyImplCopyWith<$Res> {
  __$$WordByIdBodyImplCopyWithImpl(
      _$WordByIdBodyImpl _value, $Res Function(_$WordByIdBodyImpl) _then)
      : super(_value, _then);

  /// Create a copy of WordByIdBody
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$WordByIdBodyImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WordByIdBodyImpl implements _WordByIdBody {
  const _$WordByIdBodyImpl({@JsonKey(name: 'id') this.id = -1});

  factory _$WordByIdBodyImpl.fromJson(Map<String, dynamic> json) =>
      _$$WordByIdBodyImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;

  @override
  String toString() {
    return 'WordByIdBody(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WordByIdBodyImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of WordByIdBody
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WordByIdBodyImplCopyWith<_$WordByIdBodyImpl> get copyWith =>
      __$$WordByIdBodyImplCopyWithImpl<_$WordByIdBodyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WordByIdBodyImplToJson(
      this,
    );
  }
}

abstract class _WordByIdBody implements WordByIdBody {
  const factory _WordByIdBody({@JsonKey(name: 'id') final int id}) =
      _$WordByIdBodyImpl;

  factory _WordByIdBody.fromJson(Map<String, dynamic> json) =
      _$WordByIdBodyImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;

  /// Create a copy of WordByIdBody
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WordByIdBodyImplCopyWith<_$WordByIdBodyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
