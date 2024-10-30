import 'package:elevate_online_exam/common/api_result.dart';
import 'package:elevate_online_exam/data/contracts/exams/exams_online_datasource.dart';
import 'package:elevate_online_exam/domain/models/exam.dart';
import 'package:elevate_online_exam/domain/repos/exams_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as:ExamRepo)
class ExamRepoImpl implements ExamRepo{
 final ExamsOnlineDatasource _examsOnlineDatasource;
 ExamRepoImpl(this._examsOnlineDatasource);
  @override
  Future<Result<List<Exam?>>> getExamsBySubject(String subjectId) async{
    var result= await _examsOnlineDatasource.getExamsBySubject(subjectId);
    return result;
  }
  

  
}
