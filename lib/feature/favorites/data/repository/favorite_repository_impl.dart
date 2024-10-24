import 'package:dio/dio.dart';
import 'package:either_dart/src/either.dart';
import 'package:hive/hive.dart';
import 'package:rus_bal_dict/core/model/settings/converter.dart';
import 'package:rus_bal_dict/core/model/word/word.dart';
import 'package:rus_bal_dict/feature/favorites/data/converter.dart';
import 'package:rus_bal_dict/feature/favorites/domain/repository/favorites_repository.dart';

import '../../../../core/hive/favorite_word/favorite_word_hive_model.dart';
import '../../../../core/hive/settings/app_settings_hive.dart';

const String _singleSettingsKey = 'AppSettings';

class FavoriteRepositoryImpl implements FavoritesRepository {
  final Dio dio;
  final Box<FavoriteWordHiveModel> favoritesBox;
  final Box<AppSettingsHiveModel> settingsBox;

  FavoriteRepositoryImpl(
      {required this.dio,
      required this.favoritesBox,
      required this.settingsBox});

  @override
  Future<Either<Exception, Word>> deleteFromFavorites(Word favoriteWord) async {
    try {
      var appSettings = settingsBox
          .get(_singleSettingsKey, defaultValue: AppSettingsHiveModel())!
          .toModel();
      // Если понадобится хранить на сервере
      // final wordDeleteResponse = await dio.delete('delete_favorite_word/',
      //     queryParameters: {'user_id': appSettings.userInfo.id, 'word_id': favoriteWord.id});
      final hiveWord =
          favoriteWord.toFavoritesHive(userId: appSettings.userInfo.id ?? 0);
      favoritesBox.delete(hiveWord.wordId);
      //return Right(Word.fromJson(wordDeleteResponse.data));
      return Right(favoriteWord);
    } on Exception catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Exception, List<Word>>> getFavoriteWords() async {
    try {
      var appSettings = settingsBox
          .get(_singleSettingsKey, defaultValue: AppSettingsHiveModel())!
          .toModel();
      final favoriteWordsResponse = await dio.get('favorite_words/',
          queryParameters: {'user_id': appSettings.userInfo.id});
      Iterable iterableResponse = favoriteWordsResponse.data;
      final words =
          List<Word>.from(iterableResponse.map((json) => Word.fromJson(json)))
              .toList();
      return Right(words);
    } on Exception catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Exception, Word>> saveToFavorites(Word favoriteWord) async {
    try {
      var appSettings = settingsBox
          .get(_singleSettingsKey, defaultValue: AppSettingsHiveModel())!
          .toModel();
      favoritesBox.put(favoriteWord.id,
          favoriteWord.toFavoritesHive(userId: appSettings.userInfo.id ?? 0));
      // final favorite = FavoriteWord(id: 0, userId: appSettings.userInfo.id ?? 0, wordId: favoriteWord.id ?? 0);
      // final favoriteAddResponse = await dio.post('add_favorite_word/', data: favorite.toJson());
      // return Right(Word.fromJson(favoriteAddResponse.data));
      return Right(favoriteWord);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
