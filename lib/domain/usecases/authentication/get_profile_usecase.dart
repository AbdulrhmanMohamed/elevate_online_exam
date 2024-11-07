import 'package:elevate_online_exam/common/api_result.dart';
import 'package:elevate_online_exam/domain/models/user.dart';
import 'package:elevate_online_exam/domain/repos/authentication_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetProfileUsecase {
  AuthenticationRepo _authenticationRepo;

  GetProfileUsecase(this._authenticationRepo);

  Future<Result<User?>> getProfile() async {
  return _authenticationRepo.getProfile();
  }
}
