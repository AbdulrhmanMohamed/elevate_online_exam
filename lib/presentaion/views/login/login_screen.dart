import 'dart:developer';

import 'package:elevate_online_exam/di/di.dart';
import 'package:elevate_online_exam/presentaion/helper/app_sizes.dart';
import 'package:elevate_online_exam/presentaion/helper/color_consts.dart';
import 'package:elevate_online_exam/presentaion/helper/spacing.dart';
import 'package:elevate_online_exam/presentaion/helper/text_styles.dart';
import 'package:elevate_online_exam/presentaion/views/login/dont_have_account.dart';
import 'package:elevate_online_exam/presentaion/views/login/email_and_password.dart';
import 'package:elevate_online_exam/presentaion/views/login/login_viewmodel.dart';
import 'package:elevate_online_exam/presentaion/views/utils.dart';
import 'package:elevate_online_exam/presentaion/widgets/app_button.dart';
import 'package:elevate_online_exam/presentaion/widgets/app_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  final LoginViewModel loginViewModel = getIt.get<LoginViewModel>();

  LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => loginViewModel,
      child: BlocListener<LoginViewModel, LoginState>(
        listener: (context, state) {
          if (state is LoginLoadingState) {
            log("State is Loading===========================");
          } else if (state is LoginSuccessState) {
            // log("why the sate is not working");
            Navigator.pushNamed(context, 'home');
          } else if (state is LoginErrorState) {
            ScaffoldMessenger.of(context).clearSnackBars();
            ScaffoldMessenger.of(context).showSnackBar(
              appSnackBar(
                context,
                extractErrorMessage(state.exception),
              ),
            );
          }
          // TODO: implement listener
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Login",
              style: Styles.get_bold(25, AppColor.black),
            ),
            leading: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, 'home');
              },
              icon: const Icon(Icons.arrow_back),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(AppSizes.s20),
              child: Form(
                key: loginViewModel.formKey,
                child: Column(
                  children: [
                    EmailAndPassword(
                      emailController: loginViewModel.emailController,
                      passwordController: loginViewModel.passwordController,
                    ),
                    vertical_space(AppSizes.s10),
                    Row(
                      children: [
                        const Spacer(),
                        GestureDetector(
                        onTap: ()=>Navigator.pushNamed(context,'forgetPassword'),
                          child: Text(
                            "Forget Password",
                            style: Styles.get_regular(AppSizes.s15, AppColor.gray)
                                .copyWith(decoration: TextDecoration.underline),
                          ),
                        )
                      ],
                    ),
                    vertical_space(AppSizes.s60),
                    AppButton(
                      text: BlocBuilder<LoginViewModel, LoginState>(
                        builder: (context, state) {
                          if (state is LoginLoadingState) {
                            return const Center(
                                child: CircularProgressIndicator(
                              color: AppColor.white,
                            ));
                          } else {
                            return Text(
                              "Login",
                              style:
                                  Styles.get_bold(AppSizes.s22, AppColor.white),
                            );
                          }
                        },
                      ),
                      borderRadius: 50,
                      onPressed: () => {
                        loginViewModel.doIntent(LoginWithEmailAndPasswordIntent(
                            email: loginViewModel.emailController.text,
                            password: loginViewModel.passwordController.text))
                      },
                    ),
                    vertical_space(AppSizes.s10),
                    const DontHaveAccount(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
