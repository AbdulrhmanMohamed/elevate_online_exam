import 'dart:developer';

import 'package:elevate_online_exam/domain/models/subject.dart';
import 'package:elevate_online_exam/presentaion/helper/app_sizes.dart';
import 'package:elevate_online_exam/presentaion/helper/color_consts.dart';
import 'package:elevate_online_exam/presentaion/helper/spacing.dart';
import 'package:elevate_online_exam/presentaion/helper/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubjectItem extends StatelessWidget {
  final Subject subject;
  const SubjectItem({super.key, required this.subject});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        log("clicked ${subject.name}");
      },
      child: Container(
          height: 80.h,
          width: double.infinity,
          decoration: BoxDecoration(
             border: Border.all(color: AppColor.lighterGray),
              color: AppColor.lightGray,
              borderRadius: BorderRadius.circular(AppSizes.s12.r),
              boxShadow: [
                BoxShadow(
                  color:AppColor.decorationShadow,
                  blurRadius: AppSizes.s5.r,
                  blurStyle: BlurStyle.normal,
                  offset:const Offset(AppSizes.s0,AppSizes.s3)
                )
              ]),
          padding: const EdgeInsets.symmetric(
              vertical: AppSizes.s16, horizontal: AppSizes.s24),
          child: Row(
            children: [
              AspectRatio(
              aspectRatio:1,
                child: Image(
                  image: NetworkImage(subject.icon!),
                  
                ),
              ),
              horizontal_space(30),
              Text(
                subject.name!,
                style: Styles.get_bold(AppSizes.s20, AppColor.black),
              ),
            ],
          )),
    );
  }
}
