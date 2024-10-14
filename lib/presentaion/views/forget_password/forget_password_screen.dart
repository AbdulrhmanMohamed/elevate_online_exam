import 'package:elevate_online_exam/di/di.dart';
import 'package:elevate_online_exam/presentaion/views/forget_password/foreget_password_viewmodel.dart';
import 'package:elevate_online_exam/presentaion/views/forget_password/verify_email.dart';
import 'package:elevate_online_exam/presentaion/views/forget_password/verify_otp.dart';
import 'package:elevate_online_exam/presentaion/views/forget_password/verify_password.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});

  ForegetPasswordViewmodel viewModel = getIt.get<ForegetPasswordViewmodel>();
  final TextEditingController _emailController = TextEditingController();
 
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Password',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: BlocBuilder<ForegetPasswordViewmodel, ForgetPasswordState>(
          builder: (context, state) {
            if (state is LoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is VerifyOtpState) {
              return Center(
                child: VerifyOtp(
                  emailController: _emailController,
                  sendOtp: sendOtp,
                  verifyOtp: verifyOtp,
                  exception: state.error,
                ),
              );
            }
            if (state is ResetPasswordState) {
              return VerifyPassword(
                emailController: _emailController,
                resetPassword: resetPassword,
                exception: state.error,
              );
            }
            if (state is InitialState) {
              return Center(
                  child: VerifyEmail(
                emailController: _emailController,
                sendOtp: sendOtp,
                exception: state.error,
              ));
            }
            if (state is SuccessState) {
              Navigator.pushNamed(context, 'login');
            }
            return Center(
                child: VerifyEmail(
              emailController: _emailController,
              sendOtp: sendOtp,
            ));
          },
        ),
      ),
    );
  }

 

  void sendOtp(String email) {
    viewModel.doIntent(VerifyEmailIntent(email));
  }

  void verifyOtp(String email, String otp) {
    viewModel.doIntent(VerifyOtpIntent(email, otp));
  }

  void resetPassword(String email, String newPassword) {
    viewModel.doIntent(ResetPasswordIntent(email, newPassword));
  }
}
