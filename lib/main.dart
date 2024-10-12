import 'package:elevate_online_exam/di/di.dart';
import 'package:elevate_online_exam/presentaion/views/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const OnlineExam());
  configureDependencies();
}

class OnlineExam extends StatelessWidget {
  const OnlineExam({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        inputDecorationTheme: const InputDecorationTheme(
            hintStyle: TextStyle(fontWeight: FontWeight.w300),
            labelStyle: TextStyle(color: Colors.black),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
            border: OutlineInputBorder(borderRadius: BorderRadius.zero)),
      ),
      home: LoginScreen(),
    );
  }
}
