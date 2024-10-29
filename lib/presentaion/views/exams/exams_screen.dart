import 'dart:developer';

import 'package:elevate_online_exam/di/di.dart';
import 'package:elevate_online_exam/domain/models/exam.dart';
import 'package:elevate_online_exam/presentaion/helper/app_sizes.dart';
import 'package:elevate_online_exam/presentaion/helper/color_consts.dart';
import 'package:elevate_online_exam/presentaion/helper/spacing.dart';
import 'package:elevate_online_exam/presentaion/helper/text_styles.dart';
import 'package:elevate_online_exam/presentaion/views/exams/exam_item.dart';
import 'package:elevate_online_exam/presentaion/views/exams/exams_not_found.dart';
import 'package:elevate_online_exam/presentaion/views/exams/exams_screen_data.dart';
import 'package:elevate_online_exam/presentaion/views/exams/exams_viewmodel/exams_intent.dart';
import 'package:elevate_online_exam/presentaion/views/exams/exams_viewmodel/exams_state.dart';
import 'package:elevate_online_exam/presentaion/views/exams/exams_viewmodel/exams_viewmodel.dart';
import 'package:elevate_online_exam/presentaion/views/utils.dart';
import 'package:elevate_online_exam/presentaion/widgets/app_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExamsScreen extends StatelessWidget {
  final ExamsScreenData args;

  ExamsScreen({super.key, required this.args});
  final ExamsViewmodel _examsViewmodel = getIt.get<ExamsViewmodel>();
  @override
  Widget build(BuildContext context) {
    log("What is the Args: $args");
    return BlocProvider(
      create: (context) {
        _examsViewmodel.doIntent(GetExamsBySubjectIntent(args.subjectId!));
        return _examsViewmodel;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            args.subjectName!,
            style: Styles.get_bold(AppSizes.s25, AppColor.black),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(AppSizes.s10),
          child: BlocBuilder<ExamsViewmodel, ExamsState>(
            builder: (context, state) {
              if (state is ExamsLoadingState) {
                return const Center(
                    child: CircularProgressIndicator(
                  color: AppColor.darkBlue,
                ));
              } else if (state is ExamsSuccessState) {
                if (state.exams!.isNotEmpty) {
                  return ListView.separated(
                    separatorBuilder: (context, index) =>
                        vertical_space(AppSizes.s10),
                    itemBuilder: (context, index) {
                      return ExamItem(
                        exam: state.exams?[index],
                      );
                    },
                    itemCount: state.exams!.length,
                  );
                } else {
                  return const ExamsNotFound();
                }
              } else if (state is ExamsErrorState) {
                return Center(
                  child: Text(
                    extractErrorMessage(state.exception),
                    style: Styles.get_bold(AppSizes.s25, AppColor.red),
                  ),
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        ),
      ),
    );
  }
}
