import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rus_bal_dict/core/model/settings/app_settings.dart';
import 'package:rus_bal_dict/feature/profile/domain/cubit/profile_state.dart';
import 'package:rus_bal_dict/feature/profile/domain/repository/payment_repository.dart';
import 'package:talker/talker.dart';

import '../../../../core/model/settings/theme_mode.dart';
import '../repository/profile_repository.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepository repository;
  final PaymentRepository paymentRepository;

  ProfileCubit(this.repository, this.paymentRepository)
      : super(const ProfileState());

  var _profile = const ProfileState();

  void dropToDefaultSettings() {
    repository.dropToDefault();
  }

  void saveSettings(AppSettings appSettings) {
    repository.saveSettings(appSettings);
    Talker().debug('appSettings saved $appSettings');
  }

  void signOut() {
    repository.signOut();
  }

  void settings(AppSettings appSettings) {
    _profile = _profile.copyWith(
        appSettings: appSettings,
        selectThemeTogglesSelection: {appSettings.settings.themeMode});
    emit(_profile);
  }

  void selectTheme(Set<SettingsThemeMode> selection) {
    _profile = _profile.copyWith(selectThemeTogglesSelection: selection);
    emit(_profile);
    var newSettings = _profile.appSettings.copyWith(
        settings:
            _profile.appSettings.settings.copyWith(themeMode: selection.first));
    saveSettings(newSettings);
  }

  void changeTextScale(double scale) {
    final settings = _profile.appSettings.copyWith(
        settings: _profile.appSettings.settings.copyWith(fontSize: scale));
    saveSettings(settings);
  }

  void changeTextScaleToDefault() => changeTextScale(1.0);

  Future<void> fetchUserPaymentInfo(
      [VoidCallback? onSuccess, Function(String?)? onError]) async {
    final userPaymentInfoEither = await paymentRepository.paymentInfo();
    userPaymentInfoEither.either((error) {
      onError?.call(error.toString());
    }, (info) {
      _profile = _profile.copyWith(paymentInfo: info);
      emit(_profile);
      onSuccess?.call();
    });
  }

  Future<void> checkLimits() async {
    await paymentRepository.decrementNonPremiumUserTries();
    await fetchUserPaymentInfo();
    Talker().debug('limits checked');
  }

  Future<Uri?> paymentUri(
      {required String amount, required String email}) async {
    return paymentRepository.getPaymentWebViewBody(
        amount: amount, email: email);
  }

  Future<void> confirmPayment(
      {VoidCallback? onSuccess, Function(String?)? onError}) async {
    await paymentRepository.confirmPayment();
    await fetchUserPaymentInfo(onSuccess, onError);
  }
}
