import 'package:elevate_online_exam/domain/models/exam.dart';

class ExamDto {
  final String? id;
  final String? title;
  final num? duration;
  final String? subject;
  final int? numberOfQuestions;

  ExamDto(
      {this.id,
      this.title,
      this.duration,
      this.subject,
      this.numberOfQuestions});

  factory ExamDto.fromJson(Map<String, dynamic> json) => ExamDto(
        id: json['_id'],
        title: json['title'],
        duration: json['duration'],
        subject: json['subject'],
        numberOfQuestions: json['numberOfQuestions'],
      );

  Exam toExam() {
    return Exam(
        id: id,
        subject: subject,
        duration: duration,
        numberOfQuestions: numberOfQuestions,
        title: title);
  }
}
