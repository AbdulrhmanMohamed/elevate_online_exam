import 'package:basic_layout/data/api/api_result.dart';
import 'package:basic_layout/domain/repos/auth/auth_repo.dart';
import 'package:basic_layout/domain/user.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterUsecase {
  final AuthRepo _authRepo;

  RegisterUsecase(this._authRepo);

  Future<Result<User?>> invoke(String username,String firstName,String lastName,String email ,String password,String rePassword,String phone) async {
    return await _authRepo.register(username,firstName,lastName,email,password,rePassword,phone);
  }
}
