import 'package:elevate_online_exam/presentaion/helper/app_sizes.dart';
import 'package:elevate_online_exam/presentaion/helper/color_consts.dart';
import 'package:elevate_online_exam/presentaion/helper/text_styles.dart';
import 'package:flutter/material.dart';


  SnackBar appSnackBar(BuildContext context,String message) {
    return SnackBar(
      content: Text(
        message,
        style: Styles.get_bold(AppSizes.s16, AppColor.white)
      ),
      backgroundColor: AppColor.red,  // Red background for danger snackbar
      behavior: SnackBarBehavior.floating,  // Makes snackbar float above the bottom of the screen
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      duration:const Duration(seconds: 3),  // How long the snackbar stays visible
      action: SnackBarAction(
        label: 'Dismiss',
        textColor: Colors.white,  // Dismiss button color
        onPressed: () {
          // You can dismiss the snackbar manually or perform any action here
        },
      ),
    );
  }

