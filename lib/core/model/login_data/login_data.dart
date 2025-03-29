import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_data.freezed.dart';
part 'login_data.g.dart';

@freezed
class LoginData with _$LoginData {
  const factory LoginData({
    @JsonKey(name: 'email') @Default('') String email,
    @JsonKey(name: 'password') @Default('') String password,
    @JsonKey(name: 'rememberMe') @Default(false) bool rememberMe
  }) = _LoginData;

  factory LoginData.fromJson(Map<String, dynamic> json) => _$LoginDataFromJson(json);
}