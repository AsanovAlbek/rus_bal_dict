// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaymentInfo _$PaymentInfoFromJson(Map<String, dynamic> json) {
  return _PaymentInfo.fromJson(json);
}

/// @nodoc
mixin _$PaymentInfo {
  @JsonKey(name: 'daylimit')
  String get dayLimit => throw _privateConstructorUsedError;
  @JsonKey(name: 'subscription')
  String get subscription => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentInfoCopyWith<PaymentInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentInfoCopyWith<$Res> {
  factory $PaymentInfoCopyWith(
          PaymentInfo value, $Res Function(PaymentInfo) then) =
      _$PaymentInfoCopyWithImpl<$Res, PaymentInfo>;
  @useResult
  $Res call(
      {@JsonKey(name: 'daylimit') String dayLimit,
      @JsonKey(name: 'subscription') String subscription});
}

/// @nodoc
class _$PaymentInfoCopyWithImpl<$Res, $Val extends PaymentInfo>
    implements $PaymentInfoCopyWith<$Res> {
  _$PaymentInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dayLimit = null,
    Object? subscription = null,
  }) {
    return _then(_value.copyWith(
      dayLimit: null == dayLimit
          ? _value.dayLimit
          : dayLimit // ignore: cast_nullable_to_non_nullable
              as String,
      subscription: null == subscription
          ? _value.subscription
          : subscription // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentInfoImplCopyWith<$Res>
    implements $PaymentInfoCopyWith<$Res> {
  factory _$$PaymentInfoImplCopyWith(
          _$PaymentInfoImpl value, $Res Function(_$PaymentInfoImpl) then) =
      __$$PaymentInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'daylimit') String dayLimit,
      @JsonKey(name: 'subscription') String subscription});
}

/// @nodoc
class __$$PaymentInfoImplCopyWithImpl<$Res>
    extends _$PaymentInfoCopyWithImpl<$Res, _$PaymentInfoImpl>
    implements _$$PaymentInfoImplCopyWith<$Res> {
  __$$PaymentInfoImplCopyWithImpl(
      _$PaymentInfoImpl _value, $Res Function(_$PaymentInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dayLimit = null,
    Object? subscription = null,
  }) {
    return _then(_$PaymentInfoImpl(
      dayLimit: null == dayLimit
          ? _value.dayLimit
          : dayLimit // ignore: cast_nullable_to_non_nullable
              as String,
      subscription: null == subscription
          ? _value.subscription
          : subscription // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentInfoImpl implements _PaymentInfo {
  const _$PaymentInfoImpl(
      {@JsonKey(name: 'daylimit') this.dayLimit = '0',
      @JsonKey(name: 'subscription') this.subscription = 'false'});

  factory _$PaymentInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentInfoImplFromJson(json);

  @override
  @JsonKey(name: 'daylimit')
  final String dayLimit;
  @override
  @JsonKey(name: 'subscription')
  final String subscription;

  @override
  String toString() {
    return 'PaymentInfo(dayLimit: $dayLimit, subscription: $subscription)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentInfoImpl &&
            (identical(other.dayLimit, dayLimit) ||
                other.dayLimit == dayLimit) &&
            (identical(other.subscription, subscription) ||
                other.subscription == subscription));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, dayLimit, subscription);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentInfoImplCopyWith<_$PaymentInfoImpl> get copyWith =>
      __$$PaymentInfoImplCopyWithImpl<_$PaymentInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentInfoImplToJson(
      this,
    );
  }
}

abstract class _PaymentInfo implements PaymentInfo {
  const factory _PaymentInfo(
          {@JsonKey(name: 'daylimit') final String dayLimit,
          @JsonKey(name: 'subscription') final String subscription}) =
      _$PaymentInfoImpl;

  factory _PaymentInfo.fromJson(Map<String, dynamic> json) =
      _$PaymentInfoImpl.fromJson;

  @override
  @JsonKey(name: 'daylimit')
  String get dayLimit;
  @override
  @JsonKey(name: 'subscription')
  String get subscription;
  @override
  @JsonKey(ignore: true)
  _$$PaymentInfoImplCopyWith<_$PaymentInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
