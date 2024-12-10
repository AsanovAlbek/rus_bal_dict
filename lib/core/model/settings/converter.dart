import 'package:rus_bal_dict/core/hive/settings/app_settings_hive.dart';
import 'package:rus_bal_dict/core/model/settings/theme_mode.dart';
import 'package:rus_bal_dict/core/model/settings/app_settings.dart';

extension AppSettingsToHive on AppSettings {
  AppSettingsHiveModel toHive() {
    return AppSettingsHiveModel(
        userId: userInfo.id,
        userName: userInfo.name,
        isUserSignedIn: userInfo.isUserSignIn,
        themeMode: settings.themeMode.index,
        fontSize: settings.fontSize,
        historyStaleLimitTime: settings.historyStaleLimitTime,
        email: userInfo.email,
        premiumDays: userInfo.premiumDays ?? 0);
  }
}

extension HiveToAppSettings on AppSettingsHiveModel {
  AppSettings toModel() {
    return AppSettings(
        userInfo: UserInfo(
            id: userId,
            name: userName,
            isUserSignIn: isUserSignedIn,
            email: email,
            premiumDays: premiumDays),
        settings: Settings(
            themeMode: SettingsThemeMode.values[themeMode],
            fontSize: fontSize ?? 1.0,
            historyStaleLimitTime: historyStaleLimitTime));
  }
}
