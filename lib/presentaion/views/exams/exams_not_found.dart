import 'package:elevate_online_exam/presentaion/helper/app_sizes.dart';
import 'package:elevate_online_exam/presentaion/helper/color_consts.dart';
import 'package:elevate_online_exam/presentaion/helper/text_styles.dart';
import 'package:flutter/material.dart';

class ExamsNotFound extends StatelessWidget {
  const ExamsNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Exams Not Found",
        style: Styles.get_bold(AppSizes.s25, AppColor.red),
      ),
    );
  }
}
