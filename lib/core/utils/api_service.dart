import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;
  static const String kBaseUrl = "https://api.openweathermap.org/data/2.5";

  ApiService(this._dio) {
    _dio.options.baseUrl = kBaseUrl;
    _dio.options.connectTimeout = const Duration(seconds: 10);
    _dio.options.receiveTimeout = const Duration(seconds: 10);
  }

  Future<Response?> get({
    required String endpoint,
    required Map<String, dynamic> queryParameters,
  }) async {
    final response =
        await _dio.get("$kBaseUrl/$endpoint", queryParameters: queryParameters);
    return response;
  }

  Future<Response> post(
      {required String endpoint,
      Map<String, dynamic>? data,
      Options? options}) async {
    final response = await _dio.post(
      endpoint,
      options: options,
      data: data,
    );
    return response.data;
  }
}
