import 'package:elevate_online_exam/common/api_result.dart';
import 'package:elevate_online_exam/data/api/api_extentions.dart';
import 'package:elevate_online_exam/data/api/api_manager.dart';
import 'package:elevate_online_exam/data/api/models/exam_dto.dart';
import 'package:elevate_online_exam/data/contracts/exams/exams_online_datasource.dart';
import 'package:elevate_online_exam/domain/models/exam.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ExamsOnlineDatasource)
class ExamsOnlineDatasourceImpl implements ExamsOnlineDatasource {
  final ApiManager _apiManager;
  ExamsOnlineDatasourceImpl(this._apiManager);

  @override
  Future<Result<List<Exam?>>> getExamsBySubject(String subjectId) {
    return executeApi(() async {
      List<Exam> exams = [];
      var response = await _apiManager.getExamsBySubject(subjectId);
      response?.exams?.forEach((exam) {
        var dto = ExamDto(
            id: exam.id,
            duration: exam.duration,
            numberOfQuestions: exam.numberOfQuestions,
            subject: exam.subject,
            title: exam.title,);
        exams.add(dto.toExam()
        );
      });
      return exams;
    });
  }
}
