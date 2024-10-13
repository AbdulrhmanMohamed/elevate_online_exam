import 'package:basic_layout/data/api/api_result.dart';
import 'package:basic_layout/domain/user.dart';

abstract class AuthOfflineDatasource {


Result<User?> login(String email,String password);

}