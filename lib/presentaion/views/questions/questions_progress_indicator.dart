import 'package:flutter/material.dart';

class QuestionPrgressIndiactor extends StatelessWidget {
  final double progress;
  final int currentQuestionCount;
  final int numberOfQuestions;
  const QuestionPrgressIndiactor(
      {super.key,
      required this.progress,
      required this.currentQuestionCount,
      required this.numberOfQuestions});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Question $currentQuestionCount of $numberOfQuestions",
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
          ),
          LinearProgressIndicator(
            value: progress,
            backgroundColor: Colors.grey[300],
            valueColor: AlwaysStoppedAnimation<Color>(Colors.blue[900]!),
          ),
        ],
      ),
    );
  }
}
