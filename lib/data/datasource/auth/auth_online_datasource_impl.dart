import 'package:elevate_online_exam/common/api_result.dart';
import 'package:elevate_online_exam/data/api/api_extentions.dart';
import 'package:elevate_online_exam/data/api/models/request/register_body.dart';
import 'package:elevate_online_exam/data/api/models/user_dto.dart';
import 'package:elevate_online_exam/data/contracts/auth/auth_online_datasource.dart';
import 'package:elevate_online_exam/domain/models/user.dart';
import 'package:injectable/injectable.dart';

import 'package:elevate_online_exam/data/api/api_manager.dart';

@Injectable(as: AuthOnlineDatasource)
class AuthOnlineDatasourceImpl implements AuthOnlineDatasource {
  ApiManager apiManager;
  AuthOnlineDatasourceImpl({required this.apiManager});

  Future<Result<User?>> login(String email, String password) async {
    return executeApi(() async {
      var result = await apiManager.login(email, password);
      var user = result?.user;

      var userDto = UserDto(isVerified: user?.isVerified, token: result?.token);
      return userDto.toUser();
    });
  }

  Future<Result<User?>> register(
    String username,
    String firstName,
    String lastName,
    String email,
    String password,
    String rePassword,
    String phone,
  ) async {
    var registerBody = RegisterBody(
      email: email,
      username: username,
      firstName: firstName,
      lastName: lastName,
      password: password,
      rePassword: rePassword,
      phone: phone,
    );

    return executeApi(
      () async {
        var result = await apiManager.register(registerBody);
        var user = result?.user;
        var userDto = UserDto(
            username: user?.username,
            firstName: user?.firstName,
            lastName: user?.lastName,
            email: user?.email,
            isVerified: user?.isVerified,
            token: result?.token);

        return userDto.toUser();
      },
    );
  }

  @override
  Future<Result<String>> forgotPassword(String email) {
    return executeApi(() async {
      var result = await apiManager.fogotPassword(email);
      return result;
    });
  }

  @override
  Future<Result<bool>> verifyResetPassword(String resetCode) {
    return executeApi(() async {
      var result = await apiManager.verifyResetPassword(resetCode);
      return result;
    });
  }

  @override
  Future<Result<User?>> resetPasswprd(String email, String newPassword) {
    return executeApi(() async {
      var result = await apiManager.resetPassword(email, newPassword);
      var user = result?.user;
      var userDto = UserDto(isVerified: user?.isVerified, token: result?.token);
      return userDto.toUser();
    });
  }
}
