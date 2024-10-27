import 'question.dart';

class ExamQuestions {
  String? subjectId;
  String? examId;
  String? title;
  int? duration;
  int? numberOfQuestions;
  bool? active;
  List<Question>? questions;

  ExamQuestions({
    this.subjectId,
    this.examId,
    this.title,
    this.duration,
    this.numberOfQuestions,
    this.active,
    this.questions,
  });

  factory ExamQuestions.fromJson(Map<String, dynamic> json) => ExamQuestions(
        subjectId: json['subjectId'] as String?,
        examId: json['examId'] as String?,
        title: json['title'] as String?,
        duration: json['duration'] as int?,
        numberOfQuestions: json['numberOfQuestions'] as int?,
        active: json['active'] as bool?,
        questions: (json['questions'] as List<dynamic>?)
            ?.map((e) => Question.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'subjectId': subjectId,
        'examId': examId,
        'title': title,
        'duration': duration,
        'numberOfQuestions': numberOfQuestions,
        'active': active,
        'questions': questions?.map((e) => e.toJson()).toList(),
      };
}
