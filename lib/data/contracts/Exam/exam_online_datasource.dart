import 'package:elevate_online_exam/common/api_result.dart';
import 'package:elevate_online_exam/domain/models/exam_questions/exam_questions.dart';

abstract class ExamOnlineDatasource {
  Future<Result<ExamQuestions>> getExamQuestions(String examId);
}
