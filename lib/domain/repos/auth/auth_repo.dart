
import 'package:basic_layout/data/api/api_result.dart';
import 'package:basic_layout/domain/user.dart';

abstract class AuthRepo {

  Future<Result<User?>> login(String email ,String password);
  Future<Result<User?>> register(String username,String firstName,String lastName,String email ,String password,rePassword,phone);
  Future<Result<User?>> forgetPassword(String email );
}