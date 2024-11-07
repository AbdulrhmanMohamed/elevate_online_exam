class ExamScore {
  int? correct;
  int? wrong;
  String? total;

  ExamScore({this.correct, this.wrong, this.total});

  factory ExamScore.fromJson(Map<String, dynamic> json) => ExamScore(
        correct: json['correct'] as int?,
        wrong: json['wrong'] as int?,
        total: json['total'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'correct': correct,
        'wrong': wrong,
        'total': total,
      };
}
