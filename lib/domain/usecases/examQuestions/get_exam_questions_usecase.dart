import 'package:elevate_online_exam/common/api_result.dart';
import 'package:elevate_online_exam/domain/models/exam_questions/exam_questions.dart';
import 'package:elevate_online_exam/domain/repos/exam_questions_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetExamQuestionsUsecase {
  final ExamQuestionsRepo _examQuestionsRepo;
  GetExamQuestionsUsecase(this._examQuestionsRepo);
  Future<Result<ExamQuestions>> getExamQuestions(String examId) async {
    return await _examQuestionsRepo.getExamQuestions(examId);
  }
}
