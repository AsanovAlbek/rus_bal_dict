import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:rus_bal_dict/core/hive/settings/app_settings_hive.dart';
import 'package:rus_bal_dict/feature/history/data/repository/history_repository_impl.dart';
import 'package:rus_bal_dict/feature/history/domain/repository/history_repository.dart';

import '../../../core/hive/word/word_hive_model.dart';

final di = GetIt.instance;

void historyModule(
    Box<AppSettingsHiveModel> settingsBox, Box<WordHiveModel> historyBox) {
  di.registerSingleton<HistoryRepository>(
      HistoryRepositoryImpl(historyBox, settingsBox));
}
