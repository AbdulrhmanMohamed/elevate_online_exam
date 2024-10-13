import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:dio/dio.dart';
// @injectable
class DioManager {
  Dio _dio;

  DioManager() : _dio = Dio() {
    _addDioInterceptor();
  }

  Dio get dio => _dio; // Provide access to the Dio instance

  void _addDioInterceptor() {
    _dio.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseBody: true,
      ),
    );
  }
}
Dio dio=DioManager().dio;