// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:basic_layout/presentaion/helper/app_sizes.dart';
import 'package:basic_layout/presentaion/helper/color_consts.dart';
import 'package:basic_layout/presentaion/helper/text_styles.dart';

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
  AppTextFormField({
    key,
    this.contentPadding,
    this.fillColor,
    this.filled,
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
    this.controller
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
    keyboardType:keyboardType?? TextInputType.text,
      obscureText: isObsecure??false,
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
     
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
          filled: filled ?? true,
          fillColor: fillColor ?? AppColor.moreLightGray,
          isDense: true,
          contentPadding: contentPadding ??
              EdgeInsets.symmetric(
                  vertical: AppSizes.s20, horizontal: AppSizes.s20),
          enabledBorder: enabledBorder ??
              OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1.3,
                    color: AppColor.lighterGray,
                  ),
                  borderRadius:
                      BorderRadius.all(Radius.circular(borderRadius?? AppSizes.s16))),
          focusedBorder: focusedBorder ??
              OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1.3,
                    color: AppColor.mainBlue,
                  ),
                  borderRadius:
                      BorderRadius.all(Radius.circular(AppSizes.s16))),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1.3,
                color: AppColor.red,
              ),
              borderRadius:
                  BorderRadius.all(Radius.circular(AppSizes.s16))),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1.3,
                color: AppColor.red,
              ),
              borderRadius:
                  BorderRadius.all(Radius.circular(AppSizes.s16))),
          hintText: hintText,
          hintStyle:
              hintStyle ?? Styles.get_regular(AppSizes.s18, AppColor.gray)),
    );
  }
}
