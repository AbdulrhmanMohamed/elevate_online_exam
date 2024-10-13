import 'package:dio/dio.dart';

class DioExceptionHelper {
  static String handleDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return "Connection timeout, please try again.";
      case DioExceptionType.sendTimeout:
        return "Request timeout, please try again.";
      case DioExceptionType.receiveTimeout:
        return "Response timeout, please check your network and try again.";
      case DioExceptionType.badResponse:
        // Handle different status codes here if needed
        return _handleHttpError(dioException.response)!;
      case DioExceptionType.cancel:
        return "Request was cancelled, please try again.";
      case DioExceptionType.unknown:
        return "Something went wrong, please check your connection or try again.";
      default:
        return "An unexpected error occurred.";
    }
  }

  static String? _handleHttpError(Response? response) {
    if (response == null || response.data == null) {
      return "Unknown error occurred.";
    }

    // Check if the response contains a message from the server
    if (response.data is Map<String, dynamic>) {
      final message = response.data['message'];
      if (message != null && message is String) {
        return message; // Return the message from the server if available
      }
     
    }
    return null;
    
  }
}
