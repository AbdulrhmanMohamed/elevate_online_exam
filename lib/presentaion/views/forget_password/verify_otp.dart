import 'package:flutter/material.dart';

class VerifyOtp extends StatelessWidget {
  final Exception? exception;
  final Function(String email) sendOtp;
  final Function(String email, String otp) verifyOtp;
  final TextEditingController emailController;
  final List<TextEditingController> _controllers =
      List.generate(6, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());
  VerifyOtp(
      {super.key,
      required this.emailController,
      required this.sendOtp,
      required this.verifyOtp,
      this.exception});

  @override
  Widget build(BuildContext context) {
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
                          verifyOtp(emailController.text,otp);
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
                      sendOtp(emailController.text);
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
}
