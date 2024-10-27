import 'dart:developer';

import 'package:elevate_online_exam/di/di.dart';
import 'package:elevate_online_exam/presentaion/helper/app_sizes.dart';
import 'package:elevate_online_exam/presentaion/views/home/home_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final HomeViewmodel _homeViewmodel = getIt.get<HomeViewmodel>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _homeViewmodel,
      child: BlocBuilder<HomeViewmodel, HomeState>(
        builder: (context, state) {
          return Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              iconSize: AppSizes.s20,
              items: _homeViewmodel.navigationItems,
              currentIndex: _homeViewmodel.currentIndex,
              onTap: (index) {
                _homeViewmodel.onPageChange(index);
                log("======CurrentPage ===${_homeViewmodel.currentIndex}");
              },
            ),
            body: _homeViewmodel.screens[_homeViewmodel.currentIndex],
          );
        },
      ),
    );
  }
}
