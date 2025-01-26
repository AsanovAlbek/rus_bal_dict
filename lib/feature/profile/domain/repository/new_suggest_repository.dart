import 'package:either_dart/either.dart';
import 'package:rus_bal_dict/core/model/word/suggest_word.dart';
import 'package:rus_bal_dict/core/network/models/suggest/suggest_models.dart';

abstract interface class NewSuggestRepository {
  Future<Either<Exception, List<SuggestWord>>> getSuggestWords(String name, int page, int size);
  Future<Either<Exception, SuggestResponse>> suggest(SuggestWord word);
  Future<Either<Exception, int>> suggestsCount(String name);
}