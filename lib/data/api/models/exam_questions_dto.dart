import 'package:elevate_online_exam/data/api/models/response/exam_questions_response/question.dart';
import 'package:elevate_online_exam/domain/models/exam_questions/answer.dart';
import 'package:elevate_online_exam/domain/models/exam_questions/exam_questions.dart';
import 'package:elevate_online_exam/domain/models/exam_questions/question.dart';

class ExamQuestionsDto {
  List<QuestionResponse>? questions;

  ExamQuestionsDto({this.questions});

  ExamQuestions toExamQuestions() {
    String? examId = questions?[0].exam?.id;
    String? subjectId = questions?[0].subject?.id;
    int? duration = questions?[0].exam?.duration;
    int? numberOfQuestions = questions?[0].exam?.numberOfQuestions;
    String? title = questions?[0].exam?.title;
    bool? active = questions?[0].exam?.active;
    List<Question>? modelQuestions = questions
        ?.map(
          (e) => Question(
              answers: e.answers
                  ?.map(
                    (e) => Answer(answer: e.answer, key: e.key),
                  )
                  .toList(),
              correct: e.correct,
              createdAt: e.createdAt,
              id: e.id,
              question: e.question,
              type: e.type),
        )
        .toList();
    return ExamQuestions(
        active: active,
        duration: duration,
        examId: examId,
        numberOfQuestions: numberOfQuestions,
        questions: modelQuestions,
        subjectId: subjectId,
        title: title);
  }
}
