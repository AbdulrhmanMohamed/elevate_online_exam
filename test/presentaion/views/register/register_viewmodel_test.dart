import 'package:elevate_online_exam/common/api_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:elevate_online_exam/domain/models/user.dart';
import 'package:elevate_online_exam/domain/usecases/authentication/register_usecase.dart';
import 'package:elevate_online_exam/presentaion/views/register/register_validator/register_field_type_enum.dart';
import 'package:elevate_online_exam/presentaion/views/register/register_validator/register_validator.dart';
import 'package:elevate_online_exam/presentaion/views/register/register_viewmodel.dart';

import 'register_viewmodel_test.mocks.dart';

@GenerateMocks([RegisterUsecase, RegisterValidator])
void main() {
  late RegisterViewmodel viewmodel;
  late MockRegisterUsecase mockRegisterUsecase;
  late MockRegisterValidator mockRegisterValidator;

  setUp(() {
    mockRegisterUsecase = MockRegisterUsecase();
    mockRegisterValidator = MockRegisterValidator();
    viewmodel = RegisterViewmodel(mockRegisterUsecase, mockRegisterValidator);
  });

  group('RegisterViewmodel Tests', () {
    test('initial state is InitialState', () {
      expect(viewmodel.state, isA<InitialState>());
    });

    test(
        'doIntent with RegisterIntent emits LoadingState, SuccessState on success',
        () async {
      final mockUser = User(
        username: 'testUser',
        firstName: 'Test',
        lastName: 'User',
        email: 'test@example.com',
        password: 'password',
        rePassword: 'password',
        phone: '1234567890',
      );
      provideDummy<Result<User?>>(Success(User()));
      when(mockRegisterValidator.validateForm()).thenReturn(mockUser);
      when(mockRegisterUsecase.invoke(
        any,
        any,
        any,
        any,
        any,
        any,
        any,
      )).thenAnswer((_) async => Success<User?>(mockUser));

      expectLater(viewmodel.stream,
          emitsInOrder([isA<LoadingState>(), isA<SuccessState>()]));

      viewmodel.doIntent(RegisterIntent());
    });

    test(
        'doIntent with RegisterIntent emits LoadingState, ErrorState on failure',
        () async {
      final mockUser = User(
        username: 'testUser',
        firstName: 'Test',
        lastName: 'User',
        email: 'test@example.com',
        password: 'password',
        rePassword: 'password',
        phone: '1234567890',
      );
      final exception = Exception('Registration failed');
      provideDummy<Result<User?>>(Fail(exception));
      when(mockRegisterValidator.validateForm()).thenReturn(mockUser);
      when(mockRegisterUsecase.invoke(
        any,
        any,
        any,
        any,
        any,
        any,
        any,
      )).thenAnswer((_) async => Fail<User?>(exception));

      expectLater(viewmodel.stream,
          emitsInOrder([isA<LoadingState>(), isA<ErrorState>()]));

      viewmodel.doIntent(RegisterIntent());

      await untilCalled(mockRegisterUsecase.invoke(
        any,
        any,
        any,
        any,
        any,
        any,
        any,
      ));
    });
    test('fieldController returns correct controller', () {
      when(mockRegisterValidator.usernameController)
          .thenReturn(TextEditingController());

      final controller =
          viewmodel.fieldController(RegisterFormFieldType.username);

      expect(controller, isA<TextEditingController>());
      verify(mockRegisterValidator.usernameController).called(1);
    });

    test('validateField returns correct validator', () {
      final validator = (String? input) => null;

      when(mockRegisterValidator.validate(RegisterFormFieldType.email))
          .thenReturn(validator);

      final result = viewmodel.validateField(RegisterFormFieldType.email);

      expect(result, validator);
      verify(mockRegisterValidator.validate(RegisterFormFieldType.email))
          .called(1);
    });
  });
}
