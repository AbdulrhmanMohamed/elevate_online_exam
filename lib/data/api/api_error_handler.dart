import 'package:dio/dio.dart';


class DioHttpException implements Exception{
  DioException? exception;
  DioHttpException(this.exception);
}
class NoInternetError implements Exception{

}