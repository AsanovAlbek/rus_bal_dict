import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_ce/hive_ce.dart';
import 'package:rus_bal_dict/core/di/core_module.dart';
import 'package:rus_bal_dict/core/network/api/auth/auth_service.dart';
import 'package:rus_bal_dict/core/network/api/mail/mail_service.dart';
import 'package:rus_bal_dict/feature/auth/data/repository/auth_repository_impl.dart';
import 'package:rus_bal_dict/feature/auth/data/repository/new_auth_repository.dart';
import 'package:rus_bal_dict/feature/auth/domain/repository/auth_repository.dart';
import 'package:rus_bal_dict/feature/auth/domain/repository/new_auth_repository.dart';
import 'package:talker/talker.dart';

import '../../../core/hive/settings/app_settings_hive.dart';

final di = GetIt.instance;

void authModule(Box<AppSettingsHiveModel> settingsBox) {
  final dio = di<Dio>(instanceName: dioWithBaseUrlInstanceName);
  final dioWithoutBaseUrl =
      di<Dio>(instanceName: dioWithoutBaseUrlInstanceName);
  di.registerSingleton<AuthRepository>(
      AuthRepositoryImpl(dio, settingsBox, dioWithoutBaseUrl));
  di.registerSingleton<NewAuthRepository>(NewAuthRepositoryImpl(
      authService: di<AuthService>(),
      mailService: di<MailService>(),
      simpleDio: dioWithoutBaseUrl,
      settingsBox: settingsBox,
      logger: di<Talker>()));
}
