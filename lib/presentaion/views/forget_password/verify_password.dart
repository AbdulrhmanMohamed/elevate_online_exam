import 'package:flutter/material.dart';

class VerifyPassword extends StatelessWidget {
final Exception ? exception;
TextEditingController  emailController;
void Function(String email,String password) resetPassword;
   VerifyPassword({super.key,this.exception,required this.resetPassword,required this.emailController});
GlobalKey<FormState> passwordFormKey=GlobalKey<FormState>();
TextEditingController passwordController=TextEditingController();
TextEditingController confirmPasswordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
var screenWidth= MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Form(
        key: passwordFormKey,
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
              controller: passwordController,
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
                if (passwordController.text !=
                    confirmPasswordController.text) {
                  return "Password don't match";
                }

                return null;
              },
              controller: confirmPasswordController,
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
                      if (passwordFormKey.currentState!.validate()) {
                        resetPassword(
                            emailController.text, passwordController.text);
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
}