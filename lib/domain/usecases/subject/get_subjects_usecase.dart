import 'package:elevate_online_exam/common/api_result.dart';
import 'package:elevate_online_exam/domain/models/subject.dart';
import 'package:elevate_online_exam/domain/repos/subject_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetSubjectsUsecase {
  final SubjectRepo _subjectRepo;
  GetSubjectsUsecase(this._subjectRepo);

  Future<Result<List<Subject?>>> getSubjects() async {
    var result = await _subjectRepo.getSubjects();
    return result;
  }
}
