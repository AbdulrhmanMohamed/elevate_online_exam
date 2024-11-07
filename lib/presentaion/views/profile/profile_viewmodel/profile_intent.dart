import 'package:elevate_online_exam/data/api/models/request/auth_body.dart';

sealed class ProfileIntent {}

class GetUserProfileIntent extends ProfileIntent{}
class EditUserProfileIntent extends ProfileIntent{
 final AuthBody? body;
 EditUserProfileIntent(this.body);
}

