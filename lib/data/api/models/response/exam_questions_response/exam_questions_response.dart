import 'question.dart';

class ExamQuestionsResponse {
  String? message;
  List<QuestionResponse>? questions;
  String? examId;
  String? subjectId;
  ExamQuestionsResponse({this.message, this.questions});

  factory ExamQuestionsResponse.fromJson(Map<String, dynamic> json) {
    return ExamQuestionsResponse(
      message: json['message'] as String?,
      questions: (json['questions'] as List<dynamic>?)
          ?.map((e) => QuestionResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'questions': questions?.map((e) => e.toJson()).toList(),
      };
}
