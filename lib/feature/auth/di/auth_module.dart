import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:rus_bal_dict/feature/auth/data/repository/auth_repository_impl.dart';
import 'package:rus_bal_dict/feature/auth/domain/repository/auth_repository.dart';

import '../../../core/hive/settings/app_settings_hive.dart';

final di = GetIt.instance;

void authModule(Box<AppSettingsHiveModel> settingsBox) {
  final dio = di<Dio>();
  di.registerSingleton<AuthRepository>(AuthRepositoryImpl(dio, settingsBox));
}