
import 'package:basic_layout/data/api/api_consts.dart';
// import 'package:basic_layout/data/api/models/request/register/register_body/response/auth/auth_response.dart';
import 'package:basic_layout/data/models/request/login_request.dart';
import 'package:basic_layout/data/models/request/register_request.dart';
import 'package:basic_layout/data/models/response/auth_response.dart';
import 'package:injectable/injectable.dart';
// import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:dio/dio.dart';
part 'api_manager.g.dart';

@RestApi(baseUrl: ApiConsts.baseUrl)
@lazySingleton
abstract class ApiManager {
@factoryMethod
  factory ApiManager(Dio dio, {String? baseUrl}) {
    // Add the PrettyDioLogger and token interceptor to Dio
    dio.interceptors.addAll([
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // Fetch the token (e.g., from secure storage)
          String? token =''?? null; // Replace with your token-fetching logic
          if (token != null) {
            options.headers["token"] = token;
          }
          return handler.next(options); // Continue request
        },
      ),
      // Add PrettyDioLogger for logging
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    ]);

    return _ApiManager(dio, baseUrl: baseUrl); // Retrofit's internal constructor
  }

  @POST(ApiConsts.login)
  Future<AuthResponse> login(
    @Body() LoginRequest loginBody,
  );


  @POST(ApiConsts.signup)
  Future<AuthResponse> register(
    @Body() RegisterRequest registerBody,
  );




  
}

