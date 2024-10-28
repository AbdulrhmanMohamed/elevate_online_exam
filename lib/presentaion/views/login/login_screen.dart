import 'package:elevate_online_exam/common/prefs_manager.dart';
import 'package:elevate_online_exam/data/consts.dart';
import 'package:elevate_online_exam/di/di.dart';
import 'package:elevate_online_exam/presentaion/helper/app_sizes.dart';
import 'package:elevate_online_exam/presentaion/helper/color_consts.dart';
import 'package:elevate_online_exam/presentaion/helper/router_helper.dart';
import 'package:elevate_online_exam/presentaion/helper/spacing.dart';
import 'package:elevate_online_exam/presentaion/helper/strings_manager.dart';
import 'package:elevate_online_exam/presentaion/helper/text_styles.dart';
import 'package:elevate_online_exam/presentaion/views/home/home_screen.dart';
import 'package:elevate_online_exam/presentaion/views/login/dont_have_account.dart';
import 'package:elevate_online_exam/presentaion/views/login/email_and_password.dart';
import 'package:elevate_online_exam/presentaion/views/login/forget_password.dart';
import 'package:elevate_online_exam/presentaion/views/login/login_button.dart';
import 'package:elevate_online_exam/presentaion/views/login/login_viewmodel.dart';
import 'package:elevate_online_exam/presentaion/views/utils.dart';
import 'package:elevate_online_exam/presentaion/widgets/app_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  final LoginViewModel loginViewModel = getIt.get<LoginViewModel>();

  LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return 
    CacheHelper.getData(key: Consts.token).toString().isNotEmpty?
    HomeScreen():
    BlocProvider(
      create: (context) => loginViewModel,
      child: BlocListener<LoginViewModel, LoginState>(
        listener: (context, state) {
          if (state is LoginLoadingState) {
          } else if (state is LoginSuccessState) {
            // log("why the sate is not working");
            Navigator.pushNamed(context, AppRoutes.home);
          } else if (state is LoginErrorState) {
            ScaffoldMessenger.of(context).clearSnackBars();
            ScaffoldMessenger.of(context).showSnackBar(
              appSnackBar(
                context,
                extractErrorMessage(state.exception),
              ),
            );
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              StringsManager.login,
              style: Styles.get_bold(AppSizes.s25.sp, AppColor.black),
            ),
            leading: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.home);
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
                    vertical_space(AppSizes.s10.h),
                    const ForgetPassword(),
                    vertical_space(AppSizes.s60),
                    LoginButton(viewModel: loginViewModel),
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
