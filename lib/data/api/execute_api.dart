import 'package:basic_layout/data/api/api_error.dart';
import 'package:basic_layout/data/api/api_result.dart';
import 'package:dio/dio.dart';

Future<Result<T>> executeApi<T>(Future<T> Function() apiCall) async {
  try {
    var result = await apiCall.call();
    return Success(result);
  } on DioException catch (ex) {
    return Fail(DioExceptionHelper.handleDioException(ex));
  }
}
