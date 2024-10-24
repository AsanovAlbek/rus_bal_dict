import 'package:either_dart/either.dart';
import 'package:rus_bal_dict/core/model/payment_info/payment_info.dart';

abstract interface class PaymentRepository {
  Future<Uri?> getPaymentWebViewBody(
      {required String amount, required String email});
  Future<Either<Object, UserPaymentInfo>> paymentInfo();
  Future<void> decrementNonPremiumUserTries();
  Future<void> confirmPayment();
}
