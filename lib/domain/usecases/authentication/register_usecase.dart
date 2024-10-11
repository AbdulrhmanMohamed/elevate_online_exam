import 'package:elevate_online_exam/common/api_result.dart';
import 'package:elevate_online_exam/domain/models/user.dart';
import 'package:elevate_online_exam/domain/repos/authentication_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterUsecase {
  AuthenticationRepo authenticationRepo;

  RegisterUsecase(this.authenticationRepo);

  Future<Result<User?>> invoke(
    String username,
    String firstName,
    String lastName,
    String email,
    String password,
    String rePassword,
    String phone,
  ) {
    return authenticationRepo.register(
        username, firstName, lastName, email, password, rePassword, phone);
  }
}
