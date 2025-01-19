import 'package:rus_bal_dict/core/model/settings/app_settings.dart';
import 'package:rus_bal_dict/core/model/token/token.dart';
import 'package:rus_bal_dict/core/model/user/user.dart';
import 'package:rus_bal_dict/core/network/models/auth/auth_models.dart';

extension ResponseToToken on TokenResponse {
  Token toToken() => Token(
      accessToken: accessToken,
      refreshToken: refreshToken,
      tokenType: tokenType);
}

extension ResponseToUser on UserResponse {
  User toUser() => User(
      id: id,
      name: name,
      email: email,
      imei: imei,
      isActive: isActive,
      isAdmin: isAdmin);
}

extension SettingsExt on AppSettings {
  AppSettings updateUser(User user) {
    return AppSettings(
        userInfo: userInfo.copyWith(
          id: user.id,
          name: user.name,
          email: user.email,
          isActive: user.isActive,
          isAdmin: user.isAdmin,
        ),
        settings: settings);
  }
}
