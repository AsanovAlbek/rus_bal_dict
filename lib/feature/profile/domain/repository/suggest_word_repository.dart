import 'package:either_dart/either.dart';
import 'package:rus_bal_dict/core/model/word/suggest_word.dart';

abstract interface class SuggestWordRepository {
  Future<Either<Exception, List<SuggestWord>>> suggestedWords({String name = '', int page = 0, int size = 15});
  Future<void> suggestWord(SuggestWord word);
}
