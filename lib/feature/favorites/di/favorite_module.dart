import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:rus_bal_dict/feature/favorites/data/repository/favorite_repository_impl.dart';
import 'package:rus_bal_dict/feature/favorites/domain/repository/favorites_repository.dart';

import '../../../core/hive/favorite_word/favorite_word_hive_model.dart';
import '../../../core/hive/settings/app_settings_hive.dart';

final di = GetIt.instance;

void favoriteModule(Box<AppSettingsHiveModel> settingsBox, Box<FavoriteWordHiveModel> favoritesBox) {
  di.registerSingleton<FavoritesRepository>(
      FavoriteRepositoryImpl(dio: di<Dio>(), favoritesBox: favoritesBox, settingsBox: settingsBox));
}
