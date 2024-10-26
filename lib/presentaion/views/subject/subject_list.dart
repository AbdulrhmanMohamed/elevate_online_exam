import 'package:elevate_online_exam/presentaion/helper/spacing.dart';
import 'package:elevate_online_exam/presentaion/views/subject/subject_item.dart';
import 'package:elevate_online_exam/presentaion/views/subject/view_model/subject_state.dart';
import 'package:elevate_online_exam/presentaion/views/subject/view_model/subject_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubjectList extends StatelessWidget {
  const SubjectList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubjectViewmodel, SubjectState>(
      builder: (context, state) {

       if(state is SubjectLoadingState){
        return const Center(child: CircularProgressIndicator(),);
       }
       else if (state is SubjectSuccessState){
       
        return ListView.separated(
      
            separatorBuilder: (context, index) => vertical_space(20),
            itemCount: state.subjects.length,
            itemBuilder: (context, index) {
              return SubjectItem(
               subject: state.subjects[index]!,
              );
            });
       }
       return const SizedBox();
      },
    );
  }
}
