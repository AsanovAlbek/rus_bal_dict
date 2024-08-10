import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:rus_bal_dict/feature/profile/data/repository/profile_repository_impl.dart';
import 'package:rus_bal_dict/feature/profile/domain/repository/profile_repository.dart';

import '../../../core/hive/settings/app_settings_hive.dart';

final di = GetIt.I;

void profileModule(Box<AppSettingsHiveModel> settingsBox) {
  di.registerSingleton<ProfileRepository>(
      ProfileRepositoryImpl(settingsBox, di<Dio>()));
}
