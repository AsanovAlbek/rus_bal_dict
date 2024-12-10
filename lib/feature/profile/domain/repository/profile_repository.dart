import '../../../../core/model/settings/app_settings.dart';

abstract interface class ProfileRepository {
  Future<void> saveSettings(AppSettings appSettings);
  Future<void> dropToDefault();
  Future<void> signOut();
}
