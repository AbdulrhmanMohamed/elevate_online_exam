import 'package:elevate_online_exam/data/api/models/request/auth_body.dart';
import 'package:elevate_online_exam/di/di.dart';
import 'package:elevate_online_exam/presentaion/helper/app_sizes.dart';
import 'package:elevate_online_exam/presentaion/helper/color_consts.dart';
import 'package:elevate_online_exam/presentaion/helper/router_helper.dart';
import 'package:elevate_online_exam/presentaion/helper/spacing.dart';
import 'package:elevate_online_exam/presentaion/helper/strings_manager.dart';
import 'package:elevate_online_exam/presentaion/helper/text_styles.dart';
import 'package:elevate_online_exam/presentaion/views/profile/profileInput.dart';
import 'package:elevate_online_exam/presentaion/views/profile/profile_viewmodel/profile_intent.dart';
import 'package:elevate_online_exam/presentaion/views/profile/profile_viewmodel/profile_state.dart';
import 'package:elevate_online_exam/presentaion/views/profile/profile_viewmodel/profile_viewmodel.dart';
import 'package:elevate_online_exam/presentaion/views/profile/widgets/profile_image.dart';
import 'package:elevate_online_exam/presentaion/views/profile/widgets/profile_input_builder.dart';
import 'package:elevate_online_exam/presentaion/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final ProfileViewmodel _profileViewmodel = getIt.get<ProfileViewmodel>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        _profileViewmodel.doIntent(GetUserProfileIntent());
        return _profileViewmodel;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            StringsManager.profile,
            style: Styles.get_bold(AppSizes.s20, AppColor.black),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(AppSizes.s10),
            child: Form(
              child: Column(
                children: [
                  const ProfileImage(),
                  vertical_space(AppSizes.s20),

                  // Separate BlocBuilder for Profile Input
                  ProfileInutBuilder(
                    runtimeType: runtimeType,
                    profileViewmodel: _profileViewmodel,
                  ),
                  vertical_space(AppSizes.s20),

                  // Separate BlocConsumer for handling Edit Profile actions
                  BlocConsumer<ProfileViewmodel, ProfileState>(
                    listener: (context, state) {
                      if (state is EditProfileSuccessState) {
                        Navigator.pushReplacementNamed(
                            context, AppRoutes.login);
                      } else if (state is ProfileErrorState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(state.exception.toString())),
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state is EditProfileLoadingState) {
                        return const AppButton(
                          text:  Center(
                            child:
                                CircularProgressIndicator(color: AppColor.white),
                          ),
                        );
                      }else{
                       return AppButton(
                        text: Text(
                          "Update",
                          style: Styles.get_bold(AppSizes.s20, AppColor.white),
                        ),
                        onPressed: () {
                          _profileViewmodel.doIntent(
                            EditUserProfileIntent(
                              AuthBody(
                                firstName:
                                    _profileViewmodel.firstNameController.text,
                                lastName:
                                    _profileViewmodel.lastNameController.text,
                                username:
                                    _profileViewmodel.usernameController.text,
                                email: _profileViewmodel.emailController.text,
                                phone: _profileViewmodel.phoneController.text,
                                password: _profileViewmodel
                                        .passwordController.text
                                    
                              ),
                            ),
                          );
                        },
                      );

                      }
                                         },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
