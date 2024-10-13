import 'dart:developer';

import 'package:basic_layout/di/di.dart';
import 'package:basic_layout/presentaion/helper/app_sizes.dart';
import 'package:basic_layout/presentaion/helper/color_consts.dart';
import 'package:basic_layout/presentaion/helper/spacing.dart';
import 'package:basic_layout/presentaion/screens/login/login_view_model.dart';
import 'package:basic_layout/presentaion/widgets/app_button.dart';
import 'package:basic_layout/presentaion/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:basic_layout/presentaion/helper/text_styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscureText = false;
  void obsecureHandler() {
    setState(() {
      obscureText = !obscureText;
      log("obsecure State $obscureText");
    });
  }

  @override
  Widget build(BuildContext context) {
    LoginViewModel cubit = getIt.get<LoginViewModel>();

    return BlocProvider(
      create: (context) => cubit,
      child: Scaffold(
        backgroundColor: AppColor.white,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppSizes.s20, vertical: AppSizes.s20),
            child: BlocConsumer<LoginViewModel, LoginState>(
              listener: (context, state) {
                // TODO: implement listener
                if(state is LoginSuccessState){
                   log("Login Success State ${state.user}");
                }
                if(state is LoginFailureState){
                
                  log("Login Error State ${state.message}");
                }
              },
              builder: (context, state) {
              if (state is LoginLoadingState) {
              return Center(child: CircularProgressIndicator());
              }
                return SingleChildScrollView(
                  child: Form(
                    key: cubit.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          " Login Screen",
                          style: Styles.get_regular(
                              AppSizes.s26, AppColor.mainBlue),
                        ),
                        vertical_space(AppSizes.s20),
                       
                        vertical_space(AppSizes.s30),
                        AppTextFormField(
                          validator: emailValidator,
                          controller: cubit.emailContorller,
                          hintText: "email",
                          prefixIcon: Icon(Icons.email),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        vertical_space(AppSizes.s10),
                        AppTextFormField(
                          validator: (value) => passwordValidator(value),
                          controller: cubit.passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          isObsecure: obscureText,
                          hintText: "Password",
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: IconButton(
                              onPressed: obsecureHandler,
                              icon: Icon(obscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility)),
                        ),
                        vertical_space(AppSizes.s30),
                        Align(
                          alignment: AlignmentDirectional.centerEnd,
                          child: Text(
                            "Forget Password",
                            style: Styles.get_regular(
                                AppSizes.s15, AppColor.mainBlue),
                          ),
                        ),
                        vertical_space(AppSizes.s30),
                        AppButton(
                          text: "login",
                          onPressed: () {
                          log("Login Clicked");
                            cubit.emitLoginState(cubit.emailContorller.text,
                                cubit.passwordController.text);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  String? emailValidator(String? value) {
    if (value!.isEmpty) return "Email Should Not Be Empty";
    if (!value.contains("@")) return "Please Enter Valid Email";
    return null;
  }

  String? passwordValidator(String? value) {
    final RegExp passwordRegExp = RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$');

    if (value!.isEmpty) return "Email Should Not Be Empty";
    if (!passwordRegExp.hasMatch(value))
      return "Password should have should have numbers & characters & special letters not less than 8 characters";

    return null;
  }
}
