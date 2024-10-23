import 'package:elevate_online_exam/presentaion/helper/app_sizes.dart';
import 'package:elevate_online_exam/presentaion/helper/color_consts.dart';
import 'package:elevate_online_exam/presentaion/helper/router_helper.dart';
import 'package:elevate_online_exam/presentaion/helper/strings_manager.dart';
import 'package:elevate_online_exam/presentaion/helper/text_styles.dart';
import 'package:flutter/material.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context,AppRoutes.forgetPassword),
          child: Text(
            StringsManager.forgetPassword,
            style: Styles.get_regular(AppSizes.s15, AppColor.gray)
                .copyWith(decoration: TextDecoration.underline),
          ),
        )
      ],
    );
  }
}
