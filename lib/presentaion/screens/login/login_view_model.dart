import 'package:basic_layout/data/api/api_result.dart';
import 'package:basic_layout/domain/usecases/auth/login_usecase.dart';
import 'package:basic_layout/domain/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginViewModel extends Cubit<LoginState> {
  LoginUsecase _loginUsecase;
  LoginViewModel(this._loginUsecase) : super(LoginInitialState());
  static LoginViewModel get(context) => BlocProvider.of(context);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailContorller = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void emitLoginState(email, password) async {
    emit(LoginLoadingState());
    if( this.formKey.currentState!.validate()){
    var result = await _loginUsecase.invoke(email, password);
    switch (result) {
      case Success<User?>():
        emit(LoginSuccessState(result.data));
      // TODO: Handle this case.
      case Fail<User?>():
        emit(LoginFailureState(result.exception));
      // TODO: Handle this case.
    }
    }
  }
}

sealed class LoginState {}

class LoginInitialState implements LoginState {}

class LoginLoadingState implements LoginState {}

class LoginSuccessState implements LoginState {
  User? user;
  LoginSuccessState(this.user);
}

class LoginFailureState implements LoginState {
  String? message;
  LoginFailureState(this.message);
}
