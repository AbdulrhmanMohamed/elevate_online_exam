import 'package:elevate_online_exam/common/api_result.dart';
import 'package:elevate_online_exam/domain/models/user.dart';
import 'package:elevate_online_exam/domain/usecases/authentication/forget_password_usecase.dart';
import 'package:elevate_online_exam/presentaion/views/forget_password/forget_password_validator/forget_password_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ForegetPasswordViewmodel extends Cubit<ForgetPasswordState> {
  ForgetPasswordUsecase forgetPasswordUsecase;
  ForgetPasswordValidator forgetPasswordValidator;
  ForegetPasswordViewmodel(
      this.forgetPasswordUsecase, this.forgetPasswordValidator)
      : super(InitialState(null));

  void doIntent(ForgetPasswordScreenIntent intent) {
    switch (intent) {
      case VerifyEmailIntent():
        {
          _checkEmail(intent);
        }
      case VerifyOtpIntent():
        {
          _verifyOtp(intent);
        }
      case ResetPasswordIntent():
        {
          _resetPassword(intent);
        }
    }
  }

  Future<void> _checkEmail(VerifyEmailIntent intent) async {
    emit(LoadingState());
    if (!forgetPasswordValidator.emailFormKey.currentState!.validate()) {
      emit(InitialState(null));
      return;
    }
    print(intent.email);
    var result = await forgetPasswordUsecase.forgotPassword(intent.email);
    switch (result) {
      case Success<String>():
        {
          emit(VerifyOtpState(intent.email, null));
        }
      case Fail<String>():
        {
          emit(InitialState(result.exception));
        }
    }
  }

  Future<void> _verifyOtp(VerifyOtpIntent intent) async {
    emit(LoadingState());
    var result = await forgetPasswordUsecase.verifyResetPassword(intent.otp);
    switch (result) {
      case Success<bool>():
        {
          emit(ResetPasswordState(null));
        }
      case Fail<bool>():
        {
          emit(VerifyOtpState(intent.email, result.exception));
        }
    }
  }

  Future<void> _resetPassword(ResetPasswordIntent intent) async {
    emit(LoadingState());
    print(intent.newPassword);
    if (!forgetPasswordValidator.passwordFormKey.currentState!.validate()) {
      emit(ResetPasswordState(null));
      return;
    }
    var result = await forgetPasswordUsecase.resetPassword(
        forgetPasswordValidator.emailController.text, intent.newPassword);
    switch (result) {
      case Success<User?>():
        {
          emit(SuccessState(result.data));
        }
      case Fail<User?>():
        {
          emit(ResetPasswordState(result.exception));
        }
    }
  }
}

sealed class ForgetPasswordScreenIntent {}

class VerifyEmailIntent extends ForgetPasswordScreenIntent {
  String email;
  VerifyEmailIntent(this.email);
}

class VerifyOtpIntent extends ForgetPasswordScreenIntent {
  String email;
  String otp;
  VerifyOtpIntent(this.email, this.otp);
}

class ResetPasswordIntent extends ForgetPasswordScreenIntent {
  String newPassword;
  ResetPasswordIntent(this.newPassword);
}

sealed class ForgetPasswordState {}

class InitialState extends ForgetPasswordState {
  Exception? error;
  InitialState(this.error);
}

class LoadingState extends ForgetPasswordState {}

class VerifyOtpState extends ForgetPasswordState {
  String? email;
  Exception? error;
  VerifyOtpState(this.email, this.error);
}

class ResetPasswordState extends ForgetPasswordState {
  Exception? error;
  ResetPasswordState(this.error);
}

class SuccessState extends ForgetPasswordState {
  User? user;
  SuccessState(this.user);
}
