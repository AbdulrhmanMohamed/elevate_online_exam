import 'package:elevate_online_exam/common/api_result.dart';
import 'package:elevate_online_exam/domain/models/exam_questions/exam_questions.dart';
import 'package:elevate_online_exam/domain/repos/exam_questions_repo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:elevate_online_exam/domain/usecases/examQuestions/get_exam_questions_usecase.dart';

import 'get_exam_questions_usecase_test.mocks.dart';

@GenerateMocks([ExamQuestionsRepo])
void main() {
  late GetExamQuestionsUsecase getExamQuestionsUsecase;
  late MockExamQuestionsRepo mockExamQuestionsRepo;

  setUp(() {
    mockExamQuestionsRepo = MockExamQuestionsRepo();
    getExamQuestionsUsecase = GetExamQuestionsUsecase(mockExamQuestionsRepo);
    provideDummy<Result<ExamQuestions>>(Success(ExamQuestions()));
    provideDummy<Result<ExamQuestions>>(Fail(Exception()));
  });

  group('GetExamQuestionsUsecase Tests', () {
    test('getExamQuestions calls getExamQuestions on ExamQuestionsRepo',
        () async {
      final examId = 'exam123';
      final mockExamQuestions = ExamQuestions(
        questions: [],
        duration: 60,
      );
      final successResult = Success(mockExamQuestions);

      when(mockExamQuestionsRepo.getExamQuestions(examId))
          .thenAnswer((_) async => successResult);

      final result = await getExamQuestionsUsecase.getExamQuestions(examId);

      expect(result, successResult);
      verify(mockExamQuestionsRepo.getExamQuestions(examId)).called(1);
    });

    test('getExamQuestions returns Fail when ExamQuestionsRepo fails',
        () async {
      final examId = 'exam123';
      final exception = Exception('Failed to fetch exam questions');
      final failResult = Fail<ExamQuestions>(exception);

      when(mockExamQuestionsRepo.getExamQuestions(examId))
          .thenAnswer((_) async => failResult);

      final result = await getExamQuestionsUsecase.getExamQuestions(examId);

      expect(result, failResult);
      verify(mockExamQuestionsRepo.getExamQuestions(examId)).called(1);
    });
  });
}
