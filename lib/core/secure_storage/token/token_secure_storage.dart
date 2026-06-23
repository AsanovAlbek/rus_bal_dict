import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:rus_bal_dict/core/model/token/token.dart';
import 'package:rus_bal_dict/core/secure_storage/secure_storage_base_wrapper.dart';
import 'package:rus_bal_dict/core/constants/private.dart' as private
    show singleSettingsKey;

class TokenSecureStorage implements SecureStorageBase<Token> {
  TokenSecureStorage._internal();
  static final TokenSecureStorage _instance = TokenSecureStorage._internal();
  factory TokenSecureStorage() => _instance;

  final _storage = const FlutterSecureStorage();

  @override
  Future<void> delete() async {
    _storage.delete(key: private.singleSettingsKey);
  }

  @override
  Future<Token> get() async {
    String? json = await _storage.read(key: private.singleSettingsKey);
    if (json == null) throw TokenNotFoundException(json);
    return Token.fromJson(jsonDecode(json));
  }

  @override
  Future<void> set(Token data) async {
    return _storage.write(
        key: private.singleSettingsKey, value: jsonEncode(data.toJson()));
  }
}

class TokenNotFoundException implements Exception {
  final String? encodedToken;

  TokenNotFoundException([this.encodedToken]);

  @override
  String toString() {
    return 'Token $encodedToken not found';
  }
}
