import 'package:dio/dio.dart';
import 'package:either_dart/src/either.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:rus_bal_dict/core/di/core_module.dart';
import 'package:rus_bal_dict/core/model/payment_info/payment_info.dart';
import 'package:rus_bal_dict/core/model/settings/app_settings.dart';
import 'package:rus_bal_dict/core/model/settings/converter.dart';
import 'package:rus_bal_dict/core/utils/interceptiors.dart';
import 'package:rus_bal_dict/feature/profile/domain/repository/profile_repository.dart';
import 'package:talker/talker.dart';

import '../../../../core/hive/settings/app_settings_hive.dart';

const String _singleSettingsKey = 'AppSettings';

class ProfileRepositoryImpl implements ProfileRepository {
  final Box<AppSettingsHiveModel> _settingsBox;
  final Dio dio;

  ProfileRepositoryImpl(this._settingsBox, this.dio);

  @override
  Future<void> dropToDefault() async {
    var appSettings = (_settingsBox.get(_singleSettingsKey,
                defaultValue: AppSettingsHiveModel()) ??
            AppSettingsHiveModel())
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
    var appSettings = (_settingsBox.get(_singleSettingsKey,
                defaultValue: AppSettingsHiveModel()) ??
            AppSettingsHiveModel())
        .toModel();
    appSettings = appSettings.copyWith(
        userInfo: appSettings.userInfo.copyWith(isUserSignIn: false));
    return _settingsBox.put(_singleSettingsKey, appSettings.toHive());
  }

  @override
  Future<int> checkPremium(AppSettings appSettings) async {
    // TODO: тут будет проверка есть ли премиум
    // Если нет, то 0 дней
    return 0;
  }

  @override
  Future<Either<Exception, UserPaymentInfo>> paymentInfo() async {
    try {
      final api = GetIt.I<Dio>(instanceName: dioWithoutBaseUrlInstanceName);
      var appSettings = (_settingsBox.get(_singleSettingsKey,
                  defaultValue: AppSettingsHiveModel()) ??
              AppSettingsHiveModel())
          .toModel();
      final paymentInfoResponse = await api.post(
          'http://files.howtosayve.com/profileInformation_balk.php',
          data: FormData.fromMap({'email': appSettings.userInfo.email}));
      final paymentInfo = PaymentInfo.fromJson(paymentInfoResponse.data);
      return Right(UserPaymentInfo.fromDto(paymentInfo));
    } on Exception catch (e, s) {
      Talker().handle(e, s, 'error where payment info');
      return Left(e);
    }
  }

  @override
  Future<void> checkUserLimit() async {
    try {
      var appSettings = (_settingsBox.get(_singleSettingsKey,
                  defaultValue: AppSettingsHiveModel()) ??
              AppSettingsHiveModel())
          .toModel();
      final api = GetIt.I<Dio>(instanceName: dioWithoutBaseUrlInstanceName);
      await api.post('http://files.howtosayve.com/limit_balk.php',
          data: FormData.fromMap({'email': appSettings.userInfo.email}));
    } on Exception catch (e, s) {
      Talker().handle(e, s, 'error where check user limit');
    }
  }
}
