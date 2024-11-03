import 'package:elevate_online_exam/common/api_result.dart';
import 'package:elevate_online_exam/domain/models/exam.dart';

abstract class ExamRepo {


 Future<Result<List<Exam?>>> getExamsBySubject(String  subjectId);

}