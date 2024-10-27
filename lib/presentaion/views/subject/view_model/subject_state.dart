import 'package:elevate_online_exam/domain/models/subject.dart';

sealed class SubjectState {}

class SubjectInitState extends SubjectState {}

class SubjectLoadingState extends SubjectState {}

class SubjectSuccessState extends SubjectState {
  final List<Subject?> subjects;

  SubjectSuccessState(this.subjects);
}

class SubjectErrorState extends SubjectState {
  Exception? exception;
  SubjectErrorState(this.exception);
}
