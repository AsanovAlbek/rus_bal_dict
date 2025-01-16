// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suggest_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SuggestResponseImpl _$$SuggestResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$SuggestResponseImpl(
      message: json['message'] as String? ?? '',
      suggestWord: json['suggest_word'] == null
          ? const SuggestWord()
          : SuggestWord.fromJson(json['suggest_word'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SuggestResponseImplToJson(
        _$SuggestResponseImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'suggest_word': instance.suggestWord,
    };

_$SuggestAcceptResponseImpl _$$SuggestAcceptResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$SuggestAcceptResponseImpl(
      message: json['message'] as String? ?? '',
      suggestWord: json['suggest'] == null
          ? const SuggestWord()
          : SuggestWord.fromJson(json['suggest'] as Map<String, dynamic>),
      word: json['word'] == null
          ? const Word()
          : Word.fromJson(json['word'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SuggestAcceptResponseImplToJson(
        _$SuggestAcceptResponseImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'suggest': instance.suggestWord,
      'word': instance.word,
    };

_$SuggestRejectResponseImpl _$$SuggestRejectResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$SuggestRejectResponseImpl(
      message: json['message'] as String? ?? '',
      suggestWord: json['suggest'] == null
          ? const SuggestWord()
          : SuggestWord.fromJson(json['suggest'] as Map<String, dynamic>),
      word: json['word'] == null
          ? const Word()
          : Word.fromJson(json['word'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SuggestRejectResponseImplToJson(
        _$SuggestRejectResponseImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'suggest': instance.suggestWord,
      'word': instance.word,
    };

_$GetSuggestsBodyImpl _$$GetSuggestsBodyImplFromJson(
        Map<String, dynamic> json) =>
    _$GetSuggestsBodyImpl(
      userId: (json['user_id'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? '',
      page: (json['page'] as num?)?.toInt() ?? 0,
      size: (json['size'] as num?)?.toInt() ?? 100,
    );

Map<String, dynamic> _$$GetSuggestsBodyImplToJson(
        _$GetSuggestsBodyImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'name': instance.name,
      'page': instance.page,
      'size': instance.size,
    };

_$GetAllSuggestsBodyImpl _$$GetAllSuggestsBodyImplFromJson(
        Map<String, dynamic> json) =>
    _$GetAllSuggestsBodyImpl(
      userId: (json['user_id'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? '',
      page: (json['page'] as num?)?.toInt() ?? 0,
      size: (json['size'] as num?)?.toInt() ?? 100,
    );

Map<String, dynamic> _$$GetAllSuggestsBodyImplToJson(
        _$GetAllSuggestsBodyImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'name': instance.name,
      'page': instance.page,
      'size': instance.size,
    };

_$CreateSuggestBodyImpl _$$CreateSuggestBodyImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateSuggestBodyImpl(
      word: json['word'] as String? ?? '',
      meaning: json['meaning'] as String? ?? '',
    );

Map<String, dynamic> _$$CreateSuggestBodyImplToJson(
        _$CreateSuggestBodyImpl instance) =>
    <String, dynamic>{
      'word': instance.word,
      'meaning': instance.meaning,
    };
