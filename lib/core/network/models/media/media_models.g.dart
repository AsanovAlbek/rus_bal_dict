// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UploadFileResponseImpl _$$UploadFileResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$UploadFileResponseImpl(
      message: json['message'] as String? ?? '',
      filePath: json['file_path'] as String? ?? '',
      fileUrl: json['file_url'] as String? ?? '',
    );

Map<String, dynamic> _$$UploadFileResponseImplToJson(
        _$UploadFileResponseImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'file_path': instance.filePath,
      'file_url': instance.fileUrl,
    };

_$DeleteFileResponseImpl _$$DeleteFileResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$DeleteFileResponseImpl(
      message: json['message'] as String? ?? '',
      filePath: json['file_path'] as String? ?? '',
    );

Map<String, dynamic> _$$DeleteFileResponseImplToJson(
        _$DeleteFileResponseImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'file_path': instance.filePath,
    };

_$GetFileResponseImpl _$$GetFileResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$GetFileResponseImpl(
      message: json['message'] as String? ?? '',
      rawFileBytes: json['file_bytes'] as String? ?? '',
    );

Map<String, dynamic> _$$GetFileResponseImplToJson(
        _$GetFileResponseImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'file_bytes': instance.rawFileBytes,
    };
