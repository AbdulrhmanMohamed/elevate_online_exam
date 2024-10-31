sealed class ExamsIntent {}

class GetExamsBySubjectIntent extends ExamsIntent {
  final String subjectId;
  GetExamsBySubjectIntent(this.subjectId);
}
