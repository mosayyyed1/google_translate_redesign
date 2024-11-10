import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;
  static const String kBaseUrl =
      "https://free-google-translator.p.rapidapi.com/external-api";

  ApiService(this._dio);

  Future<Response> get({
    required String endpoint,
    required Map<String, dynamic> queryParameters,
  }) async {
    final response =
        await _dio.get("$kBaseUrl/$endpoint", queryParameters: queryParameters);
    return response;
  }

  Future<Response> post(
      {required String endpoint,
      required Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? data,
      Options? options}) async {
    final response = await _dio.post(
      "$kBaseUrl/$endpoint",
      queryParameters: queryParameters,
      options: options,
      data: data,
    );
    return response;
  }
}
