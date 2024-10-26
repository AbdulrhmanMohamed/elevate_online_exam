import 'package:elevate_online_exam/presentaion/views/forget_password/forget_password_screen.dart';
import 'package:elevate_online_exam/presentaion/views/home/home_screen.dart';
import 'package:elevate_online_exam/presentaion/views/login/login_screen.dart';
import 'package:elevate_online_exam/presentaion/views/register/register_screen.dart';
import 'package:elevate_online_exam/presentaion/views/subject/subject_screen.dart';
import 'package:flutter/material.dart';

Route manageRoute(RouteSettings settings) {
  switch (settings.name) {
    case "login":
      return MaterialPageRoute(builder: (context) => LoginScreen());
    case "register":
      return MaterialPageRoute(builder: (context) => const RegisterScreen());
    case "forgetPassword":
      return MaterialPageRoute(builder: (context) => ForgetPasswordScreen());
    case "subject":
      return MaterialPageRoute(builder: (context) =>  SubjectScreen());
    case "home":
      return MaterialPageRoute(builder: (context) =>  HomeScreen());
    default:
      return MaterialPageRoute(builder: (context) => notFound());
  }
}

Widget notFound() {
  return const Scaffold(
    body: Center(
      child: Text("NO Route Found"),
    ),
  );
}

class AppRoutes {
  static const login = 'login';
  static const register = 'register';
  static const forgetPassword = 'forgetPassword';
  static const home = "home";
  static const subject = "subject";
}
