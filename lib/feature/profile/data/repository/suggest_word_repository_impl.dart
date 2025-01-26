import 'package:dio/dio.dart';
import 'package:either_dart/src/either.dart';
import 'package:rus_bal_dict/core/model/word/suggest_word.dart';
import 'package:rus_bal_dict/core/network/models/suggest/suggest_models.dart';
import 'package:rus_bal_dict/feature/profile/domain/repository/suggest_word_repository.dart';
import 'package:talker/talker.dart';

class SuggestWordRepositoryImpl implements SuggestWordRepository {
  final Dio dio;
  SuggestWordRepositoryImpl(this.dio);
  @override
  Future<Either<Exception, SuggestResponse>> suggestWord(SuggestWord word) async {
    try {
      await dio.post('suggest_word/', data: word.toJson()..remove('id'));
      return const Right(SuggestResponse());
    } on Exception catch (e, s) {
      Talker().handle(e, s, 'Exception on suggestWord');
      return Left(e);
    }
  }

  @override
  Future<Either<Exception, List<SuggestWord>>> suggestedWords(
      {String name = '', int page = 0, int size = 15}) {
    // TODO: implement suggestedWords
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Exception, int>> suggestsCount({String name = ''}) {
    // TODO: implement suggestsCount
    throw UnimplementedError();
  }
}
