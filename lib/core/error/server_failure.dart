import 'package:dio/dio.dart';

import 'failure.dart';

class ServerFailure extends Failure {
  ServerFailure(super.message);

  // Factory constructor to create failure from DioException
  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(
            "Connection timed out. Please check your internet connection and try again.");
      case DioExceptionType.sendTimeout:
        return ServerFailure(
            "Request timed out while sending data to the server. Please try again.");
      case DioExceptionType.receiveTimeout:
        return ServerFailure(
            "Response timed out while waiting for server. Please try again.");
      case DioExceptionType.badCertificate:
        return ServerFailure(
            "The server's certificate could not be verified. Please contact support.");
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioException.response?.statusCode, dioException.response?.data);
      case DioExceptionType.cancel:
        return ServerFailure("The request was canceled. Please try again.");
      case DioExceptionType.connectionError:
        return ServerFailure(
            "No internet connection. Please check your connection and try again.");
      case DioExceptionType.unknown:
      default:
        return ServerFailure(
            "An unexpected error occurred: ${dioException.message ?? 'Please try again later.'}");
    }
  }

  // Method to handle specific HTTP status codes for custom messages
  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    switch (statusCode) {
      case 400:
        return ServerFailure(
            "Bad request. Please check your input and try again.");
      case 401:
        return ServerFailure("Unauthorized access. Please log in to continue.");
      case 403:
        return ServerFailure(
            "Access forbidden. You do not have permission to access this resource.");
      case 404:
        return ServerFailure(
            "Resource not found. Please check the requested data.");
      case 500:
        return ServerFailure("Internal server error. Please try again later.");
      case 503:
        return ServerFailure(
            "Service unavailable. The server is currently unreachable. Please try again later.");
      default:
        return ServerFailure(
            "Network error. Status code: $statusCode. ${response ?? 'Please try again later.'}");
    }
  }
}
