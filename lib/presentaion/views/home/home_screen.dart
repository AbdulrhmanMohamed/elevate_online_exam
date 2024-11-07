import 'dart:developer';

import 'package:elevate_online_exam/di/di.dart';
import 'package:elevate_online_exam/presentaion/views/home/home_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  String? navName;
  HomeScreen({super.key, this.navName});
  final HomeViewmodel _homeViewmodel = getIt.get<HomeViewmodel>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _homeViewmodel,
      child: BlocBuilder<HomeViewmodel, HomeState>(
        builder: (context, state) {
          if (navName != null) {
            _homeViewmodel.startPage(navName!);
            navName = null;
          }
          return Scaffold(
            bottomNavigationBar: NavigationBar(
              destinations: _homeViewmodel.navigationItems,
              selectedIndex: _homeViewmodel.currentIndex,
              onDestinationSelected: (index) {
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
