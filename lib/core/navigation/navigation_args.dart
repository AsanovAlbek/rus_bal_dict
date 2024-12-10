import 'package:rus_bal_dict/export.dart';

@immutable
class PaymentArg {
  final String amount;
  final String email;
  final Uri? paymentUri;

  const PaymentArg(
      {required this.amount, required this.email, required this.paymentUri});
}
