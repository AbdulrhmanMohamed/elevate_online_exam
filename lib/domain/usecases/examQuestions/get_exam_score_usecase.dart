import 'package:elevate_online_exam/common/api_result.dart';
import 'package:elevate_online_exam/domain/models/exam_score.dart';
import 'package:elevate_online_exam/domain/repos/exam_questions_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetExamScoreUsecase {
  final ExamQuestionsRepo _examQuestionsRepo;
  GetExamScoreUsecase(this._examQuestionsRepo);
  Future<Result<ExamScore>> getExamScore(Map<String, String> answers) async {
    return await _examQuestionsRepo.getExamScore(answers);
  }
}
