import 'package:elevate_online_exam/presentaion/helper/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Buttons extends StatelessWidget {
  final Function() showResults;
  final Function() startAgain;
  const Buttons(
      {super.key, required this.showResults, required this.startAgain});
  Widget button(dynamic backgroundColor, dynamic foregroundColor, String text,
      dynamic onPress, dynamic borderColor) {
    return SizedBox(
      width: double.infinity,
      height: AppSizes.s48,
      child: ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
            side: borderColor != null
                ? BorderSide(color: borderColor, width: 1)
                : null,
            backgroundColor: backgroundColor,
            foregroundColor: foregroundColor),
        child: Text(text),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        button(
            Colors.blue[900], Colors.white, 'Show results', showResults, null),
        SizedBox(
          height: AppSizes.s16.h,
        ),
        button(Colors.white, Colors.blue[900], "Start again", startAgain,
            Colors.blue[900])
      ],
    );
  }
}
