import 'package:elevate_online_exam/domain/models/user.dart';
import 'package:elevate_online_exam/presentaion/helper/strings_manager.dart';
import 'package:elevate_online_exam/presentaion/views/register/register_validator/register_field_type_enum.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterValidator {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  TextEditingController get usernameController => _usernameController;
  TextEditingController get firstnameController => _firstnameController;
  TextEditingController get lastnameController => _lastnameController;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get confirmPasswordController =>
      _confirmPasswordController;
  TextEditingController get phoneNumberController => _phoneNumberController;
  GlobalKey<FormState> get formKey => _formKey;

  String? Function(String?) validate(RegisterFormFieldType type) {
    switch (type) {
      case RegisterFormFieldType.username:
        return _validateUserName();
      case RegisterFormFieldType.firstname:
        return _validateFirstName();
      case RegisterFormFieldType.lastname:
        return _validateLastName();
      case RegisterFormFieldType.email:
        return _validateEmail();
      case RegisterFormFieldType.password:
        return _validatePassword();
      case RegisterFormFieldType.confirmPassword:
        return _validateConfirmPassword();
      case RegisterFormFieldType.phone:
        return _validatePhone();
      default:
        return (String? value) {
          return null;
        };
    }
  }

  User? validateForm() {
    if (_formKey.currentState!.validate()) {
      return User(
          username: _usernameController.text,
          firstName: _firstnameController.text,
          lastName: _lastnameController.text,
          email: _emailController.text,
          password: _passwordController.text,
          rePassword: _confirmPasswordController.text,
          phone: _phoneNumberController.text);
    }
    return null;
  }

  String? Function(String?) _validateUserName() {
    return (String? value) {
      if (value == null || value.isEmpty) {
        return StringsManager.issueEmptyUsername;
      }
      return null;
    };
  }

  String? Function(String?) _validateFirstName() {
    return (String? value) {
      if (value == null || value.isEmpty) {
        return StringsManager.issueEmptyFirstname;
      }
      return null;
    };
  }

  String? Function(String?) _validateLastName() {
    return (String? value) {
      if (value == null || value.isEmpty) {
        return StringsManager.issueEmptyLastname;
      }
      return null;
    };
  }

  String? Function(String?) _validateEmail() {
    return (String? value) {
      if (value != null && (value.isEmpty || !value.contains("@"))) {
        return StringsManager.issueValidEmail;
      }
      return null;
    };
  }

  String? Function(String?) _validatePassword() {
    return (String? value) {
      final RegExp passwordRegExp = RegExp(
          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$');
      if (value == null || value.isEmpty) {
        return StringsManager.issueEmptyPassword;
      } else if (!passwordRegExp.hasMatch(value)) {
        return StringsManager.issuePasswordPattern;
      }
      return null;
    };
  }

  String? Function(String?) _validateConfirmPassword() {
    return (String? value) {
      if (value == null || value.isEmpty) {
        return StringsManager.issueEmptyPassword;
      }
      if (_passwordController.text != value) {
        return StringsManager.issuePasswordNotMatch;
      }
      return null;
    };
  }

  String? Function(String?) _validatePhone() {
    return (String? value) {
      final RegExp phoneRegExp = RegExp(r'^01[0125][0-9]{8}$');
      if (value == null || value.isEmpty) {
        return StringsManager.issueEmptyPhoneNumber;
      } else if (!phoneRegExp.hasMatch(value)) {
        return StringsManager.issueInvalidPhoneNumber;
      }
      return null;
    };
  }
}
