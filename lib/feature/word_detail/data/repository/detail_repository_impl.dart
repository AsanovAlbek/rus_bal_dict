import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:either_dart/src/either.dart';
import 'package:flutter/cupertino.dart';

import '../../domain/repository/detail_repository.dart';

class DetailRepositoryImpl implements DetailRepository {
  final Dio dio;

  DetailRepositoryImpl({required this.dio});

  @override
  Future<Either<Exception, Uint8List?>> getAudioByPath(
      {required String audioPath}) async {
    try {
      debugPrint('audio path $audioPath');
      final response =
          await dio.get('get_file/', queryParameters: {'file_path': audioPath});
      try {
        return Right(base64Decode(response.data!['contents']));
      } catch (e) {
        return const Right(null);
      }
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
