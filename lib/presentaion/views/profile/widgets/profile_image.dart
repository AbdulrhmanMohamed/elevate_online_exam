import 'package:elevate_online_exam/presentaion/helper/app_sizes.dart';
import 'package:elevate_online_exam/presentaion/helper/color_consts.dart';
import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: AppSizes.s100,
        height: AppSizes.s100,
        child: Stack(
          children: [
           const CircleAvatar(
              radius: AppSizes.s100,
              backgroundImage: AssetImage("assets/images/profile.jfif"),
            ),
            Positioned(
              bottom: AppSizes.s1,
              right: AppSizes.s5,
              child: CircleAvatar(
              radius: AppSizes.s20,
              backgroundColor: AppColor.darkBlue.withOpacity(AppSizes.s0_5),
                child:const Icon(
                
                  Icons.camera_alt,
                  color: AppColor.white,
                  size: AppSizes.s30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
