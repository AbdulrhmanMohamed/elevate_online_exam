import 'package:elevate_online_exam/presentaion/views/exam_score.dart/exam_score_screen.dart';
import 'package:elevate_online_exam/presentaion/views/exam_score.dart/exam_score_screen_data.dart';
import 'package:elevate_online_exam/presentaion/views/exams/exams_screen.dart';
import 'package:elevate_online_exam/presentaion/views/exams/exams_screen_data.dart';
import 'package:elevate_online_exam/presentaion/views/forget_password/forget_password_screen.dart';
import 'package:elevate_online_exam/presentaion/views/home/home_screen.dart';
import 'package:elevate_online_exam/presentaion/views/login/login_screen.dart';
import 'package:elevate_online_exam/presentaion/views/questions/exam_questions_screen_data.dart';
import 'package:elevate_online_exam/presentaion/views/questions/questions_screen.dart';
import 'package:elevate_online_exam/presentaion/views/register/register_screen.dart';
import 'package:elevate_online_exam/presentaion/views/subject/subject_screen.dart';
import 'package:flutter/material.dart';

Route manageRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.login:
      return MaterialPageRoute(builder: (context) => LoginScreen());
    case AppRoutes.register:
      return MaterialPageRoute(builder: (context) => const RegisterScreen());
    case AppRoutes.forgetPassword:
      return MaterialPageRoute(builder: (context) => ForgetPasswordScreen());
    case AppRoutes.questions:
      return MaterialPageRoute(builder: (context) {
        final args = (settings.arguments as Map);
        return QuestionsScreen(
          examQuestionsScreenData: ExamQuestionsScreenData(
              examDuration: args['examDuration'], examId: args['examId']),
        );
      });
    case AppRoutes.subject:
      return MaterialPageRoute(builder: (context) => SubjectScreen());
    case AppRoutes.exams:
      return MaterialPageRoute(
          builder: (context) => ExamsScreen(
                args: ExamsScreenData(
                    subjectId:
                        (settings.arguments as Map)['subjectId']!.toString(),
                    subjectName: (settings.arguments as Map)["subjectName"]),
              ));
    case AppRoutes.home:
      return MaterialPageRoute(
          builder: (context) => HomeScreen(
                navName: (settings.arguments as Map?)?['navName'],
              ));
    case AppRoutes.examScore:
      return MaterialPageRoute(
        builder: (context) => ExamScoreScreen(
          examScoreScreenData: ExamScoreScreenData(
              answers: (settings.arguments as Map)['answers'],
              examDuration: (settings.arguments as Map)['examDuration'],
              examId: (settings.arguments as Map)['examId']),
        ),
      );
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
  static const questions = "questions";
  static const exams = "exams";
  static const examScore = "examScore";
}
