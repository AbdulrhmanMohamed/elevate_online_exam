import 'dart:developer';

import 'package:elevate_online_exam/domain/models/exam.dart';
import 'package:elevate_online_exam/presentaion/helper/spacing.dart';
import 'package:elevate_online_exam/presentaion/helper/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:elevate_online_exam/presentaion/helper/color_consts.dart';
import 'package:elevate_online_exam/presentaion/helper/app_sizes.dart';

class ExamItem extends StatelessWidget {
final Exam ? exam;

  const ExamItem({
    super.key,
    this.exam
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: 100.h,
      decoration: BoxDecoration(
          color: AppColor.lightGray,
          border: Border.all(width: 1.w, color: AppColor.decorationShadow),
          borderRadius: BorderRadius.circular(AppSizes.s10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: AppSizes.s10, horizontal: AppSizes.s25),
        child: Row(
          children: [
             Image(
              image:const AssetImage('assets/images/exam.png'),
              height: 100.h,
            ),
            horizontal_space(AppSizes.s10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                   exam!.title?? "ExamTitle",
                    style: Styles.get_bold(AppSizes.s20, AppColor.black),
                  ),
                  Text(
                  "${exam?.numberOfQuestions} Questions" ,
                    style: Styles.get_regular(AppSizes.s18, AppColor.gray_30),
                  ),
                  // vertical_space(AppSizes.s30),
                ],
              ),
            ),
            Align(
          alignment: Alignment.topRight,
                child: Text(
            exam?.duration.toString() ??  "Hello",
              style: Styles.get_regular(AppSizes.s20, AppColor.darkBlue),
              textAlign: TextAlign.end,
            ))
          ],
        ),
      ),
    );
  }
}
