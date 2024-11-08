import 'package:elevate_online_exam/common/api_result.dart';
import 'package:elevate_online_exam/presentaion/views/questions/questions_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:elevate_online_exam/domain/models/exam_questions/exam_questions.dart';
import 'package:elevate_online_exam/domain/models/exam_questions/question.dart';
import 'package:elevate_online_exam/domain/usecases/examQuestions/get_exam_questions_usecase.dart';

import 'questions_viewmodel_test.mocks.dart';

@GenerateMocks([GetExamQuestionsUsecase])
void main() {
  late QuestionsViewmodel viewmodel;
  late MockGetExamQuestionsUsecase mockExamQuestionsUsecase;

  setUp(() {
    mockExamQuestionsUsecase = MockGetExamQuestionsUsecase();
    viewmodel = QuestionsViewmodel(mockExamQuestionsUsecase);
    provideDummy<Result<ExamQuestions>>(Success(ExamQuestions()));
    provideDummy<Result<ExamQuestions>>(Fail(Exception()));
  });

  group('QuestionsViewmodel Tests', () {
    test('initial state is InitialState', () {
      expect(viewmodel.state, isA<InitialState>());
    });

    test(
        'doIntent with FetchQuestionsByIdIntent emits LoadingState, SuccessState on success',
        () async {
      final examId = '123';
      final mockExamQuestions = ExamQuestions(
        questions: [
          Question(
              id: '1',
              type: 'single_choice',
              answers: [],
              correct: '',
              createdAt: DateTime.now(),
              question: ''),
        ],
        duration: 60,
      );
      final result = Success(mockExamQuestions);
      when(mockExamQuestionsUsecase.getExamQuestions(examId))
          .thenAnswer((_) async => result);

      expectLater(
          viewmodel.stream,
          emitsInOrder(
              [isA<LoadingState>(), isA<SingleChoiceQuestionState>()]));

      viewmodel.doIntent(FetchQuestionsByIdIntent(examId));
    });

    test(
        'doIntent with FetchQuestionsByIdIntent emits LoadingState, ErrorState on failure',
        () async {
      final examId = '123';
      final exception = Exception('Failed to fetch questions');
      final result = Fail<ExamQuestions>(exception);
      when(mockExamQuestionsUsecase.getExamQuestions(examId))
          .thenAnswer((_) async => result);

      expectLater(viewmodel.stream,
          emitsInOrder([isA<LoadingState>(), isA<ErrorState>()]));

      viewmodel.doIntent(FetchQuestionsByIdIntent(examId));

      await untilCalled(mockExamQuestionsUsecase.getExamQuestions(examId));
    });

    test('doIntent with NextQuestionIntent navigates to next question',
        () async {
      final mockExamQuestions = ExamQuestions(
        questions: [
          Question(
              id: '1',
              type: 'single_choice',
              answers: [],
              correct: '',
              createdAt: DateTime.now(),
              question: ''),
          Question(
              id: '2',
              type: 'single_choice',
              answers: [],
              correct: '',
              createdAt: DateTime.now(),
              question: ''),
        ],
        duration: 60,
      );
      final result = Success(mockExamQuestions);
      when(mockExamQuestionsUsecase.getExamQuestions(any))
          .thenAnswer((_) async => result);

      viewmodel.doIntent(FetchQuestionsByIdIntent('123'));
      await untilCalled(mockExamQuestionsUsecase.getExamQuestions(any));

      viewmodel.doIntent(NextQuestionIntent());

      expect(viewmodel.questionCount, 1);
      expect(viewmodel.state, isA<SingleChoiceQuestionState>());
    });

    test('doIntent with PrevQuestionIntent navigates to previous question',
        () async {
      final mockExamQuestions = ExamQuestions(
        questions: [
          Question(
              id: '1',
              type: 'single_choice',
              answers: [],
              correct: '',
              createdAt: DateTime.now(),
              question: ''),
          Question(
              id: '2',
              type: 'single_choice',
              answers: [],
              correct: '',
              createdAt: DateTime.now(),
              question: ''),
        ],
        duration: 60,
      );
      final result = Success(mockExamQuestions);
      when(mockExamQuestionsUsecase.getExamQuestions(any))
          .thenAnswer((_) async => result);

      viewmodel.doIntent(FetchQuestionsByIdIntent('123'));
      await untilCalled(mockExamQuestionsUsecase.getExamQuestions(any));

      viewmodel.doIntent(NextQuestionIntent());
      viewmodel.doIntent(PrevQuestionIntent());

      expect(viewmodel.questionCount, 0);
      expect(viewmodel.state, isA<SingleChoiceQuestionState>());
    });

    test('doIntent with PickSingleAnswerIntent updates answersMap', () async {
      final mockExamQuestions = ExamQuestions(
        questions: [
          Question(
              id: '1',
              type: 'single_choice',
              answers: [],
              correct: '',
              createdAt: DateTime.now(),
              question: ''),
        ],
        duration: 60,
      );
      final result = Success(mockExamQuestions);
      when(mockExamQuestionsUsecase.getExamQuestions(any))
          .thenAnswer((_) async => result);

      viewmodel.doIntent(FetchQuestionsByIdIntent('123'));
      await untilCalled(mockExamQuestionsUsecase.getExamQuestions(any));

      final answerKey = 'A';
      viewmodel.doIntent(PickSingleAnswerIntent(answerKey));

      expect(viewmodel.answersMap, containsPair('1', answerKey));
    });
  });
}
