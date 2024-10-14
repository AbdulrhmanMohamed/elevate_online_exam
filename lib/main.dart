import 'package:elevate_online_exam/common/bloc_observer.dart';
import 'package:elevate_online_exam/di/di.dart';
import 'package:elevate_online_exam/presentaion/helper/app_theme.dart';
import 'package:elevate_online_exam/presentaion/helper/router_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const OnlineExam());
  configureDependencies();
  Bloc.observer=SimpleBlocObserver();
}

class OnlineExam extends StatelessWidget {
  const OnlineExam({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
      theme: appTheme(),
      onGenerateRoute:manageRoute,
      initialRoute: 'login',
    );
  }
}
