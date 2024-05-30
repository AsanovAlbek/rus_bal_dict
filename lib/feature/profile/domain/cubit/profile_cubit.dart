import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rus_bal_dict/core/model/settings/app_settings.dart';
import 'package:rus_bal_dict/feature/profile/domain/cubit/profile_state.dart';

import '../../../../core/model/settings/theme_mode.dart';
import '../repository/profile_repository.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepository repository;

  ProfileCubit(this.repository) : super(const ProfileState());

  var _profile = ProfileState();

  void dropToDefaultSettings() {
    repository.dropToDefault();
  }

  void saveSettings(AppSettings appSettings) {
    repository.saveSettings(appSettings);
  }

  void signOut() {
    repository.signOut();
  }

  void settings(AppSettings appSettings) {
    _profile = _profile
        .copyWith(appSettings: appSettings, selectThemeTogglesSelection: {appSettings.settings.themeMode});
    emit(_profile);
  }

  void selectTheme(Set<SettingsThemeMode> selection) {
    _profile = _profile.copyWith(selectThemeTogglesSelection: selection);
    emit(_profile);
    var newSettings = _profile.appSettings
        .copyWith(settings: _profile.appSettings.settings.copyWith(themeMode: selection.first));
    saveSettings(newSettings);
  }
}
