import 'package:rus_bal_dict/core/model/settings/app_settings.dart';
import 'package:rus_bal_dict/core/model/token/token.dart';
import 'package:rus_bal_dict/core/model/user/user.dart';

abstract interface class NewAuthRepository {
  Future<Token> login({required String email, required String password});
  Future<User> register(
      {required String email,
      required String password,
      required String name,
      required String imei});
  Future<User> getUser();
  Future<String> refreshToken();
  Future<dynamic> activateUser(String code);
  Future<dynamic> resetPassword(String email, String code);
  Future<dynamic> changePassword(String email, String code);
  Future<String> sendResetCode();
  Future<String> sendActivationCode();
}
