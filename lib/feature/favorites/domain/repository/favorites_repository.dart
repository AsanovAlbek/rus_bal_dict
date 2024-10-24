import 'package:either_dart/either.dart';
import 'package:rus_bal_dict/core/model/word/word.dart';

abstract interface class FavoritesRepository {
  Future<Either<Exception, Word>> saveToFavorites(Word favoriteWord);
  Future<Either<Exception, List<Word>>> getFavoriteWords();
  Future<Either<Exception, Word>> deleteFromFavorites(Word favoriteWord);
}
