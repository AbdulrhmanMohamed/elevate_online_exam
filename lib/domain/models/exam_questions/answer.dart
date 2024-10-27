class Answer {
  String? key;
  String? answer;
  Answer({this.answer, this.key});

  factory Answer.fromJson(Map<String, dynamic> json) => Answer(
        key: json['key'],
        answer: json['answer'],
      );

  Map<String, dynamic> toJson() => {'key': key, 'answer': answer};
}
