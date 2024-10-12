import 'package:elevate_online_exam/common/api_result.dart';
import 'package:elevate_online_exam/domain/models/user.dart';
import 'package:elevate_online_exam/domain/repos/authentication_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class ForgetPasswordUsecase {
  final AuthenticationRepo _authenticationRepo;

  ForgetPasswordUsecase(this._authenticationRepo);

  Future<Result<String>> forgotPassword(String email) async {
    return await _authenticationRepo.forgotPassword(email);
  }

  Future<Result<bool>> verifyResetPassword(String resetCode) async {
    return await _authenticationRepo.verifyResetPassword(resetCode);
  }

  Future<Result<User?>> resetPassword(String email, String newPassword) async {
    return await _authenticationRepo.resetPassword(email, newPassword);
  }
}
