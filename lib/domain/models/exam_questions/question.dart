import 'answer.dart';

class Question {
  List<Answer>? answers;
  String? type;
  String? id;
  String? question;
  String? correct;
  DateTime? createdAt;

  Question({
    this.answers,
    this.type,
    this.id,
    this.question,
    this.correct,
    this.createdAt,
  });

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        answers: (json['answers'] as List<dynamic>?)
            ?.map((e) => Answer.fromJson(e as Map<String, dynamic>))
            .toList(),
        type: json['type'] as String?,
        id: json['_id'] as String?,
        question: json['question'] as String?,
        correct: json['correct'] as String?,
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
        'createdAt': createdAt?.toIso8601String(),
      };
}
