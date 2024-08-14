import 'package:either_dart/either.dart';
import 'package:rus_bal_dict/core/model/payment_info/payment_info.dart';

import '../../../../core/model/settings/app_settings.dart';

abstract interface class ProfileRepository {
  Future<void> saveSettings(AppSettings appSettings);
  Future<void> dropToDefault();
  Future<int> checkPremium(AppSettings appSettings);
  Future<Either<Exception, UserPaymentInfo>> paymentInfo();
  Future<void> checkUserLimit();
  Future<void> signOut();
}