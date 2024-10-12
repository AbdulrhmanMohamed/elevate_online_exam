import 'package:elevate_online_exam/di/di.dart';
import 'package:elevate_online_exam/presentaion/views/foreget_password_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ForegetPasswordViewmodel vieModel = getIt.get<ForegetPasswordViewmodel>();
    return BlocProvider(
      create: (context) => vieModel,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Password',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: BlocBuilder<ForegetPasswordViewmodel, ForgetPasswordState>(
          builder: (context, state) {
            if (state is VerifyOtpState) {
              return Center(
                child: Text("otp"),
              );
            }
            if (state is ResetPasswordState) {
              return Center(
                child: Text("reset password"),
              );
            }
            return Center(
              child: Text("email"),
            );
          },
        ),
      ),
    );
  }
}
