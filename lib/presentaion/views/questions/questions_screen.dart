import 'package:elevate_online_exam/di/di.dart';
import 'package:elevate_online_exam/presentaion/helper/app_sizes.dart';
import 'package:elevate_online_exam/presentaion/helper/router_helper.dart';
import 'package:elevate_online_exam/presentaion/views/questions/exam_questions_screen_data.dart';
import 'package:elevate_online_exam/presentaion/views/questions/next_back_buttons.dart';
import 'package:elevate_online_exam/presentaion/views/questions/questions_progress_indicator.dart';
import 'package:elevate_online_exam/presentaion/views/questions/questions_viewmodel.dart';
import 'package:elevate_online_exam/presentaion/views/questions/single_choice_question.dart';
import 'package:elevate_online_exam/presentaion/views/questions/timer/timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class QuestionsScreen extends StatefulWidget {
  final ExamQuestionsScreenData examQuestionsScreenData;
  const QuestionsScreen({super.key, required this.examQuestionsScreenData});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  @override
  Widget build(BuildContext context) {
    QuestionsViewmodel viewModel = getIt.get<QuestionsViewmodel>();
    void nextQuestion() {
      viewModel.doIntent(NextQuestionIntent());
    }

    void prevQuestion() {
      viewModel.doIntent(PrevQuestionIntent());
    }

    void pickSingleAnswer(String answerKey) {
      viewModel.doIntent(PickSingleAnswerIntent(answerKey));
    }

    void endExam() {
      Navigator.pushNamed(context, AppRoutes.examScore,
          arguments: {"answers": viewModel.answersMap});
    }

    return BlocProvider(
      create: (context) {
        viewModel.doIntent(
            FetchQuestionsByIdIntent(widget.examQuestionsScreenData.examId));
        return viewModel;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Exam',
              style: TextStyle(
                  fontSize: AppSizes.s20.sp, fontWeight: FontWeight.w500)),
          actions: [
            Timer(
              duration: widget.examQuestionsScreenData.examDuration,
              examEnded: () {},
            ),
          ],
        ),
        body: BlocBuilder<QuestionsViewmodel, QuestionsState>(
          builder: (context, state) {
            if (state is LoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is SingleChoiceQuestionState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  QuestionPrgressIndiactor(
                    progress: viewModel.progress!,
                    currentQuestionCount: viewModel.questionCount + 1,
                    numberOfQuestions: viewModel.numberOfQuestions!,
                  ),
                  SingleChoiceQuestion(
                    pickSingleAnswer: pickSingleAnswer,
                    question: state.question,
                    answer: viewModel.answersMap[state.question.id],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: NextBackButtons(
                      nextQuestion: nextQuestion,
                      prevQuestion: prevQuestion,
                      isLastQuestion: (viewModel.numberOfQuestions)! - 1 ==
                          viewModel.questionCount,
                      endExam: endExam,
                    ),
                  ),
                ],
              );
            }

            return Placeholder();
          },
        ),
      ),
    );
  }
}
