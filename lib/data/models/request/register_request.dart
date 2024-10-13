
import 'package:json_annotation/json_annotation.dart';
part 'register_request.g.dart';
@JsonSerializable()
class RegisterRequest {
  final String? firstName;
  final String? username;
  final String? lastName;

  final String? email;
  final String? password;
  final String? repassword;
  final String? phone;

  RegisterRequest(this.firstName, this.username, this.lastName, this.email,
      this.password, this.repassword, this.phone);

      Map<String,dynamic> toJson()=>_$RegisterRequestToJson(this);
}
