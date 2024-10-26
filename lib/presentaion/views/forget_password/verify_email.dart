import 'package:elevate_online_exam/presentaion/helper/app_sizes.dart';
import 'package:elevate_online_exam/presentaion/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerifyEmail extends StatelessWidget {
  final Exception? exception;
  final Function(String email) sendOtp;
  final TextEditingController emailController;
  final String? Function(String?) emailValidator;
  final GlobalKey<FormState> formKey;
  const VerifyEmail(
      {super.key,
      required this.emailController,
      required this.emailValidator,
      required this.sendOtp,
      required this.formKey,
      this.exception});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSizes.s15),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Forget password',
              style: TextStyle(
                  fontWeight: FontWeight.w500, fontSize: AppSizes.s18.sp),
            ),
            SizedBox(
              height: AppSizes.s16.h,
            ),
            Text(
                textAlign: TextAlign.center,
                'Please enter your email associated to\nyour account',
                style: TextStyle(
                    fontWeight: FontWeight.w400, fontSize: AppSizes.s14.sp)),
            SizedBox(
              height: AppSizes.s30.h,
            ),
            TextFormField(
              validator: emailValidator,
              controller: emailController,
              decoration: InputDecoration(
                  label: const Text('Email'),
                  hintText: 'Enter your email',
                  errorText:
                      exception != null ? 'This Email is invalid ' : null),
            ),
            SizedBox(
              height: AppSizes.s50.h,
            ),
            AppButton(
              text: const Text(
                'Continune',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                sendOtp(emailController.text);
              },
            )
          ],
        ),
      ),
    );
  }
}
