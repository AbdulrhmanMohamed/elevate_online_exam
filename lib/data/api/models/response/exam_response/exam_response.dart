class ExamResponse {
 final String? message;
 final List<ExamData> ?exams;
 ExamResponse({this.exams,this.message});

 factory ExamResponse.fromJson(Map<String,dynamic>json)=>ExamResponse(
    message: json['message'],
    exams: (json['exams'] as List<dynamic>).map((exam)=> ExamData.fromJson(exam)).toList(),
 );
}

class ExamData {
  final String? id;
  final String? title;
  final num? duration;
  final String? subject;
  final int? numberOfQuestions;

  ExamData(
      {this.id, this.title, this.duration, this.subject, this.numberOfQuestions});

  factory ExamData.fromJson(Map<String, dynamic> json) => ExamData(
        id: json['_id'] as String?,
        title: json['title'] as String?,
        duration: json['duration'] as num?,
        subject: json['subject']as String?,
        numberOfQuestions: json['numberOfQuestions'] as int?,
      );
  
  
}
