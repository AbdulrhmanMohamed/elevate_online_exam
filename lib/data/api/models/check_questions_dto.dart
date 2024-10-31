import 'package:elevate_online_exam/domain/models/exam_score.dart';

class CheckQuestionsDto {
  int? correct;
  int? wrong;
  String? total;
  CheckQuestionsDto({this.correct, this.wrong, this.total});
  ExamScore toExamScore() {
    return ExamScore(correct: correct, wrong: wrong, total: total);
  }
}
