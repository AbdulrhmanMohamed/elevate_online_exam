import 'package:elevate_online_exam/presentaion/views/forget_password/forget_password_screen.dart';
import 'package:elevate_online_exam/presentaion/views/home/home_screen.dart';
import 'package:elevate_online_exam/presentaion/views/login/login_screen.dart';
import 'package:elevate_online_exam/presentaion/views/register/register_screen.dart';
import 'package:flutter/material.dart';

Route manageRoute(RouteSettings settings) {
  switch (settings.name) {
    case "login":
      return MaterialPageRoute(builder: (context) => LoginScreen());
    case "register":
      return MaterialPageRoute(builder: (context) => const RegisterScreen());
    case "forgetPassword":
      return MaterialPageRoute(builder: (context) => ForgetPasswordScreen());
    case "home":
      return MaterialPageRoute(builder: (context) => const HomeScreen());
    default:
      return MaterialPageRoute(builder: (context) => NotFound());
  }
}

Widget NotFound() {
  return Scaffold(
    body: Center(
      child: Text("NO Route Found"),
    ),
  );
}
