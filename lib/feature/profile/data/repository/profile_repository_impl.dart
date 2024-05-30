import 'package:hive/hive.dart';
import 'package:rus_bal_dict/core/model/settings/app_settings.dart';
import 'package:rus_bal_dict/core/model/settings/converter.dart';
import 'package:rus_bal_dict/feature/profile/domain/repository/profile_repository.dart';

import '../../../../core/hive/settings/app_settings_hive.dart';

const String _singleSettingsKey = 'AppSettings';

class ProfileRepositoryImpl implements ProfileRepository {
  final Box<AppSettingsHiveModel> _settingsBox;


  ProfileRepositoryImpl(this._settingsBox);

  @override
  Future<void> dropToDefault() async {
    var appSettings = _settingsBox.get(_singleSettingsKey, defaultValue: AppSettingsHiveModel())!.toModel();
    appSettings = appSettings.copyWith(settings: const Settings());
    return _settingsBox.put(_singleSettingsKey, appSettings.toHive());
  }

  @override
  Future<void> saveSettings(AppSettings appSettings) async {
    return _settingsBox.put(_singleSettingsKey, appSettings.toHive());
  }

  @override
  Future<void> signOut() async {
    var appSettings = _settingsBox.get(_settingsBox, defaultValue: AppSettingsHiveModel())!.toModel();
    appSettings = appSettings.copyWith(userInfo: appSettings.userInfo.copyWith(isUserSignIn: false));
    return _settingsBox.put(_singleSettingsKey, appSettings.toHive());
  }

}