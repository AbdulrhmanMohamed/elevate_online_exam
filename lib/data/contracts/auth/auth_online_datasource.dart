// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:basic_layout/data/api/api_result.dart';
import 'package:basic_layout/domain/user.dart';



abstract class AuthOnlineDatasource {

   

  Future<Result<User?>>login(String email,String password);
  Future<Result<User?>>register(String username,String firstName,String lastName,String email ,String password,String rePassword,String phone);
  Future<Result<User?>>forgetPassword(String email);
   
}
