// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'suggest_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SuggestResponse _$SuggestResponseFromJson(Map<String, dynamic> json) {
  return _SuggestResponse.fromJson(json);
}

/// @nodoc
mixin _$SuggestResponse {
  @JsonKey(name: 'message')
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'suggest_word')
  SuggestWord get suggestWord => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SuggestResponseCopyWith<SuggestResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SuggestResponseCopyWith<$Res> {
  factory $SuggestResponseCopyWith(
          SuggestResponse value, $Res Function(SuggestResponse) then) =
      _$SuggestResponseCopyWithImpl<$Res, SuggestResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'message') String message,
      @JsonKey(name: 'suggest_word') SuggestWord suggestWord});

  $SuggestWordCopyWith<$Res> get suggestWord;
}

/// @nodoc
class _$SuggestResponseCopyWithImpl<$Res, $Val extends SuggestResponse>
    implements $SuggestResponseCopyWith<$Res> {
  _$SuggestResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? suggestWord = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      suggestWord: null == suggestWord
          ? _value.suggestWord
          : suggestWord // ignore: cast_nullable_to_non_nullable
              as SuggestWord,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SuggestWordCopyWith<$Res> get suggestWord {
    return $SuggestWordCopyWith<$Res>(_value.suggestWord, (value) {
      return _then(_value.copyWith(suggestWord: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SuggestResponseImplCopyWith<$Res>
    implements $SuggestResponseCopyWith<$Res> {
  factory _$$SuggestResponseImplCopyWith(_$SuggestResponseImpl value,
          $Res Function(_$SuggestResponseImpl) then) =
      __$$SuggestResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'message') String message,
      @JsonKey(name: 'suggest_word') SuggestWord suggestWord});

  @override
  $SuggestWordCopyWith<$Res> get suggestWord;
}

/// @nodoc
class __$$SuggestResponseImplCopyWithImpl<$Res>
    extends _$SuggestResponseCopyWithImpl<$Res, _$SuggestResponseImpl>
    implements _$$SuggestResponseImplCopyWith<$Res> {
  __$$SuggestResponseImplCopyWithImpl(
      _$SuggestResponseImpl _value, $Res Function(_$SuggestResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? suggestWord = null,
  }) {
    return _then(_$SuggestResponseImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      suggestWord: null == suggestWord
          ? _value.suggestWord
          : suggestWord // ignore: cast_nullable_to_non_nullable
              as SuggestWord,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SuggestResponseImpl implements _SuggestResponse {
  const _$SuggestResponseImpl(
      {@JsonKey(name: 'message') this.message = '',
      @JsonKey(name: 'suggest_word') this.suggestWord = const SuggestWord()});

  factory _$SuggestResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SuggestResponseImplFromJson(json);

  @override
  @JsonKey(name: 'message')
  final String message;
  @override
  @JsonKey(name: 'suggest_word')
  final SuggestWord suggestWord;

  @override
  String toString() {
    return 'SuggestResponse(message: $message, suggestWord: $suggestWord)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuggestResponseImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.suggestWord, suggestWord) ||
                other.suggestWord == suggestWord));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message, suggestWord);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuggestResponseImplCopyWith<_$SuggestResponseImpl> get copyWith =>
      __$$SuggestResponseImplCopyWithImpl<_$SuggestResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SuggestResponseImplToJson(
      this,
    );
  }
}

abstract class _SuggestResponse implements SuggestResponse {
  const factory _SuggestResponse(
          {@JsonKey(name: 'message') final String message,
          @JsonKey(name: 'suggest_word') final SuggestWord suggestWord}) =
      _$SuggestResponseImpl;

  factory _SuggestResponse.fromJson(Map<String, dynamic> json) =
      _$SuggestResponseImpl.fromJson;

  @override
  @JsonKey(name: 'message')
  String get message;
  @override
  @JsonKey(name: 'suggest_word')
  SuggestWord get suggestWord;
  @override
  @JsonKey(ignore: true)
  _$$SuggestResponseImplCopyWith<_$SuggestResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SuggestAcceptResponse _$SuggestAcceptResponseFromJson(
    Map<String, dynamic> json) {
  return _SuggestAcceptResponse.fromJson(json);
}

/// @nodoc
mixin _$SuggestAcceptResponse {
  @JsonKey(name: 'message')
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'suggest')
  SuggestWord get suggestWord => throw _privateConstructorUsedError;
  @JsonKey(name: 'word')
  Word get word => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SuggestAcceptResponseCopyWith<SuggestAcceptResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SuggestAcceptResponseCopyWith<$Res> {
  factory $SuggestAcceptResponseCopyWith(SuggestAcceptResponse value,
          $Res Function(SuggestAcceptResponse) then) =
      _$SuggestAcceptResponseCopyWithImpl<$Res, SuggestAcceptResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'message') String message,
      @JsonKey(name: 'suggest') SuggestWord suggestWord,
      @JsonKey(name: 'word') Word word});

  $SuggestWordCopyWith<$Res> get suggestWord;
  $WordCopyWith<$Res> get word;
}

/// @nodoc
class _$SuggestAcceptResponseCopyWithImpl<$Res,
        $Val extends SuggestAcceptResponse>
    implements $SuggestAcceptResponseCopyWith<$Res> {
  _$SuggestAcceptResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? suggestWord = null,
    Object? word = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      suggestWord: null == suggestWord
          ? _value.suggestWord
          : suggestWord // ignore: cast_nullable_to_non_nullable
              as SuggestWord,
      word: null == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as Word,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SuggestWordCopyWith<$Res> get suggestWord {
    return $SuggestWordCopyWith<$Res>(_value.suggestWord, (value) {
      return _then(_value.copyWith(suggestWord: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $WordCopyWith<$Res> get word {
    return $WordCopyWith<$Res>(_value.word, (value) {
      return _then(_value.copyWith(word: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SuggestAcceptResponseImplCopyWith<$Res>
    implements $SuggestAcceptResponseCopyWith<$Res> {
  factory _$$SuggestAcceptResponseImplCopyWith(
          _$SuggestAcceptResponseImpl value,
          $Res Function(_$SuggestAcceptResponseImpl) then) =
      __$$SuggestAcceptResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'message') String message,
      @JsonKey(name: 'suggest') SuggestWord suggestWord,
      @JsonKey(name: 'word') Word word});

  @override
  $SuggestWordCopyWith<$Res> get suggestWord;
  @override
  $WordCopyWith<$Res> get word;
}

/// @nodoc
class __$$SuggestAcceptResponseImplCopyWithImpl<$Res>
    extends _$SuggestAcceptResponseCopyWithImpl<$Res,
        _$SuggestAcceptResponseImpl>
    implements _$$SuggestAcceptResponseImplCopyWith<$Res> {
  __$$SuggestAcceptResponseImplCopyWithImpl(_$SuggestAcceptResponseImpl _value,
      $Res Function(_$SuggestAcceptResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? suggestWord = null,
    Object? word = null,
  }) {
    return _then(_$SuggestAcceptResponseImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      suggestWord: null == suggestWord
          ? _value.suggestWord
          : suggestWord // ignore: cast_nullable_to_non_nullable
              as SuggestWord,
      word: null == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as Word,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SuggestAcceptResponseImpl implements _SuggestAcceptResponse {
  const _$SuggestAcceptResponseImpl(
      {@JsonKey(name: 'message') this.message = '',
      @JsonKey(name: 'suggest') this.suggestWord = const SuggestWord(),
      @JsonKey(name: 'word') this.word = const Word()});

  factory _$SuggestAcceptResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SuggestAcceptResponseImplFromJson(json);

  @override
  @JsonKey(name: 'message')
  final String message;
  @override
  @JsonKey(name: 'suggest')
  final SuggestWord suggestWord;
  @override
  @JsonKey(name: 'word')
  final Word word;

  @override
  String toString() {
    return 'SuggestAcceptResponse(message: $message, suggestWord: $suggestWord, word: $word)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuggestAcceptResponseImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.suggestWord, suggestWord) ||
                other.suggestWord == suggestWord) &&
            (identical(other.word, word) || other.word == word));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message, suggestWord, word);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuggestAcceptResponseImplCopyWith<_$SuggestAcceptResponseImpl>
      get copyWith => __$$SuggestAcceptResponseImplCopyWithImpl<
          _$SuggestAcceptResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SuggestAcceptResponseImplToJson(
      this,
    );
  }
}

abstract class _SuggestAcceptResponse implements SuggestAcceptResponse {
  const factory _SuggestAcceptResponse(
      {@JsonKey(name: 'message') final String message,
      @JsonKey(name: 'suggest') final SuggestWord suggestWord,
      @JsonKey(name: 'word') final Word word}) = _$SuggestAcceptResponseImpl;

  factory _SuggestAcceptResponse.fromJson(Map<String, dynamic> json) =
      _$SuggestAcceptResponseImpl.fromJson;

  @override
  @JsonKey(name: 'message')
  String get message;
  @override
  @JsonKey(name: 'suggest')
  SuggestWord get suggestWord;
  @override
  @JsonKey(name: 'word')
  Word get word;
  @override
  @JsonKey(ignore: true)
  _$$SuggestAcceptResponseImplCopyWith<_$SuggestAcceptResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SuggestRejectResponse _$SuggestRejectResponseFromJson(
    Map<String, dynamic> json) {
  return _SuggestRejectResponse.fromJson(json);
}

/// @nodoc
mixin _$SuggestRejectResponse {
  @JsonKey(name: 'message')
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'suggest')
  SuggestWord get suggestWord => throw _privateConstructorUsedError;
  @JsonKey(name: 'word')
  Word get word => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SuggestRejectResponseCopyWith<SuggestRejectResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SuggestRejectResponseCopyWith<$Res> {
  factory $SuggestRejectResponseCopyWith(SuggestRejectResponse value,
          $Res Function(SuggestRejectResponse) then) =
      _$SuggestRejectResponseCopyWithImpl<$Res, SuggestRejectResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'message') String message,
      @JsonKey(name: 'suggest') SuggestWord suggestWord,
      @JsonKey(name: 'word') Word word});

  $SuggestWordCopyWith<$Res> get suggestWord;
  $WordCopyWith<$Res> get word;
}

/// @nodoc
class _$SuggestRejectResponseCopyWithImpl<$Res,
        $Val extends SuggestRejectResponse>
    implements $SuggestRejectResponseCopyWith<$Res> {
  _$SuggestRejectResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? suggestWord = null,
    Object? word = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      suggestWord: null == suggestWord
          ? _value.suggestWord
          : suggestWord // ignore: cast_nullable_to_non_nullable
              as SuggestWord,
      word: null == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as Word,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SuggestWordCopyWith<$Res> get suggestWord {
    return $SuggestWordCopyWith<$Res>(_value.suggestWord, (value) {
      return _then(_value.copyWith(suggestWord: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $WordCopyWith<$Res> get word {
    return $WordCopyWith<$Res>(_value.word, (value) {
      return _then(_value.copyWith(word: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SuggestRejectResponseImplCopyWith<$Res>
    implements $SuggestRejectResponseCopyWith<$Res> {
  factory _$$SuggestRejectResponseImplCopyWith(
          _$SuggestRejectResponseImpl value,
          $Res Function(_$SuggestRejectResponseImpl) then) =
      __$$SuggestRejectResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'message') String message,
      @JsonKey(name: 'suggest') SuggestWord suggestWord,
      @JsonKey(name: 'word') Word word});

  @override
  $SuggestWordCopyWith<$Res> get suggestWord;
  @override
  $WordCopyWith<$Res> get word;
}

/// @nodoc
class __$$SuggestRejectResponseImplCopyWithImpl<$Res>
    extends _$SuggestRejectResponseCopyWithImpl<$Res,
        _$SuggestRejectResponseImpl>
    implements _$$SuggestRejectResponseImplCopyWith<$Res> {
  __$$SuggestRejectResponseImplCopyWithImpl(_$SuggestRejectResponseImpl _value,
      $Res Function(_$SuggestRejectResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? suggestWord = null,
    Object? word = null,
  }) {
    return _then(_$SuggestRejectResponseImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      suggestWord: null == suggestWord
          ? _value.suggestWord
          : suggestWord // ignore: cast_nullable_to_non_nullable
              as SuggestWord,
      word: null == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as Word,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SuggestRejectResponseImpl implements _SuggestRejectResponse {
  const _$SuggestRejectResponseImpl(
      {@JsonKey(name: 'message') this.message = '',
      @JsonKey(name: 'suggest') this.suggestWord = const SuggestWord(),
      @JsonKey(name: 'word') this.word = const Word()});

  factory _$SuggestRejectResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SuggestRejectResponseImplFromJson(json);

  @override
  @JsonKey(name: 'message')
  final String message;
  @override
  @JsonKey(name: 'suggest')
  final SuggestWord suggestWord;
  @override
  @JsonKey(name: 'word')
  final Word word;

  @override
  String toString() {
    return 'SuggestRejectResponse(message: $message, suggestWord: $suggestWord, word: $word)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuggestRejectResponseImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.suggestWord, suggestWord) ||
                other.suggestWord == suggestWord) &&
            (identical(other.word, word) || other.word == word));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message, suggestWord, word);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuggestRejectResponseImplCopyWith<_$SuggestRejectResponseImpl>
      get copyWith => __$$SuggestRejectResponseImplCopyWithImpl<
          _$SuggestRejectResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SuggestRejectResponseImplToJson(
      this,
    );
  }
}

abstract class _SuggestRejectResponse implements SuggestRejectResponse {
  const factory _SuggestRejectResponse(
      {@JsonKey(name: 'message') final String message,
      @JsonKey(name: 'suggest') final SuggestWord suggestWord,
      @JsonKey(name: 'word') final Word word}) = _$SuggestRejectResponseImpl;

  factory _SuggestRejectResponse.fromJson(Map<String, dynamic> json) =
      _$SuggestRejectResponseImpl.fromJson;

  @override
  @JsonKey(name: 'message')
  String get message;
  @override
  @JsonKey(name: 'suggest')
  SuggestWord get suggestWord;
  @override
  @JsonKey(name: 'word')
  Word get word;
  @override
  @JsonKey(ignore: true)
  _$$SuggestRejectResponseImplCopyWith<_$SuggestRejectResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

GetSuggestsBody _$GetSuggestsBodyFromJson(Map<String, dynamic> json) {
  return _GetSuggestsBody.fromJson(json);
}

/// @nodoc
mixin _$GetSuggestsBody {
  @JsonKey(name: 'user_id')
  int get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'page')
  int get page => throw _privateConstructorUsedError;
  @JsonKey(name: 'size')
  int get size => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetSuggestsBodyCopyWith<GetSuggestsBody> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetSuggestsBodyCopyWith<$Res> {
  factory $GetSuggestsBodyCopyWith(
          GetSuggestsBody value, $Res Function(GetSuggestsBody) then) =
      _$GetSuggestsBodyCopyWithImpl<$Res, GetSuggestsBody>;
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') int userId,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'page') int page,
      @JsonKey(name: 'size') int size});
}

/// @nodoc
class _$GetSuggestsBodyCopyWithImpl<$Res, $Val extends GetSuggestsBody>
    implements $GetSuggestsBodyCopyWith<$Res> {
  _$GetSuggestsBodyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? name = null,
    Object? page = null,
    Object? size = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
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
abstract class _$$GetSuggestsBodyImplCopyWith<$Res>
    implements $GetSuggestsBodyCopyWith<$Res> {
  factory _$$GetSuggestsBodyImplCopyWith(_$GetSuggestsBodyImpl value,
          $Res Function(_$GetSuggestsBodyImpl) then) =
      __$$GetSuggestsBodyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') int userId,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'page') int page,
      @JsonKey(name: 'size') int size});
}

/// @nodoc
class __$$GetSuggestsBodyImplCopyWithImpl<$Res>
    extends _$GetSuggestsBodyCopyWithImpl<$Res, _$GetSuggestsBodyImpl>
    implements _$$GetSuggestsBodyImplCopyWith<$Res> {
  __$$GetSuggestsBodyImplCopyWithImpl(
      _$GetSuggestsBodyImpl _value, $Res Function(_$GetSuggestsBodyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? name = null,
    Object? page = null,
    Object? size = null,
  }) {
    return _then(_$GetSuggestsBodyImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
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
class _$GetSuggestsBodyImpl implements _GetSuggestsBody {
  const _$GetSuggestsBodyImpl(
      {@JsonKey(name: 'user_id') this.userId = 0,
      @JsonKey(name: 'name') this.name = '',
      @JsonKey(name: 'page') this.page = 0,
      @JsonKey(name: 'size') this.size = 100});

  factory _$GetSuggestsBodyImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetSuggestsBodyImplFromJson(json);

  @override
  @JsonKey(name: 'user_id')
  final int userId;
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
    return 'GetSuggestsBody(userId: $userId, name: $name, page: $page, size: $size)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetSuggestsBodyImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.size, size) || other.size == size));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId, name, page, size);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetSuggestsBodyImplCopyWith<_$GetSuggestsBodyImpl> get copyWith =>
      __$$GetSuggestsBodyImplCopyWithImpl<_$GetSuggestsBodyImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetSuggestsBodyImplToJson(
      this,
    );
  }
}

abstract class _GetSuggestsBody implements GetSuggestsBody {
  const factory _GetSuggestsBody(
      {@JsonKey(name: 'user_id') final int userId,
      @JsonKey(name: 'name') final String name,
      @JsonKey(name: 'page') final int page,
      @JsonKey(name: 'size') final int size}) = _$GetSuggestsBodyImpl;

  factory _GetSuggestsBody.fromJson(Map<String, dynamic> json) =
      _$GetSuggestsBodyImpl.fromJson;

  @override
  @JsonKey(name: 'user_id')
  int get userId;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'page')
  int get page;
  @override
  @JsonKey(name: 'size')
  int get size;
  @override
  @JsonKey(ignore: true)
  _$$GetSuggestsBodyImplCopyWith<_$GetSuggestsBodyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GetAllSuggestsBody _$GetAllSuggestsBodyFromJson(Map<String, dynamic> json) {
  return _GetAllSuggestsBody.fromJson(json);
}

/// @nodoc
mixin _$GetAllSuggestsBody {
  @JsonKey(name: 'user_id')
  int get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'page')
  int get page => throw _privateConstructorUsedError;
  @JsonKey(name: 'size')
  int get size => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetAllSuggestsBodyCopyWith<GetAllSuggestsBody> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetAllSuggestsBodyCopyWith<$Res> {
  factory $GetAllSuggestsBodyCopyWith(
          GetAllSuggestsBody value, $Res Function(GetAllSuggestsBody) then) =
      _$GetAllSuggestsBodyCopyWithImpl<$Res, GetAllSuggestsBody>;
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') int userId,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'page') int page,
      @JsonKey(name: 'size') int size});
}

/// @nodoc
class _$GetAllSuggestsBodyCopyWithImpl<$Res, $Val extends GetAllSuggestsBody>
    implements $GetAllSuggestsBodyCopyWith<$Res> {
  _$GetAllSuggestsBodyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? name = null,
    Object? page = null,
    Object? size = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
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
abstract class _$$GetAllSuggestsBodyImplCopyWith<$Res>
    implements $GetAllSuggestsBodyCopyWith<$Res> {
  factory _$$GetAllSuggestsBodyImplCopyWith(_$GetAllSuggestsBodyImpl value,
          $Res Function(_$GetAllSuggestsBodyImpl) then) =
      __$$GetAllSuggestsBodyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') int userId,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'page') int page,
      @JsonKey(name: 'size') int size});
}

/// @nodoc
class __$$GetAllSuggestsBodyImplCopyWithImpl<$Res>
    extends _$GetAllSuggestsBodyCopyWithImpl<$Res, _$GetAllSuggestsBodyImpl>
    implements _$$GetAllSuggestsBodyImplCopyWith<$Res> {
  __$$GetAllSuggestsBodyImplCopyWithImpl(_$GetAllSuggestsBodyImpl _value,
      $Res Function(_$GetAllSuggestsBodyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? name = null,
    Object? page = null,
    Object? size = null,
  }) {
    return _then(_$GetAllSuggestsBodyImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
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
class _$GetAllSuggestsBodyImpl implements _GetAllSuggestsBody {
  const _$GetAllSuggestsBodyImpl(
      {@JsonKey(name: 'user_id') this.userId = 0,
      @JsonKey(name: 'name') this.name = '',
      @JsonKey(name: 'page') this.page = 0,
      @JsonKey(name: 'size') this.size = 100});

  factory _$GetAllSuggestsBodyImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetAllSuggestsBodyImplFromJson(json);

  @override
  @JsonKey(name: 'user_id')
  final int userId;
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
    return 'GetAllSuggestsBody(userId: $userId, name: $name, page: $page, size: $size)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetAllSuggestsBodyImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.size, size) || other.size == size));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId, name, page, size);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetAllSuggestsBodyImplCopyWith<_$GetAllSuggestsBodyImpl> get copyWith =>
      __$$GetAllSuggestsBodyImplCopyWithImpl<_$GetAllSuggestsBodyImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetAllSuggestsBodyImplToJson(
      this,
    );
  }
}

abstract class _GetAllSuggestsBody implements GetAllSuggestsBody {
  const factory _GetAllSuggestsBody(
      {@JsonKey(name: 'user_id') final int userId,
      @JsonKey(name: 'name') final String name,
      @JsonKey(name: 'page') final int page,
      @JsonKey(name: 'size') final int size}) = _$GetAllSuggestsBodyImpl;

  factory _GetAllSuggestsBody.fromJson(Map<String, dynamic> json) =
      _$GetAllSuggestsBodyImpl.fromJson;

  @override
  @JsonKey(name: 'user_id')
  int get userId;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'page')
  int get page;
  @override
  @JsonKey(name: 'size')
  int get size;
  @override
  @JsonKey(ignore: true)
  _$$GetAllSuggestsBodyImplCopyWith<_$GetAllSuggestsBodyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreateSuggestBody _$CreateSuggestBodyFromJson(Map<String, dynamic> json) {
  return _CreateSuggestBody.fromJson(json);
}

/// @nodoc
mixin _$CreateSuggestBody {
  @JsonKey(name: 'word')
  String get word => throw _privateConstructorUsedError;
  @JsonKey(name: 'meaning')
  String get meaning => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateSuggestBodyCopyWith<CreateSuggestBody> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateSuggestBodyCopyWith<$Res> {
  factory $CreateSuggestBodyCopyWith(
          CreateSuggestBody value, $Res Function(CreateSuggestBody) then) =
      _$CreateSuggestBodyCopyWithImpl<$Res, CreateSuggestBody>;
  @useResult
  $Res call(
      {@JsonKey(name: 'word') String word,
      @JsonKey(name: 'meaning') String meaning});
}

/// @nodoc
class _$CreateSuggestBodyCopyWithImpl<$Res, $Val extends CreateSuggestBody>
    implements $CreateSuggestBodyCopyWith<$Res> {
  _$CreateSuggestBodyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? word = null,
    Object? meaning = null,
  }) {
    return _then(_value.copyWith(
      word: null == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
      meaning: null == meaning
          ? _value.meaning
          : meaning // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateSuggestBodyImplCopyWith<$Res>
    implements $CreateSuggestBodyCopyWith<$Res> {
  factory _$$CreateSuggestBodyImplCopyWith(_$CreateSuggestBodyImpl value,
          $Res Function(_$CreateSuggestBodyImpl) then) =
      __$$CreateSuggestBodyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'word') String word,
      @JsonKey(name: 'meaning') String meaning});
}

/// @nodoc
class __$$CreateSuggestBodyImplCopyWithImpl<$Res>
    extends _$CreateSuggestBodyCopyWithImpl<$Res, _$CreateSuggestBodyImpl>
    implements _$$CreateSuggestBodyImplCopyWith<$Res> {
  __$$CreateSuggestBodyImplCopyWithImpl(_$CreateSuggestBodyImpl _value,
      $Res Function(_$CreateSuggestBodyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? word = null,
    Object? meaning = null,
  }) {
    return _then(_$CreateSuggestBodyImpl(
      word: null == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
      meaning: null == meaning
          ? _value.meaning
          : meaning // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateSuggestBodyImpl implements _CreateSuggestBody {
  const _$CreateSuggestBodyImpl(
      {@JsonKey(name: 'word') this.word = '',
      @JsonKey(name: 'meaning') this.meaning = ''});

  factory _$CreateSuggestBodyImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateSuggestBodyImplFromJson(json);

  @override
  @JsonKey(name: 'word')
  final String word;
  @override
  @JsonKey(name: 'meaning')
  final String meaning;

  @override
  String toString() {
    return 'CreateSuggestBody(word: $word, meaning: $meaning)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateSuggestBodyImpl &&
            (identical(other.word, word) || other.word == word) &&
            (identical(other.meaning, meaning) || other.meaning == meaning));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, word, meaning);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateSuggestBodyImplCopyWith<_$CreateSuggestBodyImpl> get copyWith =>
      __$$CreateSuggestBodyImplCopyWithImpl<_$CreateSuggestBodyImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateSuggestBodyImplToJson(
      this,
    );
  }
}

abstract class _CreateSuggestBody implements CreateSuggestBody {
  const factory _CreateSuggestBody(
          {@JsonKey(name: 'word') final String word,
          @JsonKey(name: 'meaning') final String meaning}) =
      _$CreateSuggestBodyImpl;

  factory _CreateSuggestBody.fromJson(Map<String, dynamic> json) =
      _$CreateSuggestBodyImpl.fromJson;

  @override
  @JsonKey(name: 'word')
  String get word;
  @override
  @JsonKey(name: 'meaning')
  String get meaning;
  @override
  @JsonKey(ignore: true)
  _$$CreateSuggestBodyImplCopyWith<_$CreateSuggestBodyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
