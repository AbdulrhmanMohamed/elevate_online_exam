import 'package:elevate_online_exam/common/api_result.dart';
import 'package:elevate_online_exam/domain/models/exam_questions/exam_questions.dart';
import 'package:elevate_online_exam/domain/usecases/examQuestions/get_exam_questions_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class QuestionsViewmodel extends Cubit<QuestionsState> {
  final GetExamQuestionsUsecase _examQuestionsUsecase;
  QuestionsViewmodel(this._examQuestionsUsecase) : super(InitialState());

  void doIntent(QuestionScreenIntent intent) {
    switch (intent) {
      case FetchQuestionsByIdIntent():
        _fetchQuestions(intent.examId);
    }
  }

  Future<void> _fetchQuestions(String examId) async {
    emit(LoadingState());
    var result = await _examQuestionsUsecase.getExamQuestions(examId);

    switch (result) {
      case Success<ExamQuestions>():
        emit(SuccessState(result.data));
      case Fail<ExamQuestions>():
        emit(ErrorState(result.exception));
    }
  }
}

sealed class QuestionsState {}

class InitialState extends QuestionsState {}

class LoadingState extends QuestionsState {}

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
