import 'package:elevate_online_exam/common/api_result.dart';
import 'package:elevate_online_exam/domain/models/user.dart';
import 'package:elevate_online_exam/domain/repos/authentication_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUsecase {
  AuthenticationRepo authenticationRepo;

  LoginUsecase(this.authenticationRepo);

  Future<Result<User?>> invoke(String email, String password) {
    return authenticationRepo.login(email, password);
  }
}
