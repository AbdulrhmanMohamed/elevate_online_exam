import 'package:elevate_online_exam/di/di.dart';
import 'package:elevate_online_exam/presentaion/views/foreget_password_viewmodel.dart';
import 'package:elevate_online_exam/presentaion/views/login_screen.dart';
import 'package:elevate_online_exam/presentaion/views/utils.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});

  ForegetPasswordViewmodel viewModel = getIt.get<ForegetPasswordViewmodel>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final List<TextEditingController> _controllers =
      List.generate(6, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());
  final _passwordFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
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
                child: _verifyOtp(context, state.error),
              );
            }
            if (state is ResetPasswordState) {
              return _verifyPassword(screenWidth, state.error);
            }
            if (state is InitialState) {
              return Center(child: _verifyEmail(screenWidth, state.error));
            }
            if (state is SuccessState) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
                (Route<dynamic> route) => false,
              );
            }
            return Center(child: _verifyEmail(screenWidth, null));
          },
        ),
      ),
    );
  }

  Widget _verifyEmail(final screenWidth, Exception? exception) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Forget password',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
                textAlign: TextAlign.center,
                'Please enter your email associated to\nyour account',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14)),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Invalid Email';
                }
                return null;
              },
              controller: _emailController,
              decoration: InputDecoration(
                  label: const Text('Email'),
                  hintText: 'Enter your email',
                  errorText:
                      exception != null ? 'This Email is invalid ' : null),
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
                height: 48,
                width: screenWidth,
                child: ElevatedButton(
                    onPressed: () {
                      sendOtp(_emailController.text);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: exception == null
                            ? const Color(0xFF02369C)
                            : const Color(0xFF878787),
                        foregroundColor: Colors.white),
                    child: const Text('Continue')))
          ],
        ),
      ),
    );
  }

  Widget _verifyOtp(BuildContext context, Exception? exception) {
    print(extractErrorMessage(exception));
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Email verification',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
                textAlign: TextAlign.center,
                'Please enter your code that send to your\nemail address',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14)),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(6, (index) {
                return SizedBox(
                  width: 60,
                  height: 80,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: TextFormField(
                      controller: _controllers[index],
                      focusNode: _focusNodes[index],
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      onChanged: (value) {
                        if (value.isNotEmpty && index < 5) {
                          FocusScope.of(context)
                              .requestFocus(_focusNodes[index + 1]);
                        }
                        if (index == 5 && value.isNotEmpty) {
                          final otp = _controllers
                              .map((controller) => controller.text)
                              .join();
                          print(otp);
                          verifyOtp(_emailController.text, otp);
                        }
                      },
                      decoration: InputDecoration(
                          errorText: exception != null ? '' : null,
                          counterText: "",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                );
              }),
            ),
            if (exception != null) ...[
              const Padding(
                padding: EdgeInsets.only(right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: 16,
                    ),
                    Text('Invalid code',
                        style: TextStyle(
                          color: Colors.red,
                        ))
                  ],
                ),
              )
            ],
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Didn't receive code?"),
                TextButton(
                    onPressed: () {
                      sendOtp(_emailController.text);
                    },
                    child: const Text(
                      'Resend',
                      style: TextStyle(decoration: TextDecoration.underline),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _verifyPassword(final screenWidth, Exception? exception) {
    print(extractErrorMessage(exception));
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Form(
        key: _passwordFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Reset password',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
                textAlign: TextAlign.center,
                'Password must not be empty and must contain\n6 characters with upper case letter and one\nnumber at least ',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14)),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Invalid Password';
                }
                return null;
              },
              controller: _passwordController,
              decoration: InputDecoration(
                  label: const Text('New password'),
                  hintText: 'Enter your password',
                  errorText: exception != null ? 'Password is invalid ' : null),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Invalid';
                }
                if (_passwordController.text !=
                    _confirmPasswordController.text) {
                  return "Password don't match";
                }

                return null;
              },
              controller: _confirmPasswordController,
              decoration: const InputDecoration(
                label: Text('Confirm password'),
                hintText: 'Confirm password',
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
                height: 48,
                width: screenWidth,
                child: ElevatedButton(
                    onPressed: () {
                      if (_passwordFormKey.currentState!.validate()) {
                        resetPassword(
                            _emailController.text, _passwordController.text);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: exception == null
                            ? const Color(0xFF02369C)
                            : const Color(0xFF878787),
                        foregroundColor: Colors.white),
                    child: const Text('Continue')))
          ],
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
