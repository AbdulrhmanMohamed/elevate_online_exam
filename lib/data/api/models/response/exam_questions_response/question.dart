import 'answer.dart';
import 'exam.dart';
import 'subject.dart';

class QuestionResponse {
  List<AnswerResponse>? answers;
  String? type;
  String? id;
  String? question;
  String? correct;
  SubjectResponse? subject;
  ExamResponse? exam;
  DateTime? createdAt;

  QuestionResponse({
    this.answers,
    this.type,
    this.id,
    this.question,
    this.correct,
    this.subject,
    this.exam,
    this.createdAt,
  });

  factory QuestionResponse.fromJson(Map<String, dynamic> json) =>
      QuestionResponse(
        answers: (json['answers'] as List<dynamic>?)
            ?.map((e) => AnswerResponse.fromJson(e as Map<String, dynamic>))
            .toList(),
        type: json['type'] as String?,
        id: json['_id'] as String?,
        question: json['question'] as String?,
        correct: json['correct'] as String?,
        subject: json['subject'] == null
            ? null
            : SubjectResponse.fromJson(json['subject'] as Map<String, dynamic>),
        exam: json['exam'] == null
            ? null
            : ExamResponse.fromJson(json['exam'] as Map<String, dynamic>),
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
      );

  Map<String, dynamic> toJson() => {
        'answers': answers?.map((e) => e.toJson()).toList(),
        'type': type,
        '_id': id,
        'question': question,
        'correct': correct,
        'subject': subject?.toJson(),
        'exam': exam?.toJson(),
        'createdAt': createdAt?.toIso8601String(),
      };
}
