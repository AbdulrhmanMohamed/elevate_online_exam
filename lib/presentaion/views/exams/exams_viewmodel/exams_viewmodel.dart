import 'package:elevate_online_exam/common/api_result.dart';
import 'package:elevate_online_exam/domain/models/exam.dart';
import 'package:elevate_online_exam/domain/usecases/exams/get_exams_bySubject_usecase.dart';
import 'package:elevate_online_exam/presentaion/views/exams/exams_viewmodel/exams_intent.dart';
import 'package:elevate_online_exam/presentaion/views/exams/exams_viewmodel/exams_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class ExamsViewmodel extends Cubit<ExamsState> {
  GetExamsBySubjectUsecase _getExamsBySubjectUsecase;

  ExamsViewmodel(this._getExamsBySubjectUsecase) : super(ExamsInitialState());

  doIntent(ExamsIntent intent) {
    switch (intent) {
      case GetExamsBySubjectIntent():
        _getExamBySubject(intent.subjectId);
      // TODO: Handle this case.
    }
  }

  void _getExamBySubject(String subjectId) async{
    emit(ExamsLoadingState());

    var result= await _getExamsBySubjectUsecase.getExamsBySubject(subjectId);

    switch(result){
      case Success<List<Exam?>>():
        emit(ExamsSuccessState(result.data));
        // TODO: Handle this case.
      case Fail<List<Exam?>>():
      emit(ExamsErrorState(result.exception));
        // TODO: Handle this case.
    }
  }
}
