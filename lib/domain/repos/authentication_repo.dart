import 'package:elevate_online_exam/common/api_result.dart';
import 'package:elevate_online_exam/domain/models/user.dart';

abstract class AuthenticationRepo {
  Future<Result<User?>> login(String email, String password);
  Future<Result<User?>> register(
    String username,
    String firstName,
    String lastName,
    String email,
    String password,
    String rePassword,
    String phone,
  );
  Future<Result<String>> forgotPassword(String email);
  Future<Result<bool>> verifyResetPassword(String resetCode);
  Future<Result<User?>> resetPassword(String email, String newPassword);
}
