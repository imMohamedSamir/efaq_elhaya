import 'dart:developer';
import 'package:dio/dio.dart';

class ApiServices {
  final String _baseUrl = 'https://afackapi.runasp.net/api/';

  final Dio _dio;
  ApiServices(this._dio);

  Future<dynamic> get(
      {required String endPoint, String? token, bool isPdf = false}) async {
    var response = await _dio.get('$_baseUrl$endPoint',
        options: Options(headers: {
          'Content-Type': 'application/json',
          'accept': 'text/plain',
          'Authorization': token == null ? null : 'Bearer $token'
        }, responseType: isPdf ? ResponseType.bytes : null));
    return response.data;
  }

  Future<dynamic> post(
      {required String endPoint,
      body,
      String? token,
      bool isMulti = false}) async {
    var response = await _dio.post('$_baseUrl$endPoint',
        data: body,
        // queryParameters: body,
        options: Options(headers: {
          'accept': '*/*',
          // 'Content-Type': isMulti ? 'multipart/form-data' : 'application/json',
          'Authorization': token == null ? null : 'Bearer $token'
        }));
    if (response.statusCode == 200) {
      dynamic responseData = response.data;
      return responseData;
    } else {
      // Handle HTTP error status codes
    }
    return response.data;
  }

  Future<dynamic> delete({required String endPoint, String? token}) async {
    var response = await _dio.delete('$_baseUrl$endPoint',
        options: token == null
            ? null
            : Options(
                headers: {'accept': '*/*', 'Authorization': 'Bearer $token'}));
    log("${response.data.runtimeType}");
    return response.data;
  }
}
