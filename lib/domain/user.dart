import 'package:json_annotation/json_annotation.dart';
import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 0) // Ensure you use a unique type ID for each model
@JsonSerializable()
class User {
  @HiveField(0)
  final String? username;

  @HiveField(1)
  final String? firstName;

  @HiveField(2)
  final String? lastName;

  @HiveField(3)
  final String? email;

  @HiveField(4)
  final String? password;

  @HiveField(5)
  final String? repassword;

  @HiveField(6)
  final String? phone;

  @HiveField(7)
  final String ? token;

  User(this.firstName, this.username, this.lastName, this.email, this.password,
      this.repassword, this.phone,this.token);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
