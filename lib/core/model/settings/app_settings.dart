import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rus_bal_dict/core/model/settings/theme_mode.dart';

@immutable
class AppSettings {
  final UserInfo userInfo;
  final Settings settings;

  const AppSettings({required this.userInfo, required this.settings});
  const AppSettings.defaultSettings(
      {this.userInfo = const UserInfo(), this.settings = const Settings()});

  AppSettings copyWith({UserInfo? userInfo, Settings? settings}) {
    return AppSettings(
        userInfo: userInfo ?? this.userInfo,
        settings: settings ?? this.settings);
  }
}

@immutable
class Settings {
  final SettingsThemeMode themeMode;
  final double fontSize;
  final Duration? historyStaleLimitTime;

  const Settings(
      {this.themeMode = SettingsThemeMode.system,
      this.fontSize = 1.0,
      this.historyStaleLimitTime});

  Settings copyWith(
      {SettingsThemeMode? themeMode,
      double? fontSize,
      Duration? historyStaleLimitTime}) {
    return Settings(
        themeMode: themeMode ?? this.themeMode,
        fontSize: fontSize ?? this.fontSize,
        historyStaleLimitTime:
            historyStaleLimitTime ?? this.historyStaleLimitTime);
  }
}

@immutable
class UserInfo {
  final int? id;
  final String? name;
  final bool isUserSignIn;
  final String? email;
  final int? premiumDays;

  const UserInfo(
      {this.id,
      this.name,
      this.isUserSignIn = false,
      this.email,
      this.premiumDays});

  UserInfo copyWith(
      {int? id,
      String? name,
      bool? isUserSignIn,
      String? email,
      int? premiumDays}) {
    return UserInfo(
      id: id ?? this.id,
      name: name ?? this.name,
      isUserSignIn: isUserSignIn ?? this.isUserSignIn,
    );
  }
}
