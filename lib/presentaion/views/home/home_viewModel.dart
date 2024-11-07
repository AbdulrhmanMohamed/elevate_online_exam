import 'dart:developer';

import 'package:elevate_online_exam/presentaion/views/profile/profile_screen.dart';
import 'package:elevate_online_exam/presentaion/views/result/result_screen.dart';
import 'package:elevate_online_exam/presentaion/views/subject/subject_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeViewmodel extends Cubit<HomeState> {
  int currentIndex = 0;
  final namedNavs = {
    "Home": 0,
    "Results": 1,
    "Profile": 2,
  };
  List<NavigationDestination> navigationItems = [
    const NavigationDestination(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    const NavigationDestination(
        icon: Icon(Icons.note_alt_rounded), label: 'Result'),
    const NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
  ];
  List<Widget> screens = [
    SubjectScreen(),
    const ResultScreen(),
     ProfileScreen()
  ];

  HomeViewmodel() : super(HomeInitial());

  void onPageChange(int index) {
    currentIndex = index;
    log("===============what is the currentIndex $currentIndex");
    emit(HomeChangePage());
  }

  void startPage(String navName) {
    if (namedNavs.containsKey(navName)) {
      currentIndex = namedNavs[navName]!;
      emit(HomeChangePage());
    }
  }
}

sealed class HomeState {}

class HomeInitial extends HomeState {}

class HomeChangePage extends HomeState {}
