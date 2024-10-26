import 'package:elevate_online_exam/common/api_result.dart';
import 'package:elevate_online_exam/domain/models/user.dart';
import 'package:elevate_online_exam/domain/usecases/authentication/register_usecase.dart';
import 'package:elevate_online_exam/presentaion/views/register/register_validator/register_field_type_enum.dart';
import 'package:elevate_online_exam/presentaion/views/register/register_validator/register_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterViewmodel extends Cubit<RegisterState> {
  RegisterUsecase registerUsecase;
  RegisterValidator registerValidator;
  RegisterViewmodel(this.registerUsecase, this.registerValidator)
      : super(InitialState());
  void doIntent(RegisterScreenIntent intent) {
    switch (intent) {
      case RegisterIntent():
        _register(intent);
    }
  }

  GlobalKey<FormState> formKey() {
    return registerValidator.formKey;
  }

  TextEditingController fieldController(RegisterFormFieldType type) {
    switch (type) {
      case RegisterFormFieldType.username:
        return registerValidator.usernameController;
      case RegisterFormFieldType.firstname:
        return registerValidator.firstnameController;
      case RegisterFormFieldType.lastname:
        return registerValidator.lastnameController;
      case RegisterFormFieldType.email:
        return registerValidator.emailController;
      case RegisterFormFieldType.password:
        return registerValidator.passwordController;
      case RegisterFormFieldType.confirmPassword:
        return registerValidator.confirmPasswordController;
      case RegisterFormFieldType.phone:
        return registerValidator.phoneNumberController;
    }
  }

  FormFieldValidator<String?> validateField(RegisterFormFieldType type) {
    return registerValidator.validate(type);
  }

  void _register(RegisterIntent intent) async {
    emit(LoadingState());
    User? user = registerValidator.validateForm();
    if (user == null) {
      emit(InitialState());
      return;
    }

    var result = await registerUsecase.invoke(
        user.username!,
        user.firstName!,
        user.lastName!,
        user.email!,
        user.password!,
        user.rePassword!,
        user.phone!);
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
  RegisterIntent();
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
