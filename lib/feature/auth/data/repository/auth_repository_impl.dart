import 'dart:math';

import 'package:dio/dio.dart';
import 'package:either_dart/src/either.dart' show Either, Left, Right;
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:rus_bal_dict/core/model/settings/app_settings.dart';
import 'package:rus_bal_dict/core/model/settings/converter.dart';
import 'package:rus_bal_dict/core/model/user/user.dart';
import 'package:rus_bal_dict/feature/auth/data/exceptions/exceptions.dart';
import 'package:rus_bal_dict/feature/auth/domain/repository/auth_repository.dart';
import 'package:talker/talker.dart';

import '../../../../core/hive/settings/app_settings_hive.dart';

const String _singleSettingsKey = 'AppSettings';

class AuthRepositoryImpl implements AuthRepository {
  final Dio _dio;
  final Dio withoutBaseDio;
  final Box<AppSettingsHiveModel> _settingsBox;
  final Talker _talker = GetIt.I<Talker>();

  AuthRepositoryImpl(this._dio, this._settingsBox, this.withoutBaseDio);

  @override
  Future<Either<Exception, User>> registerUser({required User user}) async {
    try {
      final newUserResponse = await _dio.post('register/', data: user.toJson());
      final paymentData = {
        'name': user.name,
        'email': user.email,
        'password': user.password
      };
      await withoutBaseDio.post('http://files.howtosayve.com/login_balk.php',
          data: FormData.fromMap(paymentData));
      if (newUserResponse.data == null) {
        throw UserAlreadyExistException('Такой пользователь уже существует');
      }
      final newUser = User.fromJson(newUserResponse.data);
      _saveUserLocal(newUser);
      return Right(newUser);
    } on Exception catch (e, s) {
      _talker.handle(e, s);
      return Left(e);
    }
  }

  @override
  Future<Either<Exception, User>> signIn(
      {required String email, required String password}) async {
    try {
      final userResponse = await _dio.get('user/',
          queryParameters: {'email': email, 'password': password});
      if (userResponse.data == null) {
        throw UserNotFoundException(
            'Пользователь с такими данными не найден. Зарегистрируйтесь, если у вас нет аккаунта');
      }
      final user = User.fromJson(userResponse.data);
      await _saveUserLocal(user);
      return Right(user);
    } on Exception catch (e, s) {
      _talker.handle(e, s);
      return Left(e);
    }
  }

  @override
  Future<Either<Exception, void>> signOut() async {
    try {
      var appSettings = _settingsBox
          .get(_singleSettingsKey, defaultValue: AppSettingsHiveModel())!
          .toModel();
      appSettings =
          appSettings.copyWith(userInfo: const UserInfo(isUserSignIn: false));
      return Right(_settingsBox.put(_singleSettingsKey, appSettings.toHive()));
    } on Exception catch (e) {
      return Left(e);
    }
  }

  Future<void> _saveUserLocal(User user) async {
    var appSettings = _settingsBox
        .get(_singleSettingsKey, defaultValue: AppSettingsHiveModel())!
        .toModel();
    appSettings = appSettings.copyWith(
        userInfo: UserInfo(
            id: user.id,
            name: user.name,
            isUserSignIn: true,
            email: user.email));
    return _settingsBox.put(_singleSettingsKey, appSettings.toHive());
  }

  @override
  Future<Either<Exception, int>> sendCodeToEmail(
      {required String email}) async {
    try {
      int minRandom = 100000;
      int maxRandom = 999999;
      final int generatedRandomCode =
          Random().nextInt(maxRandom - minRandom) + minRandom;
      await withoutBaseDio.post('http://files.howtosayve.com/email.php',
          data:
              FormData.fromMap({'email': email, 'code': generatedRandomCode}));
      return Right(generatedRandomCode);
    } on Exception catch (e, s) {
      Talker().handle(e, s);
      return Left(e);
    }
  }

  @override
  Future<void> resetUserPassword(
      {required String email, required String newPassword}) async {
    try {
      await _dio.post('update_password/',
          queryParameters: {'email': email, 'password': newPassword});
    } on Exception catch (e, s) {
      Talker().handle(e, s);
    }
  }
}
