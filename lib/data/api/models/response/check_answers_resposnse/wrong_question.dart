import 'answers.dart';

class WrongQuestion {
  String? qid;
  String? question;
  String? inCorrectAnswer;
  String? correctAnswer;
  Answers? answers;

  WrongQuestion({
    this.qid,
    this.question,
    this.inCorrectAnswer,
    this.correctAnswer,
    this.answers,
  });

  factory WrongQuestion.fromJson(Map<String, dynamic> json) => WrongQuestion(
      qid: json['QID'] as String?,
      question: json['Question'] as String?,
      inCorrectAnswer: json['inCorrectAnswer'] as String?,
      correctAnswer: json['correctAnswer'] as String?,
      answers: null);

  Map<String, dynamic> toJson() => {
        'QID': qid,
        'Question': question,
        'inCorrectAnswer': inCorrectAnswer,
        'correctAnswer': correctAnswer,
        'answers': answers?.toJson(),
      };
}
