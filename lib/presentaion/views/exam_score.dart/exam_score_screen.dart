import 'package:elevate_online_exam/di/di.dart';
import 'package:elevate_online_exam/presentaion/helper/app_sizes.dart';
import 'package:elevate_online_exam/presentaion/helper/router_helper.dart';
import 'package:elevate_online_exam/presentaion/utils.dart';
import 'package:elevate_online_exam/presentaion/views/exam_score.dart/buttons.dart';
import 'package:elevate_online_exam/presentaion/views/exam_score.dart/circular_indicator_painter.dart';
import 'package:elevate_online_exam/presentaion/views/exam_score.dart/correct_incorrect_count.dart';
import 'package:elevate_online_exam/presentaion/views/exam_score.dart/exam_score_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class ExamScoreScreen extends StatelessWidget {
  final Map<String, String> answers;
  ExamScoreScreen({super.key, required this.answers});

  ExamScoreViewmodel viewmodel = getIt.get<ExamScoreViewmodel>();
  @override
  Widget build(BuildContext context) {
    _getExamScore();
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushNamedAndRemoveUntil(
          context,
          AppRoutes.home,
          (Route<dynamic> route) => false,
        );
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
            title: const Text(
          'Exam score',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        )),
        body: BlocProvider(
          create: (context) => viewmodel,
          child: BlocBuilder<ExamScoreViewmodel, ExamScoreState>(
            builder: (context, state) {
              if (state is LoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state is SuccessState) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Your score',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: AppSizes.s20.h,
                      ),
                      Row(
                        children: [
                          CustomPaint(
                            painter: CircularIndicatorPainter(
                                progress: state.percent),
                            child: SizedBox(
                              width: 132,
                              height: 132,
                              child: Center(
                                child: Text(
                                  "${state.examScore!.total}",
                                  style: const TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 40.w,
                          ),
                          CorrectIncorrectCount(
                              correctCount: state.examScore!.correct!,
                              incorrectCount: state.examScore!.wrong!),
                        ],
                      ),
                      SizedBox(
                        height: 80.h,
                      ),
                      Buttons(
                        showResults: () {},
                        startAgain: () {},
                      )
                    ],
                  ),
                );
              }

              if (state is ErrorState) {
                return Center(
                  child: Text(extractErrorMessage(state.exception)),
                );
              }

              return const Center(
                child: Text(
                  'Error',
                  style: TextStyle(color: Colors.red),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _getExamScore() {
    viewmodel.doIntent(GetScoreIntent(answers));
  }
}
