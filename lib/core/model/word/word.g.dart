// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WordImpl _$$WordImplFromJson(Map<String, dynamic> json) => _$WordImpl(
      id: (json['id'] as num?)?.toInt(),
      word: json['name'] as String? ?? '',
      meaning: json['meaning'] as String? ?? '',
      audioUrl: json['audio_url'] as String? ?? '',
      audioPath: json['audio_path'] as String? ?? '',
    );

Map<String, dynamic> _$$WordImplToJson(_$WordImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.word,
      'meaning': instance.meaning,
      'audio_url': instance.audioUrl,
      'audio_path': instance.audioPath,
    };
