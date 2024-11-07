import 'package:elevate_online_exam/common/api_result.dart';
import 'package:elevate_online_exam/data/api/models/request/auth_body.dart';
import 'package:elevate_online_exam/data/contracts/auth/auth_online_datasource.dart';
import 'package:elevate_online_exam/domain/models/user.dart';
import 'package:elevate_online_exam/domain/repos/authentication_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthenticationRepo)
class AuthRepoImpl implements AuthenticationRepo {
  final AuthOnlineDatasource _authOnlineDatasource;
  //final AuthOfflineDatasource _authOfflineDatasource;

  AuthRepoImpl(this._authOnlineDatasource);

  @override
  Future<Result<User?>> login(String email, String password) async {
    return await _authOnlineDatasource.login(email, password);

  }

  @override
  Future<Result<User?>> register(
      String username,
      String firstName,
      String lastName,
      String email,
      String password,
      String rePassword,
      String phone) async {
  
    return await _authOnlineDatasource.register(
        username, firstName, lastName, email, password, rePassword, phone);
  }

  @override
  Future<Result<String>> forgotPassword(String email) async {
    return await _authOnlineDatasource.forgotPassword(email);
  }

  @override
  Future<Result<bool>> verifyResetPassword(String resetCode) async {
    return await _authOnlineDatasource.verifyResetPassword(resetCode);
  }

  @override
  Future<Result<User?>> resetPassword(String email, String newPassword) async {
    return await _authOnlineDatasource.resetPasswprd(email, newPassword);
  }
  
  @override
  Future<Result<User?>> getProfile() async{
     
    return await _authOnlineDatasource.getProfile();
  }
  @override
  Future<Result<User?>> editProfile(AuthBody body) async{
     
    return await _authOnlineDatasource.editProfile(body);
  }
}
