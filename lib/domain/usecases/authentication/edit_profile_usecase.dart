import 'package:elevate_online_exam/common/api_result.dart';
import 'package:elevate_online_exam/data/api/models/request/register_body.dart';
import 'package:elevate_online_exam/domain/models/user.dart';
import 'package:elevate_online_exam/domain/repos/authentication_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class EditProfileUsecase {
  AuthenticationRepo _authenticationRepo;

  EditProfileUsecase(this._authenticationRepo);

  Future<Result<User?>> editProfile(AuthBody body) async {
  return _authenticationRepo.editProfile(body);
  }
}
