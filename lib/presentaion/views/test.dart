import 'package:elevate_online_exam/domain/usecases/examQuestions/get_exam_questions_usecase.dart';
import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  final GetExamQuestionsUsecase _examQuestionsUsecase;
  const Test(this._examQuestionsUsecase, {super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  Future<void> get() async {
    await widget._examQuestionsUsecase
        .getExamQuestions("670070a830a3c3c1944a9c63")
        .then(
          (value) => print(value.toString()),
        );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
