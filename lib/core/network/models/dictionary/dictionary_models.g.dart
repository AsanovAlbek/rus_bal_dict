// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dictionary_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WordActionResponseImpl _$$WordActionResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$WordActionResponseImpl(
      message: json['message'] as String? ?? '',
      word: json['word'] == null
          ? const Word()
          : Word.fromJson(json['word'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$WordActionResponseImplToJson(
        _$WordActionResponseImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'word': instance.word,
    };

_$OnlyWordBodyImpl _$$OnlyWordBodyImplFromJson(Map<String, dynamic> json) =>
    _$OnlyWordBodyImpl(
      word: json['word'] == null
          ? const Word()
          : Word.fromJson(json['word'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$OnlyWordBodyImplToJson(_$OnlyWordBodyImpl instance) =>
    <String, dynamic>{
      'word': instance.word,
    };

_$RemoveWordBodyImpl _$$RemoveWordBodyImplFromJson(Map<String, dynamic> json) =>
    _$RemoveWordBodyImpl(
      wordId: (json['word_id'] as num?)?.toInt() ?? -1,
    );

Map<String, dynamic> _$$RemoveWordBodyImplToJson(
        _$RemoveWordBodyImpl instance) =>
    <String, dynamic>{
      'word_id': instance.wordId,
    };

_$GetWordsBodyImpl _$$GetWordsBodyImplFromJson(Map<String, dynamic> json) =>
    _$GetWordsBodyImpl(
      name: json['name'] as String? ?? '',
      page: (json['page'] as num?)?.toInt() ?? 0,
      size: (json['size'] as num?)?.toInt() ?? 100,
    );

Map<String, dynamic> _$$GetWordsBodyImplToJson(_$GetWordsBodyImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'page': instance.page,
      'size': instance.size,
    };

_$WordByIdBodyImpl _$$WordByIdBodyImplFromJson(Map<String, dynamic> json) =>
    _$WordByIdBodyImpl(
      id: (json['id'] as num?)?.toInt() ?? -1,
    );

Map<String, dynamic> _$$WordByIdBodyImplToJson(_$WordByIdBodyImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
    };
