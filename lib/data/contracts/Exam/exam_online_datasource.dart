import 'package:elevate_online_exam/common/api_result.dart';
import 'package:elevate_online_exam/domain/models/exam_questions/exam_questions.dart';
import 'package:elevate_online_exam/domain/models/exam_score.dart';

abstract class ExamOnlineDatasource {
  Future<Result<ExamQuestions>> getExamQuestions(String examId);
  Future<Result<ExamScore>> checkAnswers(Map<String, String> answers);
}
