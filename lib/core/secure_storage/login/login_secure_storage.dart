import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:rus_bal_dict/core/model/login_data/login_data.dart';
import 'package:rus_bal_dict/core/secure_storage/secure_storage_base_wrapper.dart';
import 'package:rus_bal_dict/core/constants/private.dart' as private
    show loginDataKey;

class LoginSecureStorage implements SecureStorageBase<LoginData> {
  LoginSecureStorage._internal();
  static final LoginSecureStorage _instance = LoginSecureStorage._internal();
  factory LoginSecureStorage() => _instance;

  final _storage = const FlutterSecureStorage();

  @override
  Future<void> delete() async => _storage.delete(key: private.loginDataKey);

  @override
  Future<LoginData> get() async {
    String? json = await _storage.read(key: private.loginDataKey);
    if (json == null) throw LoginDataNotFoundedException();
    return LoginData.fromJson(jsonDecode(json));
  }

  @override
  Future<void> set(LoginData data) async {
    return _storage.write(
        key: private.loginDataKey, value: jsonEncode(data.toJson()));
  }
}

class LoginDataNotFoundedException implements Exception {
  final String? message;
  LoginDataNotFoundedException({this.message});
  @override
  String toString() => message ?? "Ошибка: данные о входе не найдены";
}
