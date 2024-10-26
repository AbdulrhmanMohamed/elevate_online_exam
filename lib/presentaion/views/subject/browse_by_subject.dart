import 'package:elevate_online_exam/presentaion/helper/app_sizes.dart';
import 'package:elevate_online_exam/presentaion/helper/color_consts.dart';
import 'package:elevate_online_exam/presentaion/helper/strings_manager.dart';
import 'package:elevate_online_exam/presentaion/helper/text_styles.dart';
import 'package:flutter/material.dart';

class BrowseBySubject extends StatelessWidget {
  const BrowseBySubject({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Text(
        StringsManager.browseBySubject,
        style: Styles.get_bold(AppSizes.s22, AppColor.black),
      ),
    );
  }
}
