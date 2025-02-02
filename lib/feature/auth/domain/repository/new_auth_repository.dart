import 'package:either_dart/either.dart';
import 'package:rus_bal_dict/core/model/token/token.dart';
import 'package:rus_bal_dict/core/model/user/user.dart';

abstract interface class NewAuthRepository {
  Future<Either<Exception, Token>> login(
      {required String email, required String password});
  Future<void> logout();
  Future<Either<Exception, String>> register(
      {required String email,
      required String password,
      required String name,
      required String imei});
  Future<Either<Exception, User>> getUser();
  Future<void> refreshToken();
  Future<String> activateUser(String code);
  Future<String> resetPassword(String email, String code);
  Future<String> changePassword(String email, String newPassword);
  Future<String> sendResetCode(String email);
  Future<String> sendActivationCode(String email);
  Future<Either<Exception, User>> startSession();
}
