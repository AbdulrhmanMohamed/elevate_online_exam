import 'package:flutter/material.dart';

class VerifyEmail extends StatelessWidget {
  final Exception? exception;
  final Function(String email) sendOtp;
  final TextEditingController emailController;
  const VerifyEmail(
      {super.key, required this.emailController, required this.sendOtp, this.exception});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double screenWidth = size.width;
    double screenHeight = size.height;

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
              controller: emailController,
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
                      sendOtp(emailController.text);
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
