import 'package:elevate_online_exam/common/api_result.dart';
import 'package:elevate_online_exam/domain/models/exam_score.dart';
import 'package:elevate_online_exam/domain/repos/exam_questions_repo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:elevate_online_exam/domain/usecases/examQuestions/get_exam_score_usecase.dart';

import 'get_exam_score_usecase_test.mocks.dart';

@GenerateMocks([ExamQuestionsRepo])
void main() {
  late GetExamScoreUsecase getExamScoreUsecase;
  late MockExamQuestionsRepo mockExamQuestionsRepo;

  setUp(() {
    mockExamQuestionsRepo = MockExamQuestionsRepo();
    getExamScoreUsecase = GetExamScoreUsecase(mockExamQuestionsRepo);
    provideDummy<Result<ExamScore>>(Success(ExamScore()));
    provideDummy<Result<ExamScore>>(Fail(Exception()));
  });

  group('GetExamScoreUsecase Tests', () {
    test('getExamScore calls getExamScore on ExamQuestionsRepo', () async {
      final answers = {'question1': 'answer1', 'question2': 'answer2'};
      final mockExamScore = ExamScore(total: '85%', correct: 10, wrong: 12);
      final successResult = Success(mockExamScore);

      when(mockExamQuestionsRepo.getExamScore(answers))
          .thenAnswer((_) async => successResult);

      final result = await getExamScoreUsecase.getExamScore(answers);

      expect(result, successResult);
      verify(mockExamQuestionsRepo.getExamScore(answers)).called(1);
    });

    test('getExamScore returns Fail when ExamQuestionsRepo fails', () async {
      final answers = {'question1': 'answer1', 'question2': 'answer2'};
      final exception = Exception('Failed to fetch exam score');
      final failResult = Fail<ExamScore>(exception);

      when(mockExamQuestionsRepo.getExamScore(answers))
          .thenAnswer((_) async => failResult);

      final result = await getExamScoreUsecase.getExamScore(answers);

      expect(result, failResult);
      verify(mockExamQuestionsRepo.getExamScore(answers)).called(1);
    });
  });
}
