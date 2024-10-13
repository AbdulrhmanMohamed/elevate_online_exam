import 'package:basic_layout/data/api/api_result.dart';
import 'package:basic_layout/data/api/execute_api.dart';
import 'package:basic_layout/data/contracts/auth/auth_offline_datasource.dart';
import 'package:basic_layout/data/contracts/auth/auth_online_datasource.dart';
import 'package:basic_layout/domain/repos/auth/auth_repo.dart';
import 'package:basic_layout/domain/user.dart';
import 'package:injectable/injectable.dart';

@Injectable(as:AuthRepo)
class AuthRepoImpl  implements AuthRepo{
  AuthOnlineDatasource _authOnlineDatasource;
  AuthOfflineDatasource _authOfflineDatasource;

  AuthRepoImpl(this._authOnlineDatasource,this._authOfflineDatasource);
  @override
  Future<Result<User?>> login(String email, String password) async{
   
    var result=await this._authOnlineDatasource.login(email, password);
    return result;
    // i should call the AuthOnline DataSource To Return The User Token atleast
    // throw UnimplementedError();
  }
  @override
  Future<Result<User?>> forgetPassword(String email) {
    // TODO: implement forgetPassword
    throw UnimplementedError();
  }


  @override
  Future<Result<User?>> register(String username, String firstName, String lastName, String email, String password, rePassword, phone) {
    // TODO: implement register
    throw UnimplementedError();
  }
}