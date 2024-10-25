import 'dart:developer';

import 'package:elevate_online_exam/common/api_result.dart';
import 'package:elevate_online_exam/domain/models/subject.dart';
import 'package:elevate_online_exam/domain/usecases/subject/get_subjects_usecase.dart';
import 'package:elevate_online_exam/presentaion/views/subject/view_model/subject_intent.dart';
import 'package:elevate_online_exam/presentaion/views/subject/view_model/subject_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class SubjectViewmodel extends Cubit<SubjectState> {
  final GetSubjectsUsecase _getSubjectsUsecase;
  SubjectViewmodel(this._getSubjectsUsecase) : super(SubjectInitState());

  void doIntent(SubjectIntent intent) {
    switch (intent) {
      case FetchSubjectsIntent():
         log("_____Fetched");
        _getSubjects();
        break;
    }
  }

  void _getSubjects() async {
    emit(SubjectLoadingState());
    var result = await _getSubjectsUsecase.getSubjects();

    switch (result) {
      case Success<List<Subject?>>():
        emit(SubjectSuccessState(result.data!));

      case Fail<List<Subject?>>():
        emit(SubjectErrorState(result.exception));
    }
  }
}
