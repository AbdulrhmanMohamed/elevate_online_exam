import 'package:elevate_online_exam/common/api_result.dart';
import 'package:elevate_online_exam/domain/models/subject.dart';

abstract class SubjectRepo {


 Future<Result<List<Subject?>>> getSubjects();
}