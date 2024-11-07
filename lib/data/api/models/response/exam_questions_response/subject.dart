class SubjectResponse {
  String? id;
  String? name;
  String? icon;
  DateTime? createdAt;

  SubjectResponse({this.id, this.name, this.icon, this.createdAt});

  factory SubjectResponse.fromJson(Map<String, dynamic> json) =>
      SubjectResponse(
        id: json['_id'] as String?,
        name: json['name'] as String?,
        icon: json['icon'] as String?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
        'icon': icon,
        'createdAt': createdAt?.toIso8601String(),
      };
}
