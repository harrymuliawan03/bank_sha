import 'dart:convert';
import 'dart:io';
import 'package:bank_sha/configs/api/api_models.dart';
import 'package:bank_sha/configs/env.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

// Example if response API has good structure
// Future<HttpResponse> postData2<T>(String url, dynamic body) async {
//   try {
//     final response = await http.post(
//       Uri.parse('$baseUrl$url'),
//       headers: {
//         HttpHeaders.contentTypeHeader: 'application/json',
//       },
//       body: body.toJson(),
//     );

//     final data = json.decode(response.body);

//     if (response.statusCode == 200) {
//       return HttpResponse(
//         success: true,
//         data: data['data'],
//         status: true,
//         message: data['message'] ?? 'Succesfully get data',
//       );
//     }

//     String message;
//     if (response.body.contains("errors")) {
//       Map<String, dynamic> errorResponse = jsonDecode(response.body);
//       message = errorResponse["errors"].values.first[0];
//     } else {
//       message = jsonDecode(response.body)['message'];
//     }
//     return HttpResponse(
//       success: false,
//       data: null,
//       status: false,
//       message: message,
//     );
//   } catch (error) {
//     return HttpResponse(
//         success: false, data: null, status: false, message: error.toString());
//   }
// }

Future<String> getToken() async {
  String token = '';

  const storage = FlutterSecureStorage();
  String? value = await storage.read(key: 'token');

  if (value != null) {
    token = 'Bearer $value';
  }

  return token;
}

Future<ResponseUseCase<T>> postData<T>(String url, dynamic body) async {
  try {
    final response = await http.post(
      Uri.parse('$baseUrl$url'),
      // headers: {
      //   HttpHeaders.contentTypeHeader: 'application/json',
      // },
      body: body?.toJson(),
    );

    final data = json.decode(response.body);

    if (response.statusCode == 200) {
      return ResponseUseCase<T>(valid: true, message: 'Success', data: data);
    }

    String message;
    if (response.body.contains("errors")) {
      Map<String, dynamic> errorResponse = jsonDecode(response.body);
      message = errorResponse["errors"].values.first[0];
    } else {
      message = jsonDecode(response.body)['message'];
    }
    return ResponseUseCase<T>(valid: false, message: message);
  } catch (error) {
    return ResponseUseCase<T>(valid: false, message: error.toString());
  }
}

Future<HttpResponse> postDataWithToken(String url, dynamic body) async {
  try {
    String token = await getToken();

    final response = await http.post(
      Uri.parse('$baseUrl$url'),
      headers: {
        HttpHeaders.acceptHeader: 'application/json',
        // HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader: token
      },
      body: body?.toJson(),
    );

    final data = json.decode(response.body);

    if (response.statusCode == 200) {
      return HttpResponse(
        success: true,
        response: data,
        status: true,
        message: 'Succesfully get data',
      );
    }

    String message;
    if (response.body.contains("errors")) {
      Map<String, dynamic> errorResponse = jsonDecode(response.body);
      message = errorResponse["errors"].values.first[0];
    } else {
      message = jsonDecode(response.body)['message'];
    }
    return HttpResponse(
      success: false,
      response: null,
      status: false,
      message: message,
    );
  } catch (error) {
    return HttpResponse(
        success: false,
        response: null,
        status: false,
        message: error.toString());
  }
}

Future<ResponseUseCase<T>> putDataWithToken<T>(String url, dynamic body) async {
  try {
    String token = await getToken();

    print(token);

    final response = await http.put(
      Uri.parse('$baseUrl$url'),
      headers: {
        HttpHeaders.acceptHeader: 'application/json',
        // HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader: token
      },
      body: body.toJson(),
    );

    final data = json.decode(response.body);

    if (response.statusCode == 200) {
      return ResponseUseCase<T>(
          valid: true, message: 'Success updated data', data: data);
    }

    String message;
    if (response.body.contains("errors")) {
      Map<String, dynamic> errorResponse = jsonDecode(response.body);
      message = errorResponse["errors"].values.first[0];
    } else {
      message = jsonDecode(response.body)['message'];
    }
    return ResponseUseCase<T>(valid: false, message: message);
  } catch (error) {
    return ResponseUseCase<T>(valid: false, message: error.toString());
  }
}

Future<HttpResponse<T>> getDataWithToken<T>(
    String url, String? token, bool? isList) async {
  try {
    String token = await getToken();

    print(token);
    final response = await http.get(
      Uri.parse('$baseUrl$url'),
      headers: {
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader: token,
      },
    );

    final data = json.decode(response.body);

    if (response.statusCode == 200) {
      return HttpResponse<T>(
        success: true,
        response: data,
        status: true,
        message: 'Succesfully get data',
      );
    }

    String message;
    if (response.body.contains("errors")) {
      Map<String, dynamic> errorResponse = jsonDecode(response.body);
      message = errorResponse["errors"].values.first[0];
    } else {
      message = jsonDecode(response.body)['message'];
    }
    return HttpResponse<T>(
      success: false,
      response: null,
      status: false,
      message: message,
    );
  } catch (error) {
    return HttpResponse<T>(
        success: false,
        response: null,
        status: false,
        message: error.toString());
  }
}

Future<HttpResponse> getData<T>(String url, String? token) async {
  try {
    final response = await http.get(
      Uri.parse('$baseUrl$url'),
      headers: {
        HttpHeaders.acceptHeader: 'application/json',
      },
    );

    final data = json.decode(response.body);

    if (response.statusCode == 200) {
      return HttpResponse(
        success: true,
        response: data['data'],
        status: true,
        message: data['message'] ?? 'Succesfully get data',
      );
    }

    String message;
    if (response.body.contains("errors")) {
      Map<String, dynamic> errorResponse = jsonDecode(response.body);
      message = errorResponse["errors"].values.first[0];
    } else {
      message = jsonDecode(response.body)['message'];
    }
    return HttpResponse(
      success: false,
      response: null,
      status: false,
      message: message,
    );
  } catch (error) {
    return HttpResponse(
        success: false,
        response: null,
        status: false,
        message: error.toString());
  }
}

Future<HttpResponse> deleteData<T>(String url, dynamic body) async {
  try {
    final response = await http.post(
      Uri.parse('$baseUrl$url'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      },
      body: body.toJson(),
    );

    final data = json.decode(response.body);

    if (response.statusCode == 200) {
      return HttpResponse(
        success: true,
        response: data['data'],
        status: true,
        message: data['message'] ?? 'Succesfully delete data',
      );
    }

    String message;
    if (response.body.contains("errors")) {
      Map<String, dynamic> errorResponse = jsonDecode(response.body);
      message = errorResponse["errors"].values.first[0];
    } else {
      message = jsonDecode(response.body)['message'];
    }
    return HttpResponse(
      success: false,
      response: null,
      status: false,
      message: message,
    );
  } catch (error) {
    return HttpResponse(
        success: false,
        response: null,
        status: false,
        message: error.toString());
  }
}
