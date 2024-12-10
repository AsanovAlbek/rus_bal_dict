// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suggest_word.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SuggestWordImpl _$$SuggestWordImplFromJson(Map<String, dynamic> json) =>
    _$SuggestWordImpl(
      id: (json['id'] as num?)?.toInt(),
      word: json['word'] as String? ?? '',
      meaning: json['meaning'] as String? ?? '',
      userId: (json['user_id'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$SuggestWordImplToJson(_$SuggestWordImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'word': instance.word,
      'meaning': instance.meaning,
      'user_id': instance.userId,
    };
