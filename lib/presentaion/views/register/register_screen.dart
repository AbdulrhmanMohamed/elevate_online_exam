import 'package:elevate_online_exam/di/di.dart';
import 'package:elevate_online_exam/presentaion/utils.dart';
import 'package:elevate_online_exam/presentaion/views/login/email_and_password.dart';
import 'package:elevate_online_exam/presentaion/views/login/login_screen.dart';
import 'package:elevate_online_exam/presentaion/views/register/register_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? _usernameError;
  String? _emailError;
  RegisterViewmodel viewModel = getIt.get<RegisterViewmodel>();
  RegExp phoneRegex = RegExp(r'^01[0125][0-9]{8}$');
  @override
  Widget build(BuildContext context) {
    const double sizedBoxHeight = 24;
    const double sizedBoxWidth = 20;
    double screenWidth = MediaQuery.of(context).size.width;
    return BlocProvider(
        create: (context) => viewModel,
        child: BlocListener<RegisterViewmodel, RegisterState>(
          listener: (context, state) {
            if (state is SuccessState) {
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: const Text('Signed up successfully'),
                action: SnackBarAction(
                    label: 'login',
                    onPressed: () => Navigator.pushNamed(context, 'login')),
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
              // showDialog(
              //   context: context,
              //   builder: (context) => AlertDialog(
              //     content: SizedBox(
              //         height: 100,
              //         width: 100,
              //         child: Center(child: Text(message))),
              //   ),
              // );
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
                        controller: _usernameController,
                        validator: (value) {
                          if (_usernameError != null) {
                            return _usernameError;
                          }
                          if (value == null || value.isEmpty) {
                            return 'Please enter username';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          label: Text('User name'),
                          hintText: 'Enter your user name',
                        ),
                        onChanged: (value) {
                          setState(() {
                            _usernameError =
                                null; // Reset error message on change
                          });
                        },
                      ),
                      const SizedBox(
                        height: sizedBoxHeight,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter firstname';
                                }
                                return null;
                              },
                              controller: _firstnameController,
                              decoration: const InputDecoration(
                                label: Text('First name'),
                                hintText: 'Enter first name',
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: sizedBoxWidth,
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: _lastnameController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter lastname';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                label: Text('Last name'),
                                hintText: 'Enter last name',
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: sizedBoxHeight),
                      TextFormField(
                        validator: email_validator,
                        controller: _emailController,
                        decoration: const InputDecoration(
                          label: Text('Email'),
                          hintText: 'Enter your email',
                        ),
                        onChanged: (value) {
                          setState(() {
                            _emailError = null; // Reset error message on change
                          });
                        },
                      ),
                      const SizedBox(
                        height: sizedBoxHeight,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              validator: passwordValidator,
                              controller: _passwordController,
                              decoration: const InputDecoration(
                                label: Text('Password'),
                                hintText: 'Enter Password',
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: sizedBoxWidth,
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: _confirmPasswordController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please confirm password';
                                }
                                if (_passwordController.text != value) {
                                  return "Password not matched";
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                label: Text('Confirm password'),
                                hintText: 'Confirm password',
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: sizedBoxHeight,
                      ),
                      TextFormField(
                        controller: _phoneNumberController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter phone';
                          }
                          if (!phoneRegex.hasMatch(value)) {
                            return 'invalid phone number';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          label: Text('Phone number'),
                          hintText: 'Enter phone number',
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      SizedBox(
                          width: screenWidth,
                          height: 48,
                          child: ElevatedButton(
                              onPressed: () {
                                register();
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF02369C),
                                  foregroundColor: Colors.white),
                              child:
                                  BlocBuilder<RegisterViewmodel, RegisterState>(
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
                                        return const Text('Signup');
                                      }
                                  }
                                },
                              ))),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Already have an account?'),
                          TextButton(
                              onPressed: () =>
                                  Navigator.pushNamed(context, 'login'),
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
    if (_formKey.currentState!.validate()) {
      viewModel.doIntent(RegisterIntent(
          _usernameController.text,
          _firstnameController.text,
          _lastnameController.text,
          _emailController.text,
          _passwordController.text,
          _confirmPasswordController.text,
          _phoneNumberController.text));
    }
  }
}
