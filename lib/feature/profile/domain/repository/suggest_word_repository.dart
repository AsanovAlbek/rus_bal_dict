import 'package:either_dart/either.dart';
import 'package:rus_bal_dict/core/model/word/suggest_word.dart';
import 'package:rus_bal_dict/core/network/models/suggest/suggest_models.dart';

abstract interface class SuggestWordRepository {
  Future<Either<Exception, List<SuggestWord>>> suggestedWords(
      {String name = '', int page = 0, int size = 15});
  Future<Either<Exception, SuggestResponse>> suggestWord(SuggestWord word);
}
