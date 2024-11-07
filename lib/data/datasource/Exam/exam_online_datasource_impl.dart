import 'package:elevate_online_exam/common/api_result.dart';
import 'package:elevate_online_exam/data/api/api_extentions.dart';
import 'package:elevate_online_exam/data/api/api_manager.dart';
import 'package:elevate_online_exam/data/api/models/check_questions_dto.dart';
import 'package:elevate_online_exam/data/api/models/exam_questions_dto.dart';
import 'package:elevate_online_exam/data/api/models/request/check_questions_body/answer.dart';
import 'package:elevate_online_exam/data/api/models/request/check_questions_body/check_questions_body.dart';
import 'package:elevate_online_exam/data/contracts/Exam/exam_online_datasource.dart';
import 'package:elevate_online_exam/domain/models/exam_questions/exam_questions.dart';
import 'package:elevate_online_exam/domain/models/exam_score.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ExamOnlineDatasource)
class ExamOnlineDatasourceImpl implements ExamOnlineDatasource {
  final ApiManager _apiManager;
  ExamOnlineDatasourceImpl(this._apiManager);
  @override
  Future<Result<ExamQuestions>> getExamQuestions(String examId) {
    return executeApi(() async {
      final response = await _apiManager.getQuestions(examId);
      if (response!.questions!.isEmpty) {
        throw Exception("No questions found");
      }
      var dto = ExamQuestionsDto(questions: response?.questions);
      return dto.toExamQuestions();
    });
  }

  @override
  Future<Result<ExamScore>> checkAnswers(Map<String, String> answers) {
    List<Answer> answersList = [];
    answers.forEach(
      (key, value) => answersList.add(Answer(questionId: key, correct: value)),
    );
    CheckQuestionsBody checkQuestionsBody =
        CheckQuestionsBody(answers: answersList);
    return executeApi(
      () async {
        final response = await _apiManager.checkAnswers(checkQuestionsBody);
        final dto = CheckQuestionsDto(
            correct: response?.correct,
            wrong: response?.wrong,
            total: response?.total);
        return dto.toExamScore();
      },
    );
  }
}
