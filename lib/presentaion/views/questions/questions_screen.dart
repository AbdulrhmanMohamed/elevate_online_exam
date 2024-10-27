import 'package:elevate_online_exam/di/di.dart';
import 'package:elevate_online_exam/presentaion/helper/app_sizes.dart';
import 'package:elevate_online_exam/presentaion/views/questions/next_back_buttons.dart';
import 'package:elevate_online_exam/presentaion/views/questions/questions_viewmodel.dart';
import 'package:elevate_online_exam/presentaion/views/questions/single_choice_question.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class QuestionsScreen extends StatelessWidget {
  const QuestionsScreen({super.key});

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

    return BlocProvider(
      create: (context) {
        viewModel
            .doIntent(FetchQuestionsByIdIntent("670070a830a3c3c1944a9c63"));
        return viewModel;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Exam',
              style: TextStyle(
                  fontSize: AppSizes.s20.sp, fontWeight: FontWeight.w500)),
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
