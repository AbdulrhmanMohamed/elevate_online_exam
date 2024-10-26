import 'dart:developer';

import 'package:elevate_online_exam/presentaion/helper/strings_manager.dart';
import 'package:elevate_online_exam/presentaion/views/login/login_validator/login_vlidator_enum.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginValidator {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  GlobalKey<FormState> get formKey => _formKey;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;

  static String? validate(String? value, String type) {
    log("============,$value====$type");
    switch (type) {
      case StringsManager.email:
        return _validateEmail(value);

      case StringsManager.password:
        return _validatePassword(value);
      default:
        return null;
    }
  }

  static String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return _reportValidationState(ValidationState.emptyEmail);
    } else if (!value.contains("@")) {
      return _reportValidationState(ValidationState.notValidEmail);
    }
    return null;
  }

  static String? _validatePassword(String? password) {
    final RegExp passwordRegExp = RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$');
    if (password == null || password.isEmpty) {
      return _reportValidationState(ValidationState.emptyPassword);
    } else if (!passwordRegExp.hasMatch(password)) {
      return _reportValidationState(ValidationState.notMatchPattern);
    }
    return null;
  }

  static String? _reportValidationState(ValidationState state) {
    switch (state) {
      case ValidationState.emptyEmail:
        return StringsManager.issueEmptyEamil;

      case ValidationState.emptyPassword:
        return StringsManager.issueEmptyPassword;

      case ValidationState.notMatchPattern:
        return StringsManager.issuePasswordPattern;

      case ValidationState.notValidEmail:
        return StringsManager.issueValidEmail;

      default:
        return null;
    }
  }
}
