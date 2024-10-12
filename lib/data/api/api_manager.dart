import 'package:dio/dio.dart';
import 'package:elevate_online_exam/data/api/api_consts.dart';
import 'package:elevate_online_exam/data/api/models/request/register_body.dart';
import 'package:elevate_online_exam/data/api/models/response/auth_response/auth_response/auth_response.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ApiManager {
  late Dio _dio;

  ApiManager() {
    _dio = Dio(BaseOptions(baseUrl: ApiConsts.baseUrl));
  }

  Future<AuthResponse?> login(String email, String password) async {
    var response =
        await _dio.post(ApiConsts.singinPath, data: {email, password});
    return AuthResponse.fromJson(response.data);
  }

  Future<AuthResponse?> register(RegisterBody registerBody) async {
    var response = await _dio.post(ApiConsts.singinPath, data: registerBody);
    return AuthResponse.fromJson(response.data);
  }

  Future<AuthResponse?> fogotPassword(String email) async {
    var response =
        await _dio.post(ApiConsts.forgetPasswordPath, data: {"email": email});
    return AuthResponse.fromJson(response.data);
  }

  Future<AuthResponse?> verifyResetPassword(String resetCode) async {
    var response = await _dio
        .post(ApiConsts.forgetPasswordPath, data: {"resetCode": resetCode});
    return AuthResponse.fromJson(response.data);
  }

  Future<AuthResponse?> resetPassword(String email, String newPassword) async {
    var response = await _dio
        .post(ApiConsts.resetPasswordPath, data: {"newPassword": newPassword});
    return AuthResponse.fromJson(response.data);
  }
}
