import 'package:elevate_online_exam/presentaion/helper/app_sizes.dart';
import 'package:elevate_online_exam/presentaion/helper/spacing.dart';
import 'package:elevate_online_exam/presentaion/helper/strings_manager.dart';
import 'package:elevate_online_exam/presentaion/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';

class EmailAndPassword extends StatefulWidget {
  final TextEditingController? emailController;
  final TextEditingController? passwordController;
  bool? labelError;
  EmailAndPassword(
      {super.key,
      this.emailController,
      this.passwordController,
      this.labelError = false});
  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

String? emailValidator(String? value) {
  if (value != null && (value.isEmpty || !value.contains("@"))) {
    return StringsManager.issueValidEmail;
  }
  return null;
}

String? passwordValidator(String? value) {
  final RegExp passwordRegExp =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$');

  if (value!.isEmpty) return StringsManager.issueEmptyPassword;
  if (!passwordRegExp.hasMatch(value)) {
    return StringsManager.issuePasswordPattern;
  }

  return null;
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextFormField(
          hintText: StringsManager.hintEmail,
          label: const Text(StringsManager.email),
          isError: widget.labelError,
          keyboardType: TextInputType.emailAddress,
          validator: emailValidator,
          controller: widget.emailController,
        ),
        vertical_space(AppSizes.s20),
        AppTextFormField(
          isError: widget.labelError,
          hintText: StringsManager.hintPassword,
          label: const Text(StringsManager.password),
          validator: passwordValidator,
          controller: widget.passwordController,
        ),
      ],
    );
  }
}
