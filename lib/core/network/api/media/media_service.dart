import 'dart:io';

import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:rus_bal_dict/core/constants/private.dart';
import 'package:rus_bal_dict/core/network/models/media/media_models.dart';

part 'media_service.g.dart';

@RestApi(baseUrl: '$myApiUrl/media')
abstract class MediaService {
  factory MediaService(Dio dio, {String? baseUrl}) = _MediaService;

  @POST('/upload_file')
  @MultiPart()
  Future<UploadFileResponse> uploadFile(@Part() File file);

  @POST('/delete_file')
  Future<DeleteFileResponse> deleteFile(@Field('file_path') String filePath);

  @GET('/get_file')
  Future<GetFileResponse> getFile(@Query('file_path') String filePath);
}
