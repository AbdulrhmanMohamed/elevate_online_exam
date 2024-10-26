import 'package:elevate_online_exam/data/api/models/response/auth_response/auth_response/user.dart';

abstract class AuthOfflineDatasource {



Future<User?> login(String email,String password);
}