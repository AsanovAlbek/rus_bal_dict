import 'package:either_dart/src/either.dart';
import 'package:rus_bal_dict/core/model/word/word.dart';
import 'package:rus_bal_dict/core/network/api/dictionary/dictionary_service.dart';
import 'package:rus_bal_dict/feature/home/presentation/home.dart';
import 'package:talker/talker.dart';

class NewWordsRepositoryImpl implements WordsListRepository {
  final DictionaryService dictionaryService;
  final Talker? logger;

  NewWordsRepositoryImpl(this.dictionaryService, [this.logger]);

  @override
  Future<Either<Exception, List<Word>>> fetchWords(
      {required String query, required int page, required int size}) async {
    try {
      final words = await dictionaryService.getWords(query, page, size);
      return Right(words);
    } on Exception catch(e, s) {
      logger?.handle(e, s, 'Fetch words repo error');
      return Left(e);
    }
  }

  @override
  Future<Either<Exception, int>> wordsCount({required String query}) async {
    try {
      final wordsCount = await dictionaryService.wordsCount(query);
      return Right(wordsCount);
    } on Exception catch(e, s) {
      logger?.handle(e, s, 'Words count repo error');
      return Left(e);
    }
  }
}
