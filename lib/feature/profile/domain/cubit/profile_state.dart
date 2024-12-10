import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rus_bal_dict/core/model/payment_info/payment_info.dart';
import 'package:rus_bal_dict/core/model/settings/theme_mode.dart';
import 'package:rus_bal_dict/core/model/settings/app_settings.dart';

@immutable
class ProfileState {
  final AppSettings appSettings;
  final Set<SettingsThemeMode> selectThemeTogglesSelection;
  final UserPaymentInfo paymentInfo;

  const ProfileState(
      {this.appSettings = const AppSettings.defaultSettings(),
      this.selectThemeTogglesSelection = const {SettingsThemeMode.light},
      this.paymentInfo = const UserPaymentInfo()});

  ProfileState copyWith(
      {AppSettings? appSettings,
      Set<SettingsThemeMode>? selectThemeTogglesSelection,
      UserPaymentInfo? paymentInfo}) {
    return ProfileState(
        appSettings: appSettings ?? this.appSettings,
        selectThemeTogglesSelection:
            selectThemeTogglesSelection ?? this.selectThemeTogglesSelection,
        paymentInfo: paymentInfo ?? this.paymentInfo);
  }
}
