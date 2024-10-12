import 'package:elevate_online_exam/data/api/api_error_handler.dart';

String extractErrorMessage(Exception? exception) {
  var message = "something went wrong";
  if (exception is NoInternetError) {
    message = "please check internet connection";
  } else if (exception is DioHttpException) {
    // if (exception.exception?.response?.statusCode == 401) {
    //   message = "please login again";
    // }
    // message = exception.exception?.response!.data['message'] ??
    //     "something went wrong";
    message = exception.exception?.response!.data.toString() ??
        "something went wrong";
  }
  return message;
}
