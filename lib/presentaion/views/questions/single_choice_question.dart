import 'package:elevate_online_exam/domain/models/exam_questions/question.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SingleChoiceQuestion extends StatefulWidget {
  final Question question;
  final Function(String answerKey) pickSingleAnswer;
  final String? answer;
  const SingleChoiceQuestion(
      {super.key,
      required this.question,
      required this.pickSingleAnswer,
      this.answer});

  @override
  State<SingleChoiceQuestion> createState() => _SingleChoiceQuestionState();
}

class _SingleChoiceQuestionState extends State<SingleChoiceQuestion> {
  String? _selectedchoice;
  @override
  void didUpdateWidget(SingleChoiceQuestion oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.question.id != widget.question.id) {
      setState(() {
        _selectedchoice = widget.answer;
      });
    }
  }

  void _changeChoice(String? value) {
    setState(() {
      _selectedchoice = value;
      widget.pickSingleAnswer(value!);
    });
  }

  @override
  Widget build(BuildContext context) {
    final answers = widget.question.answers!;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.question.question!,
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            height: 256.h,
            width: double.infinity,
            child: ListView.builder(
              padding: const EdgeInsets.all(0),
              itemCount: answers.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        color: _selectedchoice == answers[index].key
                            ? const Color(0xFFCCD7EB)
                            : const Color(0xFFEDEFF3)),
                    child: RadioListTile<String>(
                      tileColor: null,
                      title: Text(
                        answers[index].answer!,
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.w400),
                      ),
                      groupValue: _selectedchoice,
                      activeColor: Colors.blue[900],
                      value: answers[index].key!,
                      onChanged: _changeChoice,
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
