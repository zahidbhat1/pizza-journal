import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pizzajournals/data/source/local/local_keys.dart';
import 'package:pizzajournals/data/source/network/models/user_model.dart';
import 'package:injectable/injectable.dart';

@singleton
class UserLocalDataSource {
  final FlutterSecureStorage _storage;

  const UserLocalDataSource({
    required FlutterSecureStorage storage,
  }) : _storage = storage;

  Future<String?> getAccessToken() async {
    try {
      final token = await _storage.read(key: LocalKeys.token);

      return token;
    } catch (_) {
      rethrow;
    }
  }

  Future<void> saveAccessToken(String token) async {
    try {
      await _storage.write(key: LocalKeys.token, value: token);
    } catch (_) {
      rethrow;
    }
  }

  Future<UserModel?> getUser() async {
    try {
      final userJson = await _storage.read(key: LocalKeys.user);

      if (userJson?.isNotEmpty ?? false) {
        final user = UserModel.fromJson(json.decode(userJson ?? ''));

        return user;
      }

      return null;
    } catch (_) {
      rethrow;
    }
  }

  Future<void> saveUser(UserModel user) async {
    try {
      final userJson = json.encode(user);

      await _storage.write(key: LocalKeys.user, value: userJson);
    } catch (_) {
      rethrow;
    }
  }

  Future<void> clearUserData() async {
    try {
      await _storage.delete(key: LocalKeys.token);
      await _storage.delete(key: LocalKeys.user);
    } catch (_) {
      rethrow;
    }
  }
}
