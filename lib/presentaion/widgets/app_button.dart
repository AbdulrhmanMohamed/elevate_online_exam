import 'package:basic_layout/presentaion/helper/app_sizes.dart';
import 'package:basic_layout/presentaion/helper/color_consts.dart';
import 'package:basic_layout/presentaion/helper/text_styles.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final Function()? onPressed;
  final double? verticalPadding;
  final double? horizontalPadding;
  final double? borderRadius;
  final Color? backgroundColor;
  final String text;
  final TextStyle? textStyle;
  const AppButton(
      {super.key,
      this.onPressed,
      this.verticalPadding,
      this.horizontalPadding,
      this.borderRadius,
      this.backgroundColor,
      required this.text,
      this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: TextButton(
        style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(
                vertical: verticalPadding ?? AppSizes.s16,
                horizontal:horizontalPadding?? AppSizes.s16),
            backgroundColor:backgroundColor?? AppColor.mainBlue,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius?? AppSizes.s14))),
        onPressed: onPressed,
        child: Text(
          text,
          style:textStyle?? Styles.get_bold(AppSizes.s22, AppColor.white),
        ),
      ),
    );
  }
}
