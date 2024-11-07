import 'correct_question.dart';
import 'wrong_question.dart';

class CheckAnswersResposnse {
  String? message;
  int? correct;
  int? wrong;
  String? total;
  List<WrongQuestion>? wrongQuestions;
  List<CorrectQuestion>? correctQuestions;

  CheckAnswersResposnse({
    this.message,
    this.correct,
    this.wrong,
    this.total,
    this.wrongQuestions,
    this.correctQuestions,
  });

  factory CheckAnswersResposnse.fromJson(Map<String, dynamic> json) {
    return CheckAnswersResposnse(
      message: json['message'] as String?,
      correct: json['correct'] as int?,
      wrong: json['wrong'] as int?,
      total: json['total'] as String?,
      wrongQuestions: (json['WrongQuestions'] as List<dynamic>?)
          ?.map((e) => WrongQuestion.fromJson(e as Map<String, dynamic>))
          .toList(),
      correctQuestions: (json['correctQuestions'] as List<dynamic>?)
          ?.map((e) => CorrectQuestion.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'correct': correct,
        'wrong': wrong,
        'total': total,
        'WrongQuestions': wrongQuestions?.map((e) => e.toJson()).toList(),
        'correctQuestions': correctQuestions?.map((e) => e.toJson()).toList(),
      };
}
