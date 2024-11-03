import 'dart:developer';

import 'package:elevate_online_exam/presentaion/views/profile/profileInput.dart';
import 'package:elevate_online_exam/presentaion/views/profile/profile_viewmodel/profile_state.dart';
import 'package:elevate_online_exam/presentaion/views/profile/profile_viewmodel/profile_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileInutBuilder extends StatelessWidget {
  const ProfileInutBuilder({
    super.key,
    required this.runtimeType,
    required ProfileViewmodel profileViewmodel,
  }) : _profileViewmodel = profileViewmodel;

  final Type runtimeType;
  final ProfileViewmodel _profileViewmodel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileViewmodel, ProfileState>(
        builder: (context, state) {
      log("=========What is the State ${state.runtimeType}");
      return Profileinput(
        emailController: _profileViewmodel.emailController,
        usernameController: _profileViewmodel.usernameController,
        lastNameController: _profileViewmodel.lastNameController,
        phoneController: _profileViewmodel.phoneController,
        firstNameController:
            _profileViewmodel.firstNameController,
        passwordController: _profileViewmodel.passwordController,
      );
    });
  }
}
