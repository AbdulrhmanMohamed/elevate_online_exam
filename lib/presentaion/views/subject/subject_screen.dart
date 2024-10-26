import 'package:elevate_online_exam/di/di.dart';
import 'package:elevate_online_exam/presentaion/helper/app_sizes.dart';
import 'package:elevate_online_exam/presentaion/helper/color_consts.dart';
import 'package:elevate_online_exam/presentaion/helper/spacing.dart';
import 'package:elevate_online_exam/presentaion/helper/strings_manager.dart';
import 'package:elevate_online_exam/presentaion/helper/text_styles.dart';
import 'package:elevate_online_exam/presentaion/views/subject/browse_by_subject.dart';
import 'package:elevate_online_exam/presentaion/views/subject/search_Subject.dart';
import 'package:elevate_online_exam/presentaion/views/subject/subject_list.dart';
import 'package:elevate_online_exam/presentaion/views/subject/view_model/subject_intent.dart';
import 'package:elevate_online_exam/presentaion/views/subject/view_model/subject_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubjectScreen extends StatelessWidget {
  SubjectScreen({super.key});
  final SubjectViewmodel _subjectViewmodel = getIt.get<SubjectViewmodel>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
      _subjectViewmodel.doIntent(FetchSubjectsIntent());
        return _subjectViewmodel;
      },
      child: Scaffold(
          appBar: AppBar(
              title: Text(
            StringsManager.subject,
            style: Styles.get_regular(AppSizes.s22, AppColor.darkBlue),
          )),
          body: Padding(
            padding: const EdgeInsets.all(AppSizes.s15),
            child: Column(
              children: [
                const SearchSubject(),
                vertical_space(AppSizes.s30),
                const BrowseBySubject(),
                vertical_space(AppSizes.s15),
                const Expanded(child: SubjectList()),
              ],
            ),
          )),
    );
  }
}
