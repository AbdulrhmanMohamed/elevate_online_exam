class Subject {
  String? id;
  String? name;
  String? icon;

  Subject({this.id, this.name, this.icon});

  factory Subject.fromJson(Map<String, dynamic> json) => Subject(
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
