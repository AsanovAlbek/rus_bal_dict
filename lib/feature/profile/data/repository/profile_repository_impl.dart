import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:rus_bal_dict/core/constants/private.dart';
import 'package:rus_bal_dict/core/model/settings/app_settings.dart';
import 'package:rus_bal_dict/core/model/settings/converter.dart';
import 'package:rus_bal_dict/feature/profile/domain/repository/profile_repository.dart';

import '../../../../core/hive/settings/app_settings_hive.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final Box<AppSettingsHiveModel> _settingsBox;
  final Dio dio;

  ProfileRepositoryImpl(this._settingsBox, this.dio);

  @override
  Future<void> dropToDefault() async {
    var appSettings = (_settingsBox.get(singleSettingsKey,
                defaultValue: AppSettingsHiveModel()) ??
            AppSettingsHiveModel())
        .toModel();
    appSettings = appSettings.copyWith(settings: const Settings());
    return _settingsBox.put(singleSettingsKey, appSettings.toHive());
  }

  @override
  Future<void> saveSettings(AppSettings appSettings) async {
    return _settingsBox.put(singleSettingsKey, appSettings.toHive());
  }

  @override
  Future<void> signOut() async {
    var appSettings = (_settingsBox.get(singleSettingsKey,
                defaultValue: AppSettingsHiveModel()) ??
            AppSettingsHiveModel())
        .toModel();
    appSettings = appSettings.copyWith(
        userInfo: appSettings.userInfo.copyWith(isUserSignIn: false));
    return _settingsBox.put(singleSettingsKey, appSettings.toHive());
  }
}
