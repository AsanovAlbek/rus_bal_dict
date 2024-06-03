import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User{
  const factory User({
    @JsonKey(name: 'id') @Default(0) int id,
    @JsonKey(name: 'username') @Default('') String name,
    @JsonKey(name: 'email') @Default('') String email,
    @JsonKey(name: 'password') @Default('') String password,
    @JsonKey(name: 'imei') @Default('') String imei
  }) = _User;
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
