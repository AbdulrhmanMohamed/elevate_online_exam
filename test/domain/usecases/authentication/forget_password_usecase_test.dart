import 'package:elevate_online_exam/common/api_result.dart';
import 'package:elevate_online_exam/domain/models/user.dart';
import 'package:elevate_online_exam/domain/repos/authentication_repo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:elevate_online_exam/domain/usecases/authentication/forget_password_usecase.dart';

import 'forget_password_usecase_test.mocks.dart';

@GenerateMocks([AuthenticationRepo])
void main() {
  late ForgetPasswordUsecase forgetPasswordUsecase;
  late MockAuthenticationRepo mockAuthenticationRepo;

  setUp(() {
    mockAuthenticationRepo = MockAuthenticationRepo();
    forgetPasswordUsecase = ForgetPasswordUsecase(mockAuthenticationRepo);
    provideDummy<Result<String>>(Success("any"));
    provideDummy<Result<String>>(Fail(Exception()));
    provideDummy<Result<bool>>(Success(true));
    provideDummy<Result<bool>>(Fail(Exception()));
    provideDummy<Result<User?>>(Success(User()));
    provideDummy<Result<User?>>(Fail(Exception()));
  });

  group('ForgetPasswordUsecase Tests', () {
    test('forgotPassword calls forgotPassword on AuthenticationRepo', () async {
      final email = 'test@example.com';
      final successResult = Success('Reset link sent to $email');

      when(mockAuthenticationRepo.forgotPassword(email))
          .thenAnswer((_) async => successResult);

      final result = await forgetPasswordUsecase.forgotPassword(email);

      expect(result, successResult);
      verify(mockAuthenticationRepo.forgotPassword(email)).called(1);
    });

    test('forgotPassword returns Fail when AuthenticationRepo fails', () async {
      final email = 'test@example.com';
      final exception = Exception('Email not found');
      final failResult = Fail<String>(exception);

      when(mockAuthenticationRepo.forgotPassword(email))
          .thenAnswer((_) async => failResult);

      final result = await forgetPasswordUsecase.forgotPassword(email);

      expect(result, failResult);
      verify(mockAuthenticationRepo.forgotPassword(email)).called(1);
    });

    test('verifyResetPassword calls verifyResetPassword on AuthenticationRepo',
        () async {
      final resetCode = '123456';
      final successResult = Success(true);

      when(mockAuthenticationRepo.verifyResetPassword(resetCode))
          .thenAnswer((_) async => successResult);

      final result = await forgetPasswordUsecase.verifyResetPassword(resetCode);

      expect(result, successResult);
      verify(mockAuthenticationRepo.verifyResetPassword(resetCode)).called(1);
    });

    test('verifyResetPassword returns Fail when AuthenticationRepo fails',
        () async {
      final resetCode = '123456';
      final exception = Exception('Invalid reset code');
      final failResult = Fail<bool>(exception);

      when(mockAuthenticationRepo.verifyResetPassword(resetCode))
          .thenAnswer((_) async => failResult);

      final result = await forgetPasswordUsecase.verifyResetPassword(resetCode);

      expect(result, failResult);
      verify(mockAuthenticationRepo.verifyResetPassword(resetCode)).called(1);
    });

    test('resetPassword calls resetPassword on AuthenticationRepo', () async {
      final email = 'test@example.com';
      final newPassword = 'newPassword123';
      final mockUser = User(
        username: 'testuser',
        firstName: 'Test',
        lastName: 'User',
        email: email,
        password: newPassword,
        rePassword: newPassword,
        phone: '1234567890',
      );
      final successResult = Success(mockUser);

      when(mockAuthenticationRepo.resetPassword(email, newPassword))
          .thenAnswer((_) async => successResult);

      final result =
          await forgetPasswordUsecase.resetPassword(email, newPassword);

      expect(result, successResult);
      verify(mockAuthenticationRepo.resetPassword(email, newPassword))
          .called(1);
    });

    test('resetPassword returns Fail when AuthenticationRepo fails', () async {
      final email = 'test@example.com';
      final newPassword = 'newPassword123';
      final exception = Exception('Password reset failed');
      final failResult = Fail<User?>(exception);

      when(mockAuthenticationRepo.resetPassword(email, newPassword))
          .thenAnswer((_) async => failResult);

      final result =
          await forgetPasswordUsecase.resetPassword(email, newPassword);

      expect(result, failResult);
      verify(mockAuthenticationRepo.resetPassword(email, newPassword))
          .called(1);
    });
  });
}
