import 'package:elevate_online_exam/common/api_result.dart';
import 'package:elevate_online_exam/domain/models/exam_score.dart';
import 'package:elevate_online_exam/domain/usecases/examQuestions/get_exam_score_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ExamScoreViewmodel extends Cubit<ExamScoreState> {
  final GetExamScoreUsecase _getExamScoreUsecase;
  ExamScoreViewmodel(this._getExamScoreUsecase) : super(InitialState());

  void doIntent(ExamScoreIntent intent) {
    switch (intent) {
      case GetScoreIntent():
        _getExamScore(intent.answers);
    }
  }

  Future<void> _getExamScore(Map<String, String> answers) async {
    emit(LoadingState());
    final examScore = await _getExamScoreUsecase.getExamScore(answers);
    switch (examScore) {
      case Success<ExamScore>():
        {
          double percent = double.parse(examScore.data!.total!
                  .substring(0, examScore.data!.total!.length - 1)) /
              100;
          emit(SuccessState(examScore.data, percent));
        }
      case Fail<ExamScore>():
        emit(ErrorState(examScore.exception));
    }
  }
}

sealed class ExamScoreIntent {}

class GetScoreIntent extends ExamScoreIntent {
  Map<String, String> answers;
  GetScoreIntent(this.answers);
}

sealed class ExamScoreState {}

class InitialState extends ExamScoreState {}

class LoadingState extends ExamScoreState {}

class ErrorState extends ExamScoreState {
  Exception? exception;
  ErrorState(this.exception);
}

class SuccessState extends ExamScoreState {
  ExamScore? examScore;
  double percent;
  SuccessState(this.examScore, this.percent);
}
