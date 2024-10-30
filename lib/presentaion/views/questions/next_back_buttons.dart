import 'package:elevate_online_exam/presentaion/helper/app_sizes.dart';
import 'package:flutter/material.dart';

class NextBackButtons extends StatelessWidget {
  final Function() nextQuestion;
  final Function() prevQuestion;
  final Function() endExam;
  final bool isLastQuestion;
  const NextBackButtons(
      {super.key,
      required this.nextQuestion,
      required this.prevQuestion,
      required this.endExam,
      required this.isLastQuestion});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 48,
            child: ElevatedButton(
              onPressed: prevQuestion,
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.blue[900]!, width: 1),
                    borderRadius: BorderRadius.circular(10)),
              ),
              child: Text(
                'Back',
                style: TextStyle(
                    color: Colors.blue[900],
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: AppSizes.s16,
        ),
        Expanded(
          child: SizedBox(
            height: 48,
            child: ElevatedButton(
              onPressed: isLastQuestion ? endExam : nextQuestion,
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[900],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: Text(
                isLastQuestion ? 'Finish' : 'Next',
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
              ),
            ),
          ),
        )
      ],
    );
  }
}
