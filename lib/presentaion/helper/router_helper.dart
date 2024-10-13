import 'package:basic_layout/presentaion/screens/login/login_screen.dart';
import 'package:basic_layout/presentaion/screens/register/register_screen.dart';
import "package:basic_layout/presentaion/screens/forget_password/forget_password_screen.dart";
import 'package:flutter/material.dart';

Route manageRoute(RouteSettings settings) {
  switch (settings.name) {
    case "login":
      return MaterialPageRoute(builder: (context) => LoginScreen());
    case "register":
      return MaterialPageRoute(builder: (context) => RegisterScreen());
    case "forgetPassword":
      return MaterialPageRoute(builder: (context) => ForgetPasswordScreen());
    default:
      return MaterialPageRoute(builder: (context)=> NotFound());
  }
}

Widget NotFound() {
  return Scaffold(
   
    body: Center(child: Text("NO Route Found"),),
  );
}
