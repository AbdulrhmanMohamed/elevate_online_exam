// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:elevate_online_exam/data/api/models/response/auth_response/auth_response/user.dart';

class LoginViewmodel  extends Cubit{}



sealed class LoginState{}

class InitialLoginState extends LoginState{}
class LoadingLoginState extends LoginState{}
class SuccessLoadingState extends LoginState {
 final User user;
  SuccessLoadingState(this.user);
}
class FailureLoginState extends LoginState{
final  Exception exception;

  FailureLoginState(this.exception);

}
