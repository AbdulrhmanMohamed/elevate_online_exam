class Exam {
  final String? id;
  final String? title;
  final num? duration;
  final String? subject;
  final int? numberOfQuestions;

  Exam(
      {this.id, this.title, this.duration, this.subject, this.numberOfQuestions});

  factory Exam.fromJson(Map<String, dynamic> json) => Exam(
        id: json['_id'],
        title: json['title'],
        duration: json['duration'],
        subject: json['subject'],
        numberOfQuestions: json['numberOfQuestions'],
      );
  
  
}
