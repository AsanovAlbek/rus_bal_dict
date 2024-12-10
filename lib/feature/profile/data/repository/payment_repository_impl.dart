import 'dart:math';

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:rus_bal_dict/core/constants/private.dart';
import 'package:rus_bal_dict/core/hive/settings/app_settings_hive.dart';
import 'package:rus_bal_dict/core/model/payment_info/payment_info.dart';
import 'package:rus_bal_dict/core/model/settings/converter.dart';
import 'package:rus_bal_dict/feature/history/presentation/history.dart';
import 'package:rus_bal_dict/feature/profile/domain/repository/payment_repository.dart';

class PaymentRepositoryImpl implements PaymentRepository {
  final Dio dio;
  final Box<AppSettingsHiveModel> _settingsBox;
  final Talker talker;

  PaymentRepositoryImpl(
      {required this.dio,
      required Box<AppSettingsHiveModel> settingsBox,
      required this.talker})
      : _settingsBox = settingsBox;

  @override
  Future<void> decrementNonPremiumUserTries() async {
    try {
      var appSettings = (_settingsBox.get(singleSettingsKey,
                  defaultValue: AppSettingsHiveModel()) ??
              AppSettingsHiveModel())
          .toModel();
      await dio.post('http://files.howtosayve.com/limit_balk.php',
          data: FormData.fromMap({'email': appSettings.userInfo.email}));
    } on Exception catch (e, s) {
      talker.handle(e, s, 'error where check user limit');
    }
  }

  @override
  Future<Either<Object, UserPaymentInfo>> paymentInfo() async {
    try {
      var appSettings = (_settingsBox.get(singleSettingsKey,
                  defaultValue: AppSettingsHiveModel()) ??
              AppSettingsHiveModel())
          .toModel();
      final paymentInfoResponse = await dio.post(
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
  Future<Uri?> getPaymentWebViewBody(
      {required String amount, required String email}) async {
    var data = {
      'amount': amount,
      'email': email,
      'order_id': Random().nextInt(99999)
    };

    try {
      final response = await dio.post(
          'http://files.howtosayve.com/payment_balk.php',
          data: FormData.fromMap(data),
          options: Options(
              validateStatus: (status) => status != null && status < 500));
      return response.realUri;
    } catch (e, s) {
      talker.handle(e, s, 'payment exception');
      return null;
    }
  }

  @override
  Future<void> confirmPayment() async {
    try {
      var appSettings = (_settingsBox.get(singleSettingsKey,
                  defaultValue: AppSettingsHiveModel()) ??
              AppSettingsHiveModel())
          .toModel();
      await dio.post('http://files.howtosayve.com/payment_inform_balk.php',
          data: FormData.fromMap({'email': appSettings.userInfo.email}));
    } catch (e, s) {
      talker.handle(e, s, 'confirm payment error');
    }
  }
}
