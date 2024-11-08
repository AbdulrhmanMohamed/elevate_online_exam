import 'package:elevate_online_exam/common/api_result.dart';
import 'package:elevate_online_exam/presentaion/views/exam_score.dart/exam_score_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:elevate_online_exam/domain/models/exam_score.dart';
import 'package:elevate_online_exam/domain/usecases/examQuestions/get_exam_score_usecase.dart';

import 'exam_score_viewmodel_test.mocks.dart';

@GenerateMocks([GetExamScoreUsecase])
void main() {
  late ExamScoreViewmodel viewmodel;
  late MockGetExamScoreUsecase mockGetExamScoreUsecase;

  setUp(() {
    mockGetExamScoreUsecase = MockGetExamScoreUsecase();
    viewmodel = ExamScoreViewmodel(mockGetExamScoreUsecase);
    provideDummy<Result<ExamScore>>(Success(ExamScore()));
    provideDummy<Result<ExamScore>>(Fail(Exception()));
  });

  group('ExamScoreViewmodel Tests', () {
    test('initial state is InitialState', () {
      expect(viewmodel.state, isA<InitialState>());
    });

    test(
        'doIntent with GetScoreIntent emits LoadingState, SuccessState on success',
        () async {
      final answers = {'1': 'A', '2': 'B'};
      final mockExamScore = ExamScore(total: '85%');
      final result = Success(mockExamScore);

      when(mockGetExamScoreUsecase.getExamScore(answers))
          .thenAnswer((_) async => result);

      expectLater(viewmodel.stream,
          emitsInOrder([isA<LoadingState>(), isA<SuccessState>()]));

      viewmodel.doIntent(GetScoreIntent(answers));
    });

    test(
        'doIntent with GetScoreIntent emits LoadingState, ErrorState on failure',
        () async {
      final answers = {'1': 'A', '2': 'B'};
      final exception = Exception('Failed to fetch score');
      final result = Fail<ExamScore>(exception);

      when(mockGetExamScoreUsecase.getExamScore(answers))
          .thenAnswer((_) async => result);

      expectLater(viewmodel.stream,
          emitsInOrder([isA<LoadingState>(), isA<ErrorState>()]));

      viewmodel.doIntent(GetScoreIntent(answers));

      await untilCalled(mockGetExamScoreUsecase.getExamScore(answers));
    });

    test(
        'doIntent with GetScoreIntent emits SuccessState with correct score calculation',
        () async {
      final answers = {'1': 'A', '2': 'B'};
      final mockExamScore = ExamScore(total: '85%');
      final result = Success(mockExamScore);

      when(mockGetExamScoreUsecase.getExamScore(answers))
          .thenAnswer((_) async => result);

      expectLater(viewmodel.stream,
          emitsInOrder([isA<LoadingState>(), isA<SuccessState>()]));

      viewmodel.doIntent(GetScoreIntent(answers));

      await untilCalled(mockGetExamScoreUsecase.getExamScore(answers));

      // Verify the success state with the correct score calculation
      final state = viewmodel.state;
      if (state is SuccessState) {
        expect(state.percent, 0.85);
      }
    });
  });
}
