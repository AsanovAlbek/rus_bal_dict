// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_word.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FavoriteWordImpl _$$FavoriteWordImplFromJson(Map<String, dynamic> json) =>
    _$FavoriteWordImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      userId: (json['user_id'] as num?)?.toInt() ?? 0,
      wordId: (json['word_id'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$FavoriteWordImplToJson(_$FavoriteWordImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'word_id': instance.wordId,
    };
