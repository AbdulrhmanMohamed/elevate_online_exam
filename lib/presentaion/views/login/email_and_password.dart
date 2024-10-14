import 'package:elevate_online_exam/presentaion/helper/app_sizes.dart';
import 'package:elevate_online_exam/presentaion/helper/spacing.dart';
import 'package:elevate_online_exam/presentaion/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';

class EmailAndPassword extends StatefulWidget {
 final TextEditingController? emailController;
 final TextEditingController? passwordController;
  bool ?labelError;
   EmailAndPassword({super.key, this.emailController, this.passwordController,this.labelError=false});
  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
    
       AppTextFormField(
                hintText: "Enter Your Email",
                label: const Text("Email"),
                isError:widget.labelError,
                keyboardType: TextInputType.emailAddress,
                validator:email_validator,
                controller: widget.emailController,
              ),
              vertical_space(AppSizes.s20),
              AppTextFormField(
              isError: widget.labelError,
                hintText: "Enter Your Password",
                label: const Text("Password"),
                validator: passwordValidator,
                controller: widget.passwordController,
              ),

    ],);
  }

   String? email_validator(String ?value){
  if(value!=null && (value.isEmpty || !value.contains("@")))return "Please Enter Valid Email";
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