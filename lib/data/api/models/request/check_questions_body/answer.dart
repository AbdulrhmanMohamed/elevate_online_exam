class Answer {
  String? questionId;
  String? correct;

  Answer({this.questionId, this.correct});

  factory Answer.fromJson(Map<String, dynamic> json) => Answer(
        questionId: json['questionId'] as String?,
        correct: json['correct'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'questionId': questionId,
        'correct': correct,
      };
}
