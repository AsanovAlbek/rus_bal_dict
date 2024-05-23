import 'package:either_dart/either.dart';

import '../../../../core/model/word.dart';

abstract interface class WordsListRepository {
  Future<Either<Exception, List<Word>>> fetchWords({required String query, required int page, required int size});
  Future<Either<Exception, int>> wordsCount({required String query});
}