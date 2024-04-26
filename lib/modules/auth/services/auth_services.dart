import 'dart:convert';

import 'package:bank_sha/configs/env.dart';
import 'package:bank_sha/modules/auth/models/sign_in_form_model.dart';
import 'package:bank_sha/modules/auth/models/sign_up_form_model.dart';
import 'package:bank_sha/models/user_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class AuthServices {
  Future<bool> checkEmailExist(String email) async {
    try {
      final res = await http.post(
          Uri.parse(
            '$baseUrl/is-email-exist',
          ),
          body: {
            'email': email,
          });

      if (res.statusCode == 200) {
        return jsonDecode(res.body)['is_email_exist'];
      }
      return jsonDecode(res.body)['errors'];
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> register(SignUpFormModel data) async {
    try {
      final res = await http.post(
        Uri.parse(
          '$baseUrl/register',
        ),
        body: data.toJson(),
      );

      if (res.statusCode == 200 || res.statusCode == 201) {
        UserModel user = UserModel.fromJson(jsonDecode(res.body));
        user = user.copyWith(password: data.password);

        return user;
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> login(SignInFormModel data) async {
    try {
      final res = await http.post(
        Uri.parse(
          '$baseUrl/login',
        ),
        body: data.toJson(),
      );

      if (res.statusCode == 200) {
        UserModel user = UserModel.fromJson(jsonDecode(res.body));
        user = user.copyWith(password: data.password);

        return user;
      } else {
        // Check if the response contains errors
        if (res.body.contains("errors")) {
          // Parse the errors from the response
          Map<String, dynamic> errorResponse = jsonDecode(res.body);
          // Assuming that only one error is returned for simplicity
          String errorMessage = errorResponse["errors"].values.first[0];
          throw errorMessage;
        } else {
          // If the response does not contain errors in the expected format,
          // throw a generic error message
          throw jsonDecode(res.body)['message'];
        }
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> storeCredentialToLocal(UserModel user) async {
    try {
      const storage = FlutterSecureStorage();
      await storage.write(key: 'token', value: user.token);
      await storage.write(key: 'email', value: user.email);
      await storage.write(key: 'password', value: user.password);
    } catch (e) {
      rethrow;
    }
  }

  Future<SignInFormModel> getCredentialFromLocal() async {
    try {
      const storage = FlutterSecureStorage();
      Map<String, String> values = await storage.readAll();
      if (values['email'] == null || values['password'] == null) {
        throw 'authenticated';
      } else {
        final SignInFormModel data = SignInFormModel(
          email: values['email'],
          password: values['password'],
        );

        return data;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<String> getToken() async {
    String token = '';

    const storage = FlutterSecureStorage();
    String? value = await storage.read(key: 'token');

    if (value != null) {
      token = 'Bearer $value';
    }

    return token;
  }

  Future<void> clearLocalStorage() async {
    const storage = FlutterSecureStorage();
    await storage.deleteAll();
  }
}
