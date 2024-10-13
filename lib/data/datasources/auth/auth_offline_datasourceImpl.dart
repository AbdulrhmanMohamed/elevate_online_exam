import 'package:basic_layout/data/api/api_result.dart';
import 'package:basic_layout/data/contracts/auth/auth_offline_datasource.dart';
import 'package:basic_layout/domain/user.dart';
import 'package:injectable/injectable.dart';
@Injectable(as:AuthOfflineDatasource)
class AuthOfflineDatasourceImpl extends AuthOfflineDatasource{
  @override
  Result<User?>login(String email, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }
}