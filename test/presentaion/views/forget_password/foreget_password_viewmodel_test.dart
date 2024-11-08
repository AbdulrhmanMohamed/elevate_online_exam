import 'package:elevate_online_exam/common/api_result.dart';
import 'package:elevate_online_exam/domain/models/user.dart';
import 'package:elevate_online_exam/domain/usecases/authentication/forget_password_usecase.dart';
import 'package:elevate_online_exam/presentaion/views/forget_password/foreget_password_viewmodel.dart';
import 'package:elevate_online_exam/presentaion/views/forget_password/forget_password_validator/forget_password_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'foreget_password_viewmodel_test.mocks.dart';

@GenerateMocks([
  ForgetPasswordUsecase,
  ForgetPasswordValidator,
  FormState,
  GlobalKey<FormState>,
  TextEditingController
])
void main() {
  late ForegetPasswordViewmodel viewmodel;
  late MockForgetPasswordUsecase mockForgetPasswordUsecase;
  late MockForgetPasswordValidator mockForgetPasswordValidator;
  late MockFormState mockFormState;
  late MockTextEditingController mockTextEditingController;
  late MockGlobalKey<FormState> mockEmailFormKey;
  late MockGlobalKey<FormState> mockPasswordFormKey;
  setUp(
    () {
      mockForgetPasswordUsecase = MockForgetPasswordUsecase();
      mockForgetPasswordValidator = MockForgetPasswordValidator();
      mockFormState = MockFormState();
      mockEmailFormKey = MockGlobalKey<FormState>();
      mockPasswordFormKey = MockGlobalKey<FormState>();
      mockTextEditingController = MockTextEditingController();
      viewmodel = ForegetPasswordViewmodel(
          mockForgetPasswordUsecase, mockForgetPasswordValidator);

      when(mockForgetPasswordValidator.emailFormKey)
          .thenReturn(mockEmailFormKey);
      when(mockEmailFormKey.currentState).thenReturn(mockFormState);

      when(mockForgetPasswordValidator.passwordFormKey)
          .thenReturn(mockPasswordFormKey);
      when(mockPasswordFormKey.currentState).thenReturn(mockFormState);

      when(mockForgetPasswordValidator.emailController)
          .thenReturn(mockTextEditingController);
    },
  );
  group('ForgetPasswordViewmoel test', () {
    test('initial state is InitialState', () {
      expect(viewmodel.state, isA<InitialState>());
    });

    test(
      'doIntent with VerifyEmailIntent emits LoadingState, verifyOtp on Success',
      () {
        when(mockFormState.validate()).thenReturn(true);
        provideDummy<Result<String>>(Success<String>("Otp sent"));

        when(mockForgetPasswordUsecase.forgotPassword("email"))
            .thenAnswer((_) async => Success<String>("Otp sent"));

        expectLater(
          viewmodel.stream,
          emitsInOrder([isA<LoadingState>(), isA<VerifyOtpState>()]),
        );

        viewmodel.doIntent(VerifyEmailIntent("email"));
      },
    );

    test(
      'doIntent with VerifyEmailIntent emits LoadingState, InitialState with exception on Fail',
      () {
        when(mockFormState.validate()).thenReturn(true);
        provideDummy<Result<String>>(Fail<String>(Exception()));

        when(mockForgetPasswordUsecase.forgotPassword("email"))
            .thenAnswer((_) async => Fail<String>(Exception()));

        expectLater(
          viewmodel.stream,
          emitsInOrder([isA<LoadingState>(), isA<InitialState>()]),
        );

        viewmodel.doIntent(VerifyEmailIntent("email"));
      },
    );

    test(
      'doIntent with VerifyEmailIntent emits LoadingState, InitialState when emailformkey is invalid',
      () {
        when(mockFormState.validate()).thenReturn(false);
        expectLater(
          viewmodel.stream,
          emitsInOrder([isA<LoadingState>(), isA<InitialState>()]),
        );

        viewmodel.doIntent(VerifyEmailIntent("email"));
      },
    );

    test(
      'doIntent with VerifyOtpIntent emits LoadingState, ResetPasswordState on Success',
      () {
        provideDummy<Result<bool>>(Success<bool>(true));

        when(mockForgetPasswordUsecase.verifyResetPassword('102382'))
            .thenAnswer((_) async => Success<bool>(true));

        expectLater(
          viewmodel.stream,
          emitsInOrder([isA<LoadingState>(), isA<ResetPasswordState>()]),
        );

        viewmodel.doIntent(VerifyOtpIntent("email", "102382"));
      },
    );

    test(
      'doIntent with VerifyOtpIntent emits LoadingState, VerifyOtpState on Fail',
      () {
        provideDummy<Result<bool>>(Fail<bool>(Exception(false)));

        when(mockForgetPasswordUsecase.verifyResetPassword('102382'))
            .thenAnswer((_) async => Fail<bool>(Exception(false)));

        expectLater(
          viewmodel.stream,
          emitsInOrder([isA<LoadingState>(), isA<VerifyOtpState>()]),
        );

        viewmodel.doIntent(VerifyOtpIntent("email", "102382"));
      },
    );

    test(
      'doIntent with ResetPasswordIntent emits LoadingState, SuccessState on Success',
      () {
        when(mockFormState.validate()).thenReturn(true);
        when(mockTextEditingController.text).thenReturn("");
        provideDummy<Result<User?>>(Success<User?>(User()));
        when(mockTextEditingController.text)
            .thenAnswer((_) => 'test@example.com');
        when(mockForgetPasswordUsecase.resetPassword(
                "test@example.com", "newPassword"))
            .thenAnswer((_) async => Success<User?>(User()));

        expectLater(
          viewmodel.stream,
          emitsInOrder([isA<LoadingState>(), isA<SuccessState>()]),
        );

        viewmodel.doIntent(ResetPasswordIntent("newPassword"));
      },
    );

    test(
      'doIntent with ResetPasswordIntent emits LoadingState, ResetPasswordState on Fail',
      () {
        when(mockFormState.validate()).thenReturn(true);
        when(mockTextEditingController.text).thenReturn("");
        provideDummy<Result<User?>>(Fail<User?>(Exception()));
        when(mockTextEditingController.text)
            .thenAnswer((_) => 'test@example.com');
        when(mockForgetPasswordUsecase.resetPassword(
                "test@example.com", "newPassword"))
            .thenAnswer((_) async => Fail<User?>(Exception()));

        expectLater(
          viewmodel.stream,
          emitsInOrder([isA<LoadingState>(), isA<ResetPasswordState>()]),
        );

        viewmodel.doIntent(ResetPasswordIntent("newPassword"));
      },
    );

    test(
      'doIntent with ResetPasswordIntent emits LoadingState, ResetPasswordState when passwordformkey is invalid',
      () {
        when(mockFormState.validate()).thenReturn(false);
        expectLater(
          viewmodel.stream,
          emitsInOrder([isA<LoadingState>(), isA<ResetPasswordState>()]),
        );

        viewmodel.doIntent(ResetPasswordIntent("newPassword"));
      },
    );
  });
}
