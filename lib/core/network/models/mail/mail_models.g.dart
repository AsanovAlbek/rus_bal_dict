// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mail_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetCodeResponseImpl _$$GetCodeResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$GetCodeResponseImpl(
      success: json['success'] as bool? ?? false,
      message: json['message'] as String? ?? '',
    );

Map<String, dynamic> _$$GetCodeResponseImplToJson(
        _$GetCodeResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
    };
