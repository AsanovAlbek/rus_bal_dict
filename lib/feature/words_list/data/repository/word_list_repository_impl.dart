import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:rus_bal_dict/core/model/word/word.dart';

import '../../domain/repository/words_list_repository.dart';
import 'package:talker/talker.dart';

class WordsListRepositoryImpl implements WordsListRepository {
  final Dio dio;
  final Talker talker;

  WordsListRepositoryImpl({required this.dio, required this.talker});

  @override
  Future<Either<Exception, List<Word>>> fetchWords(
      {required String query, required int page, required int size}) async {
    try {
      final response = await dio.get('words/$query', queryParameters: {'page': page, 'size': size});
      Iterable responseData = response.data;
      var words = List<Word>.from(responseData.map((json) => Word.fromJson(json)).toList());
      return Right(words);
    } on Exception catch (e, s) {
      talker.handle(e, s, 'Errorr in $runtimeType');
      return Left(e);
    }
  }

  @override
  Future<Either<Exception, int>> wordsCount({required String query}) async {
    try {
      Response<int> response = await dio.get('words_count/$query', queryParameters: {'name': query});
      return Right(response.data ?? 0);
    } on Exception catch (e, s) {
      talker.handle(e, s, 'Errorrr in $runtimeType');
      return Left(e);
    }
  }
}
