import 'package:elevate_online_exam/common/api_result.dart';
import 'package:elevate_online_exam/domain/models/exam.dart';
import 'package:elevate_online_exam/domain/repos/exams_repo.dart';
import 'package:injectable/injectable.dart';
@injectable
class GetExamsBySubjectUsecase {
 final ExamRepo _examRepo;
 GetExamsBySubjectUsecase(this._examRepo);


 Future<Result<List<Exam?>>> getExamsBySubject(String subjectId)async{
 
  var result= await _examRepo.getExamsBySubject(subjectId);
  return result;
 } 


}