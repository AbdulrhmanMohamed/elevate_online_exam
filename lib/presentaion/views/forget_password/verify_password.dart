import 'package:elevate_online_exam/presentaion/helper/app_sizes.dart';
import 'package:elevate_online_exam/presentaion/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerifyPassword extends StatelessWidget {
  final Exception? exception;
  TextEditingController emailController;
  void Function(String email, String password) resetPassword;
  VerifyPassword(
      {super.key,
      this.exception,
      required this.resetPassword,
      required this.emailController});
  GlobalKey<FormState> passwordFormKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Form(
        key: passwordFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Reset password',
              style: TextStyle(
                  fontWeight: FontWeight.w500, fontSize: AppSizes.s18.sp),
            ),
            SizedBox(
              height: AppSizes.s16.h,
            ),
            Text(
                textAlign: TextAlign.center,
                'Password must not be empty and must contain\n6 characters with upper case letter and one\nnumber at least ',
                style: TextStyle(
                    fontWeight: FontWeight.w400, fontSize: AppSizes.s14.sp)),
            SizedBox(
              height: AppSizes.s30.h,
            ),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Invalid Password';
                }
                return null;
              },
              controller: passwordController,
              decoration: InputDecoration(
                  label: const Text('New password'),
                  hintText: 'Enter your password',
                  errorText: exception != null ? 'Password is invalid ' : null),
            ),
            SizedBox(
              height: AppSizes.s16.h,
            ),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Invalid';
                }
                if (passwordController.text != confirmPasswordController.text) {
                  return "Password don't match";
                }

                return null;
              },
              controller: confirmPasswordController,
              decoration: const InputDecoration(
                label: Text('Confirm password'),
                hintText: 'Confirm password',
              ),
            ),
            SizedBox(
              height: AppSizes.s50.h,
            ),
            AppButton(
              text: const Text('Continue'),
              onPressed: () {
                if (passwordFormKey.currentState!.validate()) {
                  resetPassword(emailController.text, passwordController.text);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
