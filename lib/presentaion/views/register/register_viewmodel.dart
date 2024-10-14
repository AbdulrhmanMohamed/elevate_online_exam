import 'package:elevate_online_exam/common/api_result.dart';
import 'package:elevate_online_exam/domain/models/user.dart';
import 'package:elevate_online_exam/domain/usecases/authentication/register_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterViewmodel extends Cubit<RegisterState> {
  RegisterUsecase registerUsecase;

  RegisterViewmodel(this.registerUsecase) : super(InitialState());
  void doIntent(RegisterScreenIntent intent) {
    switch (intent) {
      case RegisterIntent():
        _register(intent);
    }
  }

  void _register(RegisterIntent intent) async {
    emit(LoadingState());

    var result = await registerUsecase.invoke(
        intent.username,
        intent.firstname,
        intent.lastname,
        intent.email,
        intent.password,
        intent.confirmPassword,
        intent.phonenumber);
    switch (result) {
      case Success<User?>():
        {
          emit(SuccessState(result.data));
        }
      case Fail<User?>():
        {
          emit(ErrorState(result.exception));
        }
    }
  }
}

sealed class RegisterScreenIntent {}

class RegisterIntent extends RegisterScreenIntent {
  String username;
  String firstname;
  String lastname;
  String email;
  String password;
  String confirmPassword;
  String phonenumber;
  RegisterIntent(this.username, this.firstname, this.lastname, this.email,
      this.password, this.confirmPassword, this.phonenumber);
}

sealed class RegisterState {}

class InitialState extends RegisterState {}

class LoadingState extends RegisterState {}

class ErrorState extends RegisterState {
  Exception? exception;
  ErrorState(this.exception);
}

class SuccessState extends RegisterState {
  User? user;
  SuccessState(this.user);
}
