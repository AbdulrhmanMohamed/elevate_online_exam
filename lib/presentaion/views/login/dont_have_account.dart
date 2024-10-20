import 'package:elevate_online_exam/presentaion/helper/app_sizes.dart';
import 'package:elevate_online_exam/presentaion/helper/color_consts.dart';
import 'package:elevate_online_exam/presentaion/helper/spacing.dart';
import 'package:elevate_online_exam/presentaion/helper/text_styles.dart';
import 'package:flutter/material.dart';

class DontHaveAccount extends StatelessWidget {
  const DontHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't Have An Account?"),
        horizontal_space(AppSizes.s4),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, 'register'),
          child: Text(
            "Signup",
            style: Styles.get_regular(AppSizes.s16,AppColor.darkBlue)
                .copyWith(decoration: TextDecoration.underline),
          ),
        )
      ],
    );
  }
}
