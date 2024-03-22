import 'dart:convert';

import 'package:bank_sha/configs/api/api.dart';
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
}
