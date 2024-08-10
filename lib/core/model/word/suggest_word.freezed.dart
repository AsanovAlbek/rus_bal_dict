// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'suggest_word.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SuggestWord _$SuggestWordFromJson(Map<String, dynamic> json) {
  return _SuggestWord.fromJson(json);
}

/// @nodoc
mixin _$SuggestWord {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'word')
  String get word => throw _privateConstructorUsedError;
  @JsonKey(name: 'meaning')
  String get meaning => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  int get userId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SuggestWordCopyWith<SuggestWord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SuggestWordCopyWith<$Res> {
  factory $SuggestWordCopyWith(
          SuggestWord value, $Res Function(SuggestWord) then) =
      _$SuggestWordCopyWithImpl<$Res, SuggestWord>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'word') String word,
      @JsonKey(name: 'meaning') String meaning,
      @JsonKey(name: 'user_id') int userId});
}

/// @nodoc
class _$SuggestWordCopyWithImpl<$Res, $Val extends SuggestWord>
    implements $SuggestWordCopyWith<$Res> {
  _$SuggestWordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? word = null,
    Object? meaning = null,
    Object? userId = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      word: null == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
      meaning: null == meaning
          ? _value.meaning
          : meaning // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SuggestWordImplCopyWith<$Res>
    implements $SuggestWordCopyWith<$Res> {
  factory _$$SuggestWordImplCopyWith(
          _$SuggestWordImpl value, $Res Function(_$SuggestWordImpl) then) =
      __$$SuggestWordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'word') String word,
      @JsonKey(name: 'meaning') String meaning,
      @JsonKey(name: 'user_id') int userId});
}

/// @nodoc
class __$$SuggestWordImplCopyWithImpl<$Res>
    extends _$SuggestWordCopyWithImpl<$Res, _$SuggestWordImpl>
    implements _$$SuggestWordImplCopyWith<$Res> {
  __$$SuggestWordImplCopyWithImpl(
      _$SuggestWordImpl _value, $Res Function(_$SuggestWordImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? word = null,
    Object? meaning = null,
    Object? userId = null,
  }) {
    return _then(_$SuggestWordImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      word: null == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
      meaning: null == meaning
          ? _value.meaning
          : meaning // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SuggestWordImpl implements _SuggestWord {
  const _$SuggestWordImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'word') this.word = '',
      @JsonKey(name: 'meaning') this.meaning = '',
      @JsonKey(name: 'user_id') this.userId = 0});

  factory _$SuggestWordImpl.fromJson(Map<String, dynamic> json) =>
      _$$SuggestWordImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'word')
  final String word;
  @override
  @JsonKey(name: 'meaning')
  final String meaning;
  @override
  @JsonKey(name: 'user_id')
  final int userId;

  @override
  String toString() {
    return 'SuggestWord(id: $id, word: $word, meaning: $meaning, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuggestWordImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.word, word) || other.word == word) &&
            (identical(other.meaning, meaning) || other.meaning == meaning) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, word, meaning, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuggestWordImplCopyWith<_$SuggestWordImpl> get copyWith =>
      __$$SuggestWordImplCopyWithImpl<_$SuggestWordImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SuggestWordImplToJson(
      this,
    );
  }
}

abstract class _SuggestWord implements SuggestWord {
  const factory _SuggestWord(
      {@JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'word') final String word,
      @JsonKey(name: 'meaning') final String meaning,
      @JsonKey(name: 'user_id') final int userId}) = _$SuggestWordImpl;

  factory _SuggestWord.fromJson(Map<String, dynamic> json) =
      _$SuggestWordImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'word')
  String get word;
  @override
  @JsonKey(name: 'meaning')
  String get meaning;
  @override
  @JsonKey(name: 'user_id')
  int get userId;
  @override
  @JsonKey(ignore: true)
  _$$SuggestWordImplCopyWith<_$SuggestWordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
