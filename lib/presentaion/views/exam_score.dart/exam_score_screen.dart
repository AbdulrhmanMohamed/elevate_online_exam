import 'package:elevate_online_exam/presentaion/helper/app_sizes.dart';
import 'package:elevate_online_exam/presentaion/views/exam_score.dart/buttons.dart';
import 'package:elevate_online_exam/presentaion/views/exam_score.dart/circular_indicator_painter.dart';
import 'package:elevate_online_exam/presentaion/views/exam_score.dart/correct_incorrect_count.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExamScoreScreen extends StatelessWidget {
  const ExamScoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text(
          'Exam score',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        )),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Your score',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: AppSizes.s20.h,
              ),
              Row(
                children: [
                  CustomPaint(
                    painter: CircularIndicatorPainter(progress: 30 / 40),
                    child: SizedBox(
                      width: 132,
                      height: 132,
                      child: Center(
                        child: Text(
                          "${(30 / 40 * 100).toStringAsFixed(0)}%",
                          style: const TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 40.w,
                  ),
                  const CorrectIncorrectCount(
                      correctCount: 30, incorrectCount: 40 - 30),
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
        ));
  }
}
