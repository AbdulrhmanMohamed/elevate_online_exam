import 'answer.dart';

class CheckQuestionsBody {
  List<Answer>? answers;

  CheckQuestionsBody({this.answers});

  factory CheckQuestionsBody.fromJson(Map<String, dynamic> json) {
    return CheckQuestionsBody(
      answers: (json['answers'] as List<dynamic>?)
          ?.map((e) => Answer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'answers': answers?.map((e) => e.toJson()).toList(),
      };
}
