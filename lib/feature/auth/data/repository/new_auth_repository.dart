import 'package:dio/dio.dart';
import 'package:either_dart/src/either.dart';
import 'package:rus_bal_dict/core/model/user/user.dart';
import 'package:rus_bal_dict/feature/auth/domain/repository/auth_repository.dart';

class NewAuthRepository implements AuthRepository {
  final Dio balRusDio;
  final Dio dio;
  NewAuthRepository(this.balRusDio, this.dio);

  @override
  Future<Either<Exception, User>> registerUser({required User user}) {
    // TODO: implement registerUser
    throw UnimplementedError();
  }

  @override
  Future<void> resetUserPassword({required String email, required String newPassword}) {
    // TODO: implement resetUserPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Exception, int>> sendCodeToEmail({required String email}) {
    // TODO: implement sendCodeToEmail
    throw UnimplementedError();
  }

  @override
  Future<Either<Exception, User>> signIn({required String email, required String password}) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<Either<Exception, void>> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  
}