import 'dart:developer';

import 'package:elevate_online_exam/common/bloc_observer.dart';
import 'package:elevate_online_exam/di/di.dart';
import 'package:elevate_online_exam/presentaion/helper/app_theme.dart';
import 'package:elevate_online_exam/presentaion/helper/router_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async{
WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  runApp(const OnlineExam());
  configureDependencies();
  Bloc.observer=SimpleBlocObserver();

}

class OnlineExam extends StatelessWidget {
  const OnlineExam({super.key});

  @override
  Widget build(BuildContext context) {

    return 
  
    ScreenUtilInit(
    designSize:const Size(411,707),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
        theme: appTheme(),
        onGenerateRoute:manageRoute,
        initialRoute: 'login',
      ),
    );
     }
}
