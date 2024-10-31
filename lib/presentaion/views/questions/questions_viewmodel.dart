import 'package:elevate_online_exam/common/api_result.dart';
import 'package:elevate_online_exam/domain/models/exam_questions/exam_questions.dart';
import 'package:elevate_online_exam/domain/models/exam_questions/question.dart';
import 'package:elevate_online_exam/domain/usecases/examQuestions/get_exam_questions_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class QuestionsViewmodel extends Cubit<QuestionsState> {
  final GetExamQuestionsUsecase _examQuestionsUsecase;

  QuestionsViewmodel(this._examQuestionsUsecase) : super(InitialState());

  int questionCount = 0;
  ExamQuestions? examQuestions;
  Map<String, String> answersMap = {};
  double? progress;
  int? numberOfQuestions;
  int? duration;
  void doIntent(QuestionScreenIntent intent) {
    switch (intent) {
      case FetchQuestionsByIdIntent():
        _fetchQuestions(intent.examId);
      case NextQuestionIntent():
        _nextQuestion();
      case PrevQuestionIntent():
        _prevQuestion();
      case PickSingleAnswerIntent():
        _pickanswer(intent.answerKey);
    }
  }

  Future<void> _fetchQuestions(String examId) async {
    emit(LoadingState());

    var result = await _examQuestionsUsecase.getExamQuestions(examId);

    switch (result) {
      case Success<ExamQuestions>():
        examQuestions = result.data;
        numberOfQuestions = examQuestions!.questions!.length;
        duration = examQuestions!.duration;
        _showQuestion();
      case Fail<ExamQuestions>():
        emit(ErrorState(result.exception));
    }
  }

  void _updateProgress() {
    progress = (questionCount + 1) / numberOfQuestions!;
  }

  void _showQuestion() {
    Question question = examQuestions!.questions![questionCount];
    if (question.type == 'single_choice') {
      _updateProgress();
      emit(SingleChoiceQuestionState(question));
    }
  }

  void _nextQuestion() {
    if (questionCount < (examQuestions!.questions!.length) - 1) {
      questionCount++;
      _updateProgress();
      _showQuestion();
    }
  }

  void _prevQuestion() {
    if (questionCount > 0) {
      questionCount--;
      _updateProgress();
      _showQuestion();
    }
  }

  void _pickanswer(String answerKey) {
    Question question = examQuestions!.questions![questionCount];
    answersMap[question.id!] = answerKey;
    print("answers : $answersMap \n ====================");
  }
}

sealed class QuestionsState {}

class InitialState extends QuestionsState {}

class LoadingState extends QuestionsState {}

class SingleChoiceQuestionState extends QuestionsState {
  Question question;
  SingleChoiceQuestionState(this.question);
}

class ErrorState extends QuestionsState {
  Exception? exception;
  ErrorState(this.exception);
}

class SuccessState extends QuestionsState {
  ExamQuestions? examQuestions;
  SuccessState(this.examQuestions);
}

sealed class QuestionScreenIntent {}

class FetchQuestionsByIdIntent extends QuestionScreenIntent {
  final String examId;
  FetchQuestionsByIdIntent(this.examId);
}

class NextQuestionIntent extends QuestionScreenIntent {}

class PrevQuestionIntent extends QuestionScreenIntent {}

class PickSingleAnswerIntent extends QuestionScreenIntent {
  final String answerKey;
  PickSingleAnswerIntent(this.answerKey);
}
