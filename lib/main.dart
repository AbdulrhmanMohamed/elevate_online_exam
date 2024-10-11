import 'package:elevate_online_exam/di/di.dart';
import 'package:elevate_online_exam/presentaion/views/login_screen.dart';
import 'package:flutter/material.dart';

void main(){


  runApp(const OnlineExam());
  configureDependencies();
}


class OnlineExam extends StatelessWidget {
  const OnlineExam({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
    
      home: LoginScreen(),
    );
  }
}