import 'package:elevate_online_exam/di/di.dart';
import 'package:elevate_online_exam/presentaion/helper/app_sizes.dart';
import 'package:elevate_online_exam/presentaion/helper/router_helper.dart';
import 'package:elevate_online_exam/presentaion/helper/strings_manager.dart';
import 'package:elevate_online_exam/presentaion/utils.dart';
import 'package:elevate_online_exam/presentaion/views/register/register_validator/register_field_type_enum.dart';
import 'package:elevate_online_exam/presentaion/views/register/register_viewmodel.dart';
import 'package:elevate_online_exam/presentaion/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String? _usernameError;
  String? _emailError;
  RegisterViewmodel viewModel = getIt.get<RegisterViewmodel>();

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = viewModel.formKey();
    return BlocProvider(
        create: (context) => viewModel,
        child: BlocListener<RegisterViewmodel, RegisterState>(
          listener: (context, state) {
            if (state is SuccessState) {
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: const Text('Signed up successfully'),
                action: SnackBarAction(
                    label: StringsManager.login,
                    onPressed: () =>
                        Navigator.pushNamed(context, AppRoutes.login)),
              ));
            }
            if (state is ErrorState) {
              final message = extractErrorMessage(state.exception);
              if (message == 'username already exists') {
                _usernameError = 'username already exists';
                _formKey.currentState!.validate();
              }
              if (message == 'email already exists') {
                _emailError = 'email already exists';
                _formKey.currentState!.validate();
              }
            }
          },
          child: Scaffold(
            appBar: AppBar(
              title: const Text(
                'Sign up',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: viewModel
                            .fieldController(RegisterFormFieldType.username),
                        validator: viewModel
                            .validateField(RegisterFormFieldType.username),
                        decoration: InputDecoration(
                            label: const Text('User name'),
                            hintText: 'Enter your user name',
                            errorText: _usernameError),
                        onChanged: (value) {
                          setState(() {
                            _usernameError =
                                null; // Reset error message on change
                          });
                        },
                      ),
                      SizedBox(
                        height: AppSizes.s24.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: viewModel.fieldController(
                                  RegisterFormFieldType.firstname),
                              validator: viewModel.validateField(
                                  RegisterFormFieldType.firstname),
                              decoration: const InputDecoration(
                                label: Text('First name'),
                                hintText: 'Enter first name',
                              ),
                            ),
                          ),
                          SizedBox(
                            width: AppSizes.s20.w,
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: viewModel.fieldController(
                                  RegisterFormFieldType.lastname),
                              validator: viewModel.validateField(
                                  RegisterFormFieldType.lastname),
                              decoration: const InputDecoration(
                                label: Text('Last name'),
                                hintText: 'Enter last name',
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: AppSizes.s24.h),
                      TextFormField(
                        controller: viewModel
                            .fieldController(RegisterFormFieldType.email),
                        validator: viewModel
                            .validateField(RegisterFormFieldType.email),
                        decoration: InputDecoration(
                          label: const Text('Email'),
                          hintText: 'Enter your email',
                          errorText: _emailError,
                        ),
                        onChanged: (value) {
                          setState(() {
                            _emailError = null; // Reset error message on change
                          });
                        },
                      ),
                      SizedBox(
                        height: AppSizes.s24.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: viewModel.fieldController(
                                  RegisterFormFieldType.password),
                              validator: viewModel.validateField(
                                  RegisterFormFieldType.password),
                              decoration: const InputDecoration(
                                label: Text(StringsManager.password),
                                hintText: StringsManager.hintPassword,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: AppSizes.s20.w,
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: viewModel.fieldController(
                                  RegisterFormFieldType.confirmPassword),
                              validator: viewModel.validateField(
                                  RegisterFormFieldType.confirmPassword),
                              decoration: const InputDecoration(
                                label: Text('Confirm password'),
                                hintText: 'Confirm password',
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: AppSizes.s24.h,
                      ),
                      TextFormField(
                        controller: viewModel
                            .fieldController(RegisterFormFieldType.phone),
                        validator: viewModel
                            .validateField(RegisterFormFieldType.phone),
                        decoration: const InputDecoration(
                          label: Text('Phone number'),
                          hintText: 'Enter phone number',
                        ),
                      ),
                      SizedBox(
                        height: 50.h,
                      ),
                      AppButton(
                        text: BlocBuilder<RegisterViewmodel, RegisterState>(
                          builder: (context, state) {
                            switch (state) {
                              case LoadingState():
                                {
                                  return const CircularProgressIndicator(
                                    color: Colors.white,
                                  );
                                }
                              default:
                                {
                                  return const Text(
                                    'Signup',
                                    style: TextStyle(color: Colors.white),
                                  );
                                }
                            }
                          },
                        ),
                        onPressed: register,
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Already have an account?'),
                          TextButton(
                              onPressed: () =>
                                  Navigator.pushNamed(context, AppRoutes.login),
                              child: const Text(
                                'Login',
                                style: TextStyle(
                                    color: Color(0xFF02369C),
                                    decoration: TextDecoration.underline),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }

  void register() {
    viewModel.doIntent(RegisterIntent());
  }
}
