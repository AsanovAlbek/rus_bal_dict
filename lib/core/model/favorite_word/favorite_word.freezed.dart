// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorite_word.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FavoriteWord _$FavoriteWordFromJson(Map<String, dynamic> json) {
  return _FavoriteWord.fromJson(json);
}

/// @nodoc
mixin _$FavoriteWord {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  int get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'word_id')
  int get wordId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FavoriteWordCopyWith<FavoriteWord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteWordCopyWith<$Res> {
  factory $FavoriteWordCopyWith(
          FavoriteWord value, $Res Function(FavoriteWord) then) =
      _$FavoriteWordCopyWithImpl<$Res, FavoriteWord>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'user_id') int userId,
      @JsonKey(name: 'word_id') int wordId});
}

/// @nodoc
class _$FavoriteWordCopyWithImpl<$Res, $Val extends FavoriteWord>
    implements $FavoriteWordCopyWith<$Res> {
  _$FavoriteWordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? wordId = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      wordId: null == wordId
          ? _value.wordId
          : wordId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FavoriteWordImplCopyWith<$Res>
    implements $FavoriteWordCopyWith<$Res> {
  factory _$$FavoriteWordImplCopyWith(
          _$FavoriteWordImpl value, $Res Function(_$FavoriteWordImpl) then) =
      __$$FavoriteWordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'user_id') int userId,
      @JsonKey(name: 'word_id') int wordId});
}

/// @nodoc
class __$$FavoriteWordImplCopyWithImpl<$Res>
    extends _$FavoriteWordCopyWithImpl<$Res, _$FavoriteWordImpl>
    implements _$$FavoriteWordImplCopyWith<$Res> {
  __$$FavoriteWordImplCopyWithImpl(
      _$FavoriteWordImpl _value, $Res Function(_$FavoriteWordImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? wordId = null,
  }) {
    return _then(_$FavoriteWordImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      wordId: null == wordId
          ? _value.wordId
          : wordId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FavoriteWordImpl implements _FavoriteWord {
  const _$FavoriteWordImpl(
      {@JsonKey(name: 'id') this.id = 0,
      @JsonKey(name: 'user_id') this.userId = 0,
      @JsonKey(name: 'word_id') this.wordId = 0});

  factory _$FavoriteWordImpl.fromJson(Map<String, dynamic> json) =>
      _$$FavoriteWordImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'user_id')
  final int userId;
  @override
  @JsonKey(name: 'word_id')
  final int wordId;

  @override
  String toString() {
    return 'FavoriteWord(id: $id, userId: $userId, wordId: $wordId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoriteWordImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.wordId, wordId) || other.wordId == wordId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, wordId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FavoriteWordImplCopyWith<_$FavoriteWordImpl> get copyWith =>
      __$$FavoriteWordImplCopyWithImpl<_$FavoriteWordImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FavoriteWordImplToJson(
      this,
    );
  }
}

abstract class _FavoriteWord implements FavoriteWord {
  const factory _FavoriteWord(
      {@JsonKey(name: 'id') final int id,
      @JsonKey(name: 'user_id') final int userId,
      @JsonKey(name: 'word_id') final int wordId}) = _$FavoriteWordImpl;

  factory _FavoriteWord.fromJson(Map<String, dynamic> json) =
      _$FavoriteWordImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'user_id')
  int get userId;
  @override
  @JsonKey(name: 'word_id')
  int get wordId;
  @override
  @JsonKey(ignore: true)
  _$$FavoriteWordImplCopyWith<_$FavoriteWordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
