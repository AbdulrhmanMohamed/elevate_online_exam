import 'package:elevate_online_exam/presentaion/helper/app_sizes.dart';
import 'package:elevate_online_exam/presentaion/helper/color_consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData appTheme() {
  return ThemeData(
    appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: AppColor.moreLighterGray),
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent),
    scaffoldBackgroundColor: AppColor.moreLighterGray,
    inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(fontWeight: FontWeight.w300),
        labelStyle: TextStyle(color: AppColor.black),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: AppColor.black,
        )),
        border: OutlineInputBorder()),
    navigationBarTheme: NavigationBarThemeData(
      // Customizing the colors for selected and unselected items
      indicatorColor: AppColor.mainBlue, // Highlight for selected items
      labelTextStyle:
          WidgetStateProperty.resolveWith<TextStyle>((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return const TextStyle(
              color: AppColor.darkBlue,
              fontSize: AppSizes.s20); // Color for selected label
        }
        return const TextStyle(
            color: AppColor.gray_30,
            fontSize: AppSizes.s20); // Color for unselected label
      }),
      iconTheme: WidgetStateProperty.resolveWith<IconThemeData>(
          (Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return const IconThemeData(
              color: AppColor.darkBlue,
              size: AppSizes.s23); // Color for selected icon
        }
        return const IconThemeData(
            color: AppColor.gray_30,
            size: AppSizes.s23); // Color for unselected icon
      }),
    ),
  );
}
