class SubjectResponse {
  final String? message;
  final List<SubjectData>? subjects;

  SubjectResponse({this.message, this.subjects});

  factory SubjectResponse.fromJson(Map<String, dynamic> json) {
    return SubjectResponse(
      message: json['message'],
      subjects: (json['subjects'] as List<dynamic>)
          .map((element) => SubjectData.fromJson(element))
          .toList(),
    );
  }
  Map<String, dynamic> toJson(SubjectResponse response) {
    return {"message": response.message, "subjects": response.subjects};
  }
}

class SubjectData {
  String? id;
  String? name;
  String? icon;

  SubjectData({this.id, this.name, this.icon});

  factory SubjectData.fromJson(Map<String, dynamic> json) => SubjectData(
        id: json['_id'] as String?,
        name: json['name'] as String?,
        icon: json['icon'] as String?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
        'icon': icon,
      };
}
