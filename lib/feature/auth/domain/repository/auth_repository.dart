import 'package:either_dart/either.dart';
import 'package:rus_bal_dict/core/model/user/user.dart';

abstract interface class AuthRepository {
  Future<Either<Exception, User>> registerUser({required User user});
  Future<Either<Exception, User>> signIn({required String email, required String password});
  Future<Either<Exception, void>> signOut();
  Future<Either<Exception, int>> sendCodeToEmail({required String email});
  Future<void> resetUserPassword({required String email, required String newPassword});
}