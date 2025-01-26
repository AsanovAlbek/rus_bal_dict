import 'package:dio/dio.dart';
import 'package:either_dart/src/either.dart';
import 'package:rus_bal_dict/core/constants/private.dart';
import 'package:rus_bal_dict/core/model/settings/app_settings.dart';
import 'package:rus_bal_dict/core/model/token/token.dart';
import 'package:rus_bal_dict/core/model/user/user.dart';
import 'package:rus_bal_dict/core/network/api/auth/auth_service.dart';
import 'package:rus_bal_dict/core/network/api/mail/mail_service.dart';
import 'package:rus_bal_dict/core/network/models/auth/auth_models.dart';
import 'package:rus_bal_dict/core/network/network_extension.dart';
import 'package:rus_bal_dict/core/secure_storage/token/token_secure_storage.dart';
import 'package:rus_bal_dict/export.dart';
import 'package:rus_bal_dict/feature/auth/data/exceptions/mapper.dart';
import 'package:rus_bal_dict/feature/auth/domain/repository/new_auth_repository.dart';
import 'package:rus_bal_dict/feature/history/presentation/history.dart';

class NewAuthRepositoryImpl implements NewAuthRepository {
  final AuthService authService;
  final MailService mailService;
  final Dio simpleDio;
  final Box<AppSettingsHiveModel> settingsBox;
  final Talker? logger;
  final _tokenStorage = TokenSecureStorage(); // Singleton instance

  NewAuthRepositoryImpl(
      {required this.authService,
      required this.mailService,
      required this.simpleDio,
      required this.settingsBox,
      this.logger});

  @override
  Future<String> activateUser(String code) async {
    try {
      final token = await _tokenStorage.get();
      var activationResponse =
          await authService.userActivation('Bearer ${token.accessToken}', code);
      return activationResponse.message;
    } on Exception catch (e, s) {
      logger?.handle(e, s, 'User activation error');
      rethrow;
    }
  }

  @override
  Future<String> changePassword(String email, String newPassword) async {
    try {
      final token = await _tokenStorage.get();
      final message = await authService.changePassword(
          'Bearer ${token.accessToken}', email, newPassword);
      return message;
    } on Exception catch (e, s) {
      logger?.handle(e, s, 'User change password error');
      rethrow;
    }
  }

  @override
  Future<Either<Exception, User>> getUser() async {
    try {
      final token = await _tokenStorage.get();
      logger?.debug('get user from local token = ${token.accessToken}');
      final authResponse =
          await authService.getCurrentUser('Bearer ${token.accessToken}');
      final user = authResponse.toUser();
      _saveUser(user);
      return Right(user);
    } on Exception catch (e, s) {
      logger?.handle(e, s, 'Get user exception');
      if (e is DioException) {
        logger?.debug(
            'Dio get user error. code=${e.response?.statusCode}, body=${e.response?.data}, message = ${e.response?.statusMessage}');
      }
      return Left(e);
    }
  }

  @override
  Future<Either<Exception, Token>> login(
      {required String email, required String password}) async {
    try {
      final tokenResponse = await authService.login(email, password);
      final token = tokenResponse.toToken();
      logger?.debug('login token = ${token.accessToken}');
      await _tokenStorage.set(token);
      return Right(token);
    } on Exception catch (e, s) {
      logger?.handle(e, s, "Login error");
      if (e is DioException) {
        logger?.debug(
            'Dio login error. code=${e.response?.statusCode}, body=${e.response?.data}');
      }
      return Left(e);
    }
  }

  @override
  Future<void> refreshToken() async {
    try {
      final token = await _tokenStorage.get();
      final newToken = await authService.refreshToken(token.refreshToken);
      await _tokenStorage.set(Token(
          accessToken: newToken.accessToken,
          refreshToken: token.refreshToken,
          tokenType: newToken.tokenType));
    } on Exception catch (e, s) {
      logger?.handle(e, s, "Login error");
      if (e is DioException) {
        logger?.debug(
            'Dio refresh token error. code=${e.response?.statusCode}, body=${e.response?.data}');
      }
      rethrow;
    }
  }

  @override
  Future<Either<Exception, String>> register(
      {required String email,
      required String password,
      required String name,
      required String imei}) async {
    try {
      final body = UserRegisterBody(
          email: email,
          name: name,
          password: password,
          imei: imei,
          isActive: false,
          isAdmin: false);
      final createUserResponse = await authService.register(body);
      return Right(createUserResponse.message);
    } on Exception catch (e, s) {
      logger?.handle(e, s, "Register error");
      if (e is DioException) {
        logger?.debug(
            'Dio register error. code=${e.response?.statusCode}, body=${e.response?.data}');
      }
      return Left(e);
    }
  }

  @override
  Future<String> resetPassword(String email, String code) async {
    try {
      final resetResponse = await authService.confirmResetPassword(email, code);
      return resetResponse.message;
    } on Exception catch (e, s) {
      logger?.handle(e, s, "Reset password error");
      rethrow;
    }
  }

  @override
  Future<String> sendActivationCode(String email) async {
    try {
      final token = await _tokenStorage.get();
      final sendResponse =
          await mailService.sendActivationCode('Bearer ${token.accessToken}');
      return sendResponse.message;
    } on Exception catch (e, s) {
      logger?.handle(e, s, "Send activation code error");
      rethrow;
    }
  }

  @override
  Future<String> sendResetCode(String email) async {
    try {
      final sendResponse = await mailService.sendResetCode(email);
      return sendResponse.message;
    } on Exception catch (e, s) {
      logger?.handle(e, s, "Send reset code error");
      rethrow;
    }
  }

  @override
  Future<Either<Exception, User>> startSession() async {
    try {
      final token = await _tokenStorage.get();
      final userResponse =
          await authService.getCurrentUser('Bearer ${token.accessToken}');
      _saveUser(userResponse.toUser());
      return Right(userResponse.toUser());
    } on DioException catch (dioErr, stack) {
      logger?.handle(dioErr, stack, 'Auth Error, try refresh token');
      try {
        if (dioErr.response?.statusCode == 401) {
          await refreshToken();
          final token = await _tokenStorage.get();
          final userResponse =
              await authService.getCurrentUser('Bearer ${token.accessToken}');
          _saveUser(userResponse.toUser());
          return Right(userResponse.toUser());
        } else {
          rethrow;
        }
      } on DioException catch (e, s) {
        logger?.handle(e, s, "Auth error. Token refresh failed. Logout");
        await logout();
        return Left(e);
      }
    } on Exception catch (e, s) {
      logger?.handle(e, s, "Start session error");
      return Left(e);
    }
  }

  @override
  Future<void> logout() async {
    var settings =
        settingsBox.getAt(0)?.toModel() ?? const AppSettings.defaultSettings();
    settings = settings.copyWith(
        userInfo: settings.userInfo.copyWith(isUserSignIn: false));
    await Future.wait(
        [_tokenStorage.delete(), settingsBox.putAt(0, settings.toHive())]);
  }

  Future<void> _saveUser(User user) async {
    var settings =
        settingsBox.getAt(0)?.toModel() ?? const AppSettings.defaultSettings();
    settings = settings.updateUser(user);
    return settingsBox.putAt(0, settings.toHive());
  }
}
