import 'package:elevate_online_exam/common/api_result.dart';
import 'package:elevate_online_exam/data/contracts/Exam/exam_online_datasource.dart';
import 'package:elevate_online_exam/domain/models/exam_questions/exam_questions.dart';
import 'package:elevate_online_exam/domain/models/exam_score.dart';
import 'package:elevate_online_exam/domain/repos/exam_questions_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ExamQuestionsRepo)
class ExamQuestionsRepoImpl implements ExamQuestionsRepo {
  final ExamOnlineDatasource _examOnlineDatasource;
  ExamQuestionsRepoImpl(this._examOnlineDatasource);
  @override
  Future<Result<ExamQuestions>> getExamQuestions(String examId) async {
    return await _examOnlineDatasource.getExamQuestions(examId);
  }

  @override
  Future<Result<ExamScore>> getExamScore(Map<String, String> answers) async {
    return await _examOnlineDatasource.checkAnswers(answers);
  }
}
