import 'package:elevate_online_exam/common/api_result.dart';
import 'package:elevate_online_exam/data/contracts/Exam/exam_online_datasource.dart';
import 'package:elevate_online_exam/data/responseimpl/exam_questions_repo.dart/exam_questions_repo_impl.dart';
import 'package:elevate_online_exam/domain/models/exam_questions/exam_questions.dart';
import 'package:elevate_online_exam/domain/models/exam_score.dart';
import 'package:elevate_online_exam/domain/repos/exam_questions_repo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'exam_questions_repo_impl_test.mocks.dart';

@GenerateMocks([ExamOnlineDatasource])
void main() {
  late ExamQuestionsRepo examQuestionsRepo;
  late MockExamOnlineDatasource mockExamOnlineDatasource;

  setUp(() {
    mockExamOnlineDatasource = MockExamOnlineDatasource();
    examQuestionsRepo = ExamQuestionsRepoImpl(mockExamOnlineDatasource);
  });

  group('ExamQuestionsRepoImpl Tests', () {
    test('getExamQuestions calls getExamQuestions on ExamOnlineDatasource',
        () async {
      final examId = '12345';
      final mockExamQuestions = ExamQuestions(
        questions: [],
        duration: 60,
      );
      provideDummy<Result<ExamQuestions>>(Success(ExamQuestions()));
      final successResult = Success(mockExamQuestions);

      when(mockExamOnlineDatasource.getExamQuestions(examId))
          .thenAnswer((_) async => successResult);

      final result = await examQuestionsRepo.getExamQuestions(examId);

      expect(result, successResult);
      verify(mockExamOnlineDatasource.getExamQuestions(examId)).called(1);
    });

    test('getExamQuestions returns Fail when ExamOnlineDatasource fails',
        () async {
      final examId = '12345';
      final exception = Exception('Failed to fetch exam questions');
      provideDummy<Result<ExamQuestions>>(Fail(Exception()));
      final failResult = Fail<ExamQuestions>(exception);

      when(mockExamOnlineDatasource.getExamQuestions(examId))
          .thenAnswer((_) async => failResult);

      final result = await examQuestionsRepo.getExamQuestions(examId);

      expect(result, failResult);
      verify(mockExamOnlineDatasource.getExamQuestions(examId)).called(1);
    });

    test('getExamScore calls checkAnswers on ExamOnlineDatasource', () async {
      final answers = {'question1': 'answer1', 'question2': 'answer2'};
      final mockExamScore = ExamScore(total: '85%', correct: 10, wrong: 12);
      provideDummy<Result<ExamScore>>(Success(ExamScore()));
      final successResult = Success(mockExamScore);

      when(mockExamOnlineDatasource.checkAnswers(answers))
          .thenAnswer((_) async => successResult);

      final result = await examQuestionsRepo.getExamScore(answers);

      expect(result, successResult);
      verify(mockExamOnlineDatasource.checkAnswers(answers)).called(1);
    });

    test('getExamScore returns Fail when ExamOnlineDatasource fails', () async {
      final answers = {'question1': 'answer1', 'question2': 'answer2'};
      final exception = Exception('Failed to fetch exam score');
      provideDummy<Result<ExamScore>>(Fail(Exception()));
      final failResult = Fail<ExamScore>(exception);

      when(mockExamOnlineDatasource.checkAnswers(answers))
          .thenAnswer((_) async => failResult);

      final result = await examQuestionsRepo.getExamScore(answers);

      expect(result, failResult);
      verify(mockExamOnlineDatasource.checkAnswers(answers)).called(1);
    });
  });
}
