import 'dart:developer';

import 'package:efaq_elhaya/Core/Utlis/Constatnts.dart';
import 'package:efaq_elhaya/Features/Auth_View/data/models/login_model.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenManager {
  static FlutterSecureStorage _storage = FlutterSecureStorage();
  static Future<void> saveUserToken({required LoginModel userDetails}) async {
    await _storage.write(key: savedToken, value: userDetails.token);
    await _storage.write(key: savedRole, value: userDetails.roles!.first);
  }

  static Future<String?> getUserToken() async {
    return await _storage.read(key: savedToken);
  }

  static Future<String?> getUserRole() async {
    try {
      return await _storage.read(key: savedRole);
    } on Exception {
      return "";
    }
  }

  static Future<String> getUserName() async {
    String? token = await _storage.read(key: savedToken);
    if (!tokenIsExp(token)) {
      return JwtDecoder.decode(token!)["sub"];
    } else {
      return "";
    }
  }

  static Future<String> getUserId() async {
    String? token = await _storage.read(key: savedToken);
    if (!tokenIsExp(token)) {
      return JwtDecoder.decode(token!)["uid"];
    } else {
      return "";
    }
  }

  static Future<void> removeToken() async {
    await _storage.delete(key: savedToken);
    await _storage.delete(key: savedRole);
  }

  static bool tokenIsExp(String? userToken) {
    if (userToken == null || userToken.isEmpty) {
      log(userToken == null ? "token is null" : "token is empty");
      return false;
    }

    final isExpired = JwtDecoder.isExpired(userToken);
    if (isExpired) {
      log("expired token");
    }

    return isExpired;
  }
}
