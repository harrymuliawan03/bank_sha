import 'dart:convert';

import 'package:bank_sha/configs/env.dart';
import 'package:http/http.dart' as http;

class ConnectedAppsServices {
  Future<dynamic> getConnectedApps(int userId) async {
    try {
      final res = await http.get(
        Uri.parse(
          '$baseUrlLocalhost/connect_apps/user/$userId',
        ),
      );

      if (res.statusCode == 200) {
        return jsonDecode(res.body)['data'];
      }
      return jsonDecode(res.body)['errors'];
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> deleteConnectedApps(int id) async {
    try {
      final res = await http.delete(
        Uri.parse(
          '$baseUrlLocalhost/connect_apps/$id',
        ),
      );

      if (res.statusCode == 200) {
        return jsonDecode(res.body)['data'];
      }
      return jsonDecode(res.body)['errors'];
    } catch (e) {
      rethrow;
    }
  }
}
