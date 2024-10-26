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
  );
}
