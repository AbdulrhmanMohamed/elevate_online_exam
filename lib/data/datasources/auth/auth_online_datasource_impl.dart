// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:basic_layout/data/api/api_result.dart';
import 'package:basic_layout/data/api/execute_api.dart';
import 'package:basic_layout/data/models/request/login_request.dart';
import 'package:basic_layout/data/models/response/auth_response.dart';
import 'package:injectable/injectable.dart';

import 'package:basic_layout/data/api/api_manager.dart';
import 'package:basic_layout/data/contracts/auth/auth_online_datasource.dart';
import 'package:basic_layout/domain/user.dart';
@Injectable(as:AuthOnlineDatasource)
class AuthOnlineDatasourceImpl implements AuthOnlineDatasource {

ApiManager _apiManager;

AuthOnlineDatasourceImpl(this._apiManager);





  @override
  Future<Result<User?>> forgetPassword(String email) {
    // TODO: implement forgetPassword
    throw UnimplementedError();
  }

  @override
  Future<Result<User?>> login(String email, String password) {
    return executeApi<User>(()async{
      var authResponse = await _apiManager.login(LoginRequest(email, password));
      var userData = Userdata(token: authResponse.token);
      return userData.toUser(userData);

    },);
  }

  @override
  Future<Result<User?>> register(String username, String firstName, String lastName, String email, String password, String rePassword, String phone) {
    // TODO: implement register
    throw UnimplementedError();
  }
}
