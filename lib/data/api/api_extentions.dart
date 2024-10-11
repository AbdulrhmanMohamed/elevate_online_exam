import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:elevate_online_exam/common/api_result.dart';
import 'package:elevate_online_exam/data/api/api_error_handler.dart';


Future<Result<T>> executeApi<T>( Future<T> Function() apiCall ) async{
  try{
    var result = await apiCall.call();
    return Success(result);

  }on TimeoutException catch(ex){
    return Fail(NoInternetError());
  }on IOException catch(ex){
    return Fail(NoInternetError());
  }on DioException catch(ex){
    return Fail(DioHttpException(ex));
  }on Exception catch(ex){
    return Fail(ex);
  }
}
