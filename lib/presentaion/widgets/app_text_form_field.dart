// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:elevate_online_exam/presentaion/helper/app_sizes.dart';
import 'package:elevate_online_exam/presentaion/helper/color_consts.dart';
import 'package:elevate_online_exam/presentaion/helper/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final Color? fillColor;
  final bool? filled;
  final bool ? isObsecure;
  final Color? borderSideColor;
  final double? borderRadius;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final TextStyle? hintStyle;
  final String hintText;
  final Icon? prefixIcon;
  final IconButton? suffixIcon;
  final Function()? suffixPressed;
  final TextInputType ? keyboardType;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final Widget ? label;
  final bool ? isError;
  AppTextFormField({
    key,
    this.contentPadding,
    this.fillColor,
    this.filled=false,
    this.borderSideColor,
    this.borderRadius,
    this.enabledBorder,
    this.focusedBorder,
    this.hintStyle,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.suffixPressed,
    this.isObsecure,
    this.keyboardType,
    this.validator,
    this.controller,
    this.label,
    this.isError
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
    keyboardType:keyboardType?? TextInputType.text,
      obscureText: isObsecure??false,
      validator: validator,
      controller: controller,
  
      decoration: InputDecoration(
      errorStyle: Styles.get_bold(AppSizes.s14.sp,AppColor.red),
      label:label ,
      labelStyle: Styles.get_bold(AppSizes.s14.sp, isError!?AppColor.red:AppColor.black),
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
          filled: filled ?? true,
          fillColor: fillColor ?? AppColor.white,
          isDense: true,
          contentPadding: contentPadding ??
             const EdgeInsets.symmetric(
                  vertical: AppSizes.s20, horizontal: AppSizes.s20),
          // enabledBorder: enabledBorder ??
          //     OutlineInputBorder(
          //         borderSide: BorderSide(
          //           width: 1.3,
          //           color: AppColor.lighterGray,
          //         ),
          //         borderRadius:
          //             BorderRadius.all(Radius.circular(borderRadius?? AppSizes.s16))),
          // focusedBorder: focusedBorder ??
          //     OutlineInputBorder(
          //         borderSide: BorderSide(
          //           width: 1.3,
          //           color: AppColor.mainBlue,
          //         ),
          //         borderRadius:
          //             BorderRadius.all(Radius.circular(AppSizes.s16))),
          errorBorder:const OutlineInputBorder(
              borderSide: BorderSide(
                width: 1.3,
                color: AppColor.red,
              ),
              borderRadius:
                  BorderRadius.all(Radius.circular(AppSizes.s0))),
          focusedErrorBorder:const OutlineInputBorder(
              borderSide: BorderSide(
                width: 1.3,
                color: AppColor.red,
              ),
              borderRadius:
                  BorderRadius.all(Radius.circular(AppSizes.s0))),
          hintText: hintText,
          // hintStyle:
          //     hintStyle ?? Styles.get_regular(AppSizes.s18)),
          )
    );
  }
}
