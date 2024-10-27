class AnswerResponse {
  String? key;
  String? answer;
  AnswerResponse({this.answer, this.key});

  factory AnswerResponse.fromJson(Map<String, dynamic> json) => AnswerResponse(
        key: json['key'],
        answer: json['answer'],
      );

  Map<String, dynamic> toJson() => {'key': key, 'answer': answer};
}
