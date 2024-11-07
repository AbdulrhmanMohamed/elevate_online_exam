import 'package:elevate_online_exam/domain/models/subject.dart';

class SubjectDto {
  String? id;
  String? name;
  String? icon;

  SubjectDto({this.id, this.name, this.icon});

  factory SubjectDto.fromJson(Map<String, dynamic> json) => SubjectDto(
        id: json['_id'] as String?,
        name: json['name'] as String?,
        icon: json['icon'] as String?,
      );

  Subject toSubject() => Subject(id: id, icon: icon, name: name);
}
