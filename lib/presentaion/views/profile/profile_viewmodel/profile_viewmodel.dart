import 'dart:developer';

import 'package:elevate_online_exam/common/api_result.dart';
import 'package:elevate_online_exam/domain/models/user.dart';
import 'package:elevate_online_exam/domain/usecases/authentication/edit_profile_usecase.dart';
import 'package:elevate_online_exam/domain/usecases/authentication/get_profile_usecase.dart';
import 'package:elevate_online_exam/presentaion/views/profile/profile_controller/profile_controllers.dart';
import 'package:elevate_online_exam/presentaion/views/profile/profile_viewmodel/profile_intent.dart';
import 'package:elevate_online_exam/presentaion/views/profile/profile_viewmodel/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProfileViewmodel extends Cubit<ProfileState> {
  final GetProfileUsecase _getProfileUsecase;
  final EditProfileUsecase _editProfileUsecase;

  final ProfileControllers _profileControllers;
  ProfileViewmodel(this._getProfileUsecase, this._profileControllers,
      this._editProfileUsecase)
      : super(ProfileInitialState());

  TextEditingController get usernameController =>
      _profileControllers.usernameController;
  TextEditingController get firstNameController =>
      _profileControllers.firstNameController;
  TextEditingController get lastNameController =>
      _profileControllers.lastNameController;
  TextEditingController get emailController =>
      _profileControllers.emailController;
  TextEditingController get phoneController =>
      _profileControllers.phoneController;
  TextEditingController get passwordController =>
      _profileControllers.passwordController;
  doIntent(ProfileIntent intent) {
    switch (intent) {
      case GetUserProfileIntent():
        _getUserProfile();
      case EditUserProfileIntent():
        _edittUserProfile(intent);
    }
  }

  _getUserProfile() async {
    emit(ProfileLoadingState());
    var result = await _getProfileUsecase.getProfile();
    switch (result) {
      case Success<User?>():
        var user = result.data;
        usernameController.text = user!.username!;
        firstNameController.text = user.firstName!;
        lastNameController.text = user.lastName!;
        emailController.text = user.email!;
        phoneController.text = user.phone!;
        emit(ProfileSuccessState());

      case Fail<User?>():
        emit(ProfileErrorState(result.exception));
    }
  }

  _edittUserProfile(intent) async {
  log("profileControllerEdit ${lastNameController.text}");
    emit(EditProfileLoadingState());
    var result = await _editProfileUsecase.editProfile(intent.body);
    switch (result) {
      case Success<User?>():
        var user = result.data;
        usernameController.text = user!.username!;
        firstNameController.text = user.firstName!;
        lastNameController.text = user.lastName!;
        emailController.text = user.email!;
        phoneController.text = user.phone!;
        passwordController.text = user.password ?? '';
        emit(EditProfileSuccessState());

      case Fail<User?>():
        emit(ProfileErrorState(result.exception));
    }
  }
}
