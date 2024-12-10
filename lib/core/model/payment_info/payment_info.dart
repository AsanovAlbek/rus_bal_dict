import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_info.freezed.dart';
part 'payment_info.g.dart';

@freezed
class PaymentInfo with _$PaymentInfo {
  const factory PaymentInfo(
      {@JsonKey(name: 'daylimit') @Default('0') String dayLimit,
      @JsonKey(name: 'subscription')
      @Default('false')
      String subscription}) = _PaymentInfo;

  factory PaymentInfo.fromJson(Map<String, dynamic> json) =>
      _$PaymentInfoFromJson(json);
}

@immutable
class UserPaymentInfo with EquatableMixin {
  final int dayLimit;
  final bool isSubscribe;

  const UserPaymentInfo({this.dayLimit = 0, this.isSubscribe = false});

  UserPaymentInfo.fromDto(PaymentInfo paymentInfo)
      : dayLimit = int.tryParse(paymentInfo.dayLimit) ?? 0,
        isSubscribe = bool.tryParse(paymentInfo.subscription) ?? false;

  @override
  List<Object?> get props => [dayLimit, isSubscribe];
}
