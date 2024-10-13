import 'package:basic_layout/data/api/api_result.dart';
import 'package:basic_layout/domain/repos/auth/auth_repo.dart';
import 'package:basic_layout/domain/user.dart';
import 'package:injectable/injectable.dart';

@injectable
class ForgetpasswordUsecase {
  final AuthRepo _authRepo;

  ForgetpasswordUsecase(this._authRepo);

  Future<Result<User?>> invoke(String email) async {
    return await _authRepo.forgetPassword(email);
  }
}
