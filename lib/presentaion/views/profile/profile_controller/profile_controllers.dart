import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
@injectable
class ProfileControllers {

TextEditingController _usernameController=TextEditingController();
TextEditingController _firstNameController=TextEditingController();
TextEditingController _lastNameController=TextEditingController();
TextEditingController _emailController=TextEditingController();
TextEditingController _phoneController=TextEditingController();
TextEditingController _passwordController=TextEditingController();


TextEditingController get usernameController=>_usernameController;
TextEditingController get firstNameController=>_firstNameController;
TextEditingController get lastNameController=>_lastNameController;
TextEditingController get emailController=>_emailController;
TextEditingController get phoneController=>_phoneController;
TextEditingController get passwordController=>_passwordController;

}