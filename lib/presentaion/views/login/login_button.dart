import 'package:elevate_online_exam/presentaion/helper/app_sizes.dart';
import 'package:elevate_online_exam/presentaion/helper/color_consts.dart';
import 'package:elevate_online_exam/presentaion/helper/text_styles.dart';
import 'package:elevate_online_exam/presentaion/views/login/login_viewmodel.dart';
import 'package:elevate_online_exam/presentaion/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginButton extends StatelessWidget {
  final LoginViewModel viewModel;
  const LoginButton({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return AppButton(
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
              style: Styles.get_bold(AppSizes.s22, AppColor.white),
            );
          }
        },
      ),
      borderRadius: 50,
      onPressed: () => {
        viewModel.doIntent(LoginWithEmailAndPasswordIntent(
            email: viewModel.emailController.text,
            password: viewModel.passwordController.text))
      },
    );
  }
}
