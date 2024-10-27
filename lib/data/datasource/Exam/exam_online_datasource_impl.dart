import 'package:elevate_online_exam/common/api_result.dart';
import 'package:elevate_online_exam/data/api/api_extentions.dart';
import 'package:elevate_online_exam/data/api/api_manager.dart';
import 'package:elevate_online_exam/data/api/models/exam_questions_dto.dart';
import 'package:elevate_online_exam/data/contracts/Exam/exam_online_datasource.dart';
import 'package:elevate_online_exam/domain/models/exam_questions/exam_questions.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ExamOnlineDatasource)
class ExamOnlineDatasourceImpl implements ExamOnlineDatasource {
  final ApiManager _apiManager;
  ExamOnlineDatasourceImpl(this._apiManager);
  @override
  Future<Result<ExamQuestions>> getExamQuestions(String examId) {
    return executeApi(() async {
      final response = await _apiManager.getQuestions(examId);
      var dto = ExamQuestionsDto(questions: response?.questions);
      return dto.toExamQuestions();
    });
  }
}
