import 'package:elevate_online_exam/presentaion/helper/app_sizes.dart';
import 'package:elevate_online_exam/presentaion/helper/color_consts.dart';
import 'package:elevate_online_exam/presentaion/helper/spacing.dart';
import 'package:elevate_online_exam/presentaion/helper/strings_manager.dart';
import 'package:elevate_online_exam/presentaion/helper/text_styles.dart';
import 'package:elevate_online_exam/presentaion/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';

class Profileinput extends StatelessWidget {
final TextEditingController ? emailController;
final TextEditingController ? firstNameController;
final TextEditingController ? lastNameController;
final TextEditingController ? usernameController;
final TextEditingController ? phoneController;
final TextEditingController ? passwordController;

  const Profileinput({super.key, this.emailController, this.firstNameController, this.lastNameController, this.usernameController, this.phoneController,this.passwordController});


  

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextFormField(
       controller: usernameController,
          hintText: StringsManager.userName,
          label:const Text(
            StringsManager.userName,
          ),
        ),
        vertical_space(AppSizes.s20),
        Row(
          children: [
             Expanded(
              child: AppTextFormField(
              controller:firstNameController,
                hintText: StringsManager.firstName,
                label:const Text(StringsManager.firstName),
              ),
            ),
            horizontal_space(AppSizes.s20),
             Expanded(
              child: AppTextFormField(
              controller: lastNameController,
                hintText: StringsManager.lastName,
                label:const Text(StringsManager.lastName),
              ),
            ),
          ],
        ),
        vertical_space(AppSizes.s20),
         AppTextFormField(
        controller: emailController,
          hintText: StringsManager.email,
          label:const Text(
            StringsManager.email,
          ),
        ),
        vertical_space(AppSizes.s20),
         AppTextFormField(
         controller: passwordController,
          hintText: StringsManager.password,
          label:const Text(
            StringsManager.password,
            
          ),
          suffixIcon: IconButton(onPressed: (){
          }, icon: Text("Change",style: Styles.get_light(AppSizes.s20,AppColor.darkBlue),)),
        ),
        vertical_space(AppSizes.s20),
         AppTextFormField(
         controller: phoneController,
          hintText: StringsManager.phone,
          label:const Text(StringsManager.phone),
        ),
      ],
    );
  }
}
