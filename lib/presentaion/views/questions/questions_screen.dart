import 'package:elevate_online_exam/di/di.dart';
import 'package:elevate_online_exam/presentaion/views/questions/questions_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuestionsScreen extends StatelessWidget {
  const QuestionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    QuestionsViewmodel viewModel = getIt.get<QuestionsViewmodel>();
    return BlocProvider(
      create: (context) {
        viewModel
            .doIntent(FetchQuestionsByIdIntent("670070a830a3c3c1944a9c63"));
        return viewModel;
      },
      child: Scaffold(
        body: BlocBuilder<QuestionsViewmodel, QuestionsState>(
          builder: (context, state) {
            if (state is LoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is SuccessState) {
              return Center(
                child: Text(state.examQuestions!.questions![0].question!),
              );
            }

            return Placeholder();
          },
        ),
      ),
    );
  }
}
