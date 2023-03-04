import 'dart:convert';

import 'package:bees/models/token.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class TokenManager {
  final String tokenKey = "token";

  final FlutterSecureStorage _storage = const FlutterSecureStorage(
    iOptions: IOSOptions(
      accessibility: KeychainAccessibility.first_unlock,
    ),
  );

  Future<void> writeToken(Token token) {
    final tokenString = jsonEncode(token.toJson());

    return _storage.write(
      key: tokenKey,
      value: tokenString,
    );
  }

  Future<Token> readToken() async {
    try {
      final data = await _storage.read(key: tokenKey);

      if (data == null) {
        throw Exception("ERR.TOKEN_NOT_FOUND");
      }

      final json = jsonDecode(data);

      return Token.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteToken() {
    return _storage.delete(key: tokenKey);
  }
}
