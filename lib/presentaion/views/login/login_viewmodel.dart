// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:elevate_online_exam/common/api_result.dart';
import 'package:elevate_online_exam/domain/models/user.dart';
import 'package:elevate_online_exam/domain/usecases/authentication/login_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginViewModel extends Cubit<LoginState> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  LoginUsecase _loginUsecase;
  LoginViewModel(this._loginUsecase) : super(LoginInitialState());

  doIntent(LoginInent intent) {
    switch (intent) {
      case LoginWithEmailAndPasswordIntent():
        loginWithEmailAndPassowrd(intent);
        break;
      // TODO: Handle this case.
    }
  }

  void loginWithEmailAndPassowrd(LoginWithEmailAndPasswordIntent intent) async {
    if (formKey.currentState!.validate()) {
      emit(LoginLoadingState());
      var result =
          await _loginUsecase.invoke(intent.email, intent.password);
      switch (result) {
        case Success<User?>():
          emit(LoginSuccessState(result.data));
        // TODO: Handle this case.
        case Fail<User?>():
          emit(LoginErrorState(result.exception));
        // TODO: Handle this case.
      }
    }
  }
}

/////////////////////////////////////////////////////////
///States and Entents
sealed class LoginState {}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  final User? user;
  LoginSuccessState(this.user);
}

class LoginErrorState extends LoginState {
  Exception? exception;
  LoginErrorState(this.exception);
}

sealed class LoginInent {}

class LoginWithEmailAndPasswordIntent extends LoginInent {
  String email;
  String password;
  LoginWithEmailAndPasswordIntent({
    required this.email,
    required this.password,
  });
}
