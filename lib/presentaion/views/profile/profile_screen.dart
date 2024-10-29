import 'package:elevate_online_exam/presentaion/helper/app_sizes.dart';
import 'package:elevate_online_exam/presentaion/helper/color_consts.dart';
import 'package:elevate_online_exam/presentaion/helper/strings_manager.dart';
import 'package:elevate_online_exam/presentaion/helper/text_styles.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
        "profile",
          style: Styles.get_bold(AppSizes.s20, AppColor.black),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(
          AppSizes.s10,
          
        ),
        child: Column(children: [
          Stack(children: [
           CircleAvatar()
          ],)
        ],),
      ),
    );
  }
}
