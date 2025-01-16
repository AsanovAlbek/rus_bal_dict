// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'media_models.freezed.dart';
part 'media_models.g.dart';

// Responses

@freezed
class UploadFileResponse with _$UploadFileResponse {
  const factory UploadFileResponse({
    @JsonKey(name: 'message') @Default('') String message,
    @JsonKey(name: 'file_path') @Default('') String filePath,
    @JsonKey(name: 'file_url') @Default('') String fileUrl
  }) = _UploadFileResponse;

  factory UploadFileResponse.fromJson(Map<String, dynamic> json) => _$UploadFileResponseFromJson(json);
}

@freezed
class DeleteFileResponse with _$DeleteFileResponse {
  const factory DeleteFileResponse({
    @JsonKey(name: 'message') @Default('') String message,
    @JsonKey(name: 'file_path') @Default('') String filePath
  }) = _DeleteFileResponse;

  factory DeleteFileResponse.fromJson(Map<String, dynamic> json) => _$DeleteFileResponseFromJson(json);
}

@freezed
class GetFileResponse with _$GetFileResponse {
  const factory GetFileResponse({
    @JsonKey(name: 'message') @Default('') String message,
    @JsonKey(name: 'file_bytes') @Default('') String rawFileBytes
  }) = _GetFileResponse;

  factory GetFileResponse.fromJson(Map<String, dynamic> json) => _$GetFileResponseFromJson(json);
}

