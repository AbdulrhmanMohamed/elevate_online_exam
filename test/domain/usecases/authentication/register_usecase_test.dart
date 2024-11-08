import 'package:elevate_online_exam/common/api_result.dart';
import 'package:elevate_online_exam/domain/models/user.dart';
import 'package:elevate_online_exam/domain/repos/authentication_repo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:elevate_online_exam/domain/usecases/authentication/register_usecase.dart';

import 'register_usecase_test.mocks.dart';

@GenerateMocks([AuthenticationRepo])
void main() {
  late RegisterUsecase registerUsecase;
  late MockAuthenticationRepo mockAuthenticationRepo;

  setUp(() {
    mockAuthenticationRepo = MockAuthenticationRepo();
    registerUsecase = RegisterUsecase(mockAuthenticationRepo);
    provideDummy<Result<User?>>(Success(User()));
    provideDummy<Result<User?>>(Fail(Exception()));
  });

  group('RegisterUsecase Tests', () {
    test('invoke calls register on AuthenticationRepo with correct arguments',
        () async {
      final username = 'testuser';
      final firstName = 'Test';
      final lastName = 'User';
      final email = 'test@example.com';
      final password = 'password';
      final rePassword = 'password';
      final phone = '1234567890';

      final mockUser = User(
        username: username,
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
        rePassword: rePassword,
        phone: phone,
      );

      when(mockAuthenticationRepo.register(
        username,
        firstName,
        lastName,
        email,
        password,
        rePassword,
        phone,
      )).thenAnswer((_) async => Success(mockUser));

      final result = await registerUsecase.invoke(
        username,
        firstName,
        lastName,
        email,
        password,
        rePassword,
        phone,
      );

      expect(result, isA<Success<User?>>());
      verify(mockAuthenticationRepo.register(
        username,
        firstName,
        lastName,
        email,
        password,
        rePassword,
        phone,
      )).called(1);
    });

    test('invoke returns Fail when AuthenticationRepo fails', () async {
      final username = 'testuser';
      final firstName = 'Test';
      final lastName = 'User';
      final email = 'test@example.com';
      final password = 'password';
      final rePassword = 'password';
      final phone = '1234567890';

      final exception = Exception('Registration failed');
      when(mockAuthenticationRepo.register(
        username,
        firstName,
        lastName,
        email,
        password,
        rePassword,
        phone,
      )).thenAnswer((_) async => Fail(exception));

      final result = await registerUsecase.invoke(
        username,
        firstName,
        lastName,
        email,
        password,
        rePassword,
        phone,
      );

      expect(result, isA<Fail<User?>>());
      expect((result as Fail).exception, exception);
      verify(mockAuthenticationRepo.register(
        username,
        firstName,
        lastName,
        email,
        password,
        rePassword,
        phone,
      )).called(1);
    });
  });
}
