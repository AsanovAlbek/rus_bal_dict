import 'dart:typed_data';

import 'package:either_dart/either.dart';

abstract interface class DetailRepository {
  Future<Either<Exception, Uint8List?>> getAudioByPath({required String audioPath});
}