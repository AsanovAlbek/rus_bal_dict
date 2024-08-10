import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:rus_bal_dict/core/model/settings/app_settings.dart';
import 'package:rus_bal_dict/core/model/settings/converter.dart';
import 'package:rus_bal_dict/feature/profile/domain/repository/profile_repository.dart';

import '../../../../core/hive/settings/app_settings_hive.dart';

const String _singleSettingsKey = 'AppSettings';

class ProfileRepositoryImpl implements ProfileRepository {
  final Box<AppSettingsHiveModel> _settingsBox;
  final Dio dio;

  ProfileRepositoryImpl(this._settingsBox, this.dio);

  @override
  Future<void> dropToDefault() async {
    var appSettings =
        (_settingsBox.get(_singleSettingsKey, defaultValue: AppSettingsHiveModel()) ?? AppSettingsHiveModel())
            .toModel();
    appSettings = appSettings.copyWith(settings: const Settings());
    return _settingsBox.put(_singleSettingsKey, appSettings.toHive());
  }

  @override
  Future<void> saveSettings(AppSettings appSettings) async {
    return _settingsBox.put(_singleSettingsKey, appSettings.toHive());
  }

  @override
  Future<void> signOut() async {
    var appSettings =
    (_settingsBox.get(_singleSettingsKey, defaultValue: AppSettingsHiveModel()) ?? AppSettingsHiveModel())
        .toModel();
    appSettings = appSettings.copyWith(userInfo: appSettings.userInfo.copyWith(isUserSignIn: false));
    return _settingsBox.put(_singleSettingsKey, appSettings.toHive());
  }
  
  @override
  Future<int> checkPremium(AppSettings appSettings) async {
    // TODO: тут будет проверка есть ли премиум
    // Если нет, то 0 дней
    return 0;
  }
}
