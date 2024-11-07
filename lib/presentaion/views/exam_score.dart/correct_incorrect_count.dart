import 'package:elevate_online_exam/presentaion/helper/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CorrectIncorrectCount extends StatelessWidget {
  final int correctCount;
  final int incorrectCount;
  const CorrectIncorrectCount(
      {super.key, required this.correctCount, required this.incorrectCount});

  Widget label(String text, dynamic color) {
    return Text(text,
        style: TextStyle(
            color: color,
            fontSize: AppSizes.s20.sp,
            fontWeight: FontWeight.w500));
  }

  Widget circularContainer(int count, dynamic color) {
    return Container(
      width: 25,
      height: 25,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: color, width: 1),
      ),
      alignment: Alignment.center,
      child: Text(
        count.toString(),
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 13.sp, color: color, fontWeight: FontWeight.w500),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            label('Correct', Colors.blue[900]),
            SizedBox(
              width: 83.w,
            ),
            circularContainer(correctCount, Colors.blue[900])
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            label('Incorrect', Colors.red),
            SizedBox(
              width: 70.w,
            ),
            circularContainer(incorrectCount, Colors.red)
          ],
        ),
      ],
    );
  }
}
