import 'package:elevate_online_exam/domain/models/exam.dart';

sealed class ExamsState {}

class ExamsInitialState extends ExamsState{}
class ExamsLoadingState extends ExamsState{}
class ExamsSuccessState extends ExamsState{
final List<Exam?> ?exams;
ExamsSuccessState(this.exams);
}
class ExamsErrorState extends ExamsState{
final Exception ?exception;
ExamsErrorState(this.exception);
}