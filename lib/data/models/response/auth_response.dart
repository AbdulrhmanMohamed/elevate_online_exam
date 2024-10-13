import 'package:basic_layout/domain/user.dart';
import 'package:json_annotation/json_annotation.dart';
part 'auth_response.g.dart';

@JsonSerializable()
class AuthResponse {
  final String? token;
  @JsonKey(name: "user")
  final Userdata? userData;

  AuthResponse(this.token, this.userData);

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AuthResponseToJson(this);
}

@JsonSerializable()
class Userdata {
  final String? username;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? password;
  final String? rePassword;
  final String? phone;
  final String? token;

  factory Userdata.fromJson(Map<String, dynamic> json) =>
      _$UserdataFromJson(json);

  Userdata(
      { this.username,
       this.firstName,
       this.lastName,
       this.email,
       this.password,
       this.rePassword,
       this.phone,
       this.token});
  Map<String, dynamic> toJson() => _$UserdataToJson(this);

  User toUser(Userdata user) {
    return User(user.username, user.firstName, user.lastName, user.email,
        user.password, user.rePassword, user.phone, user.token);
  }
}
