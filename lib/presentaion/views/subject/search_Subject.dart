import 'package:elevate_online_exam/presentaion/helper/app_sizes.dart';
import 'package:flutter/material.dart';

class SearchSubject extends StatelessWidget {
  const SearchSubject({super.key});
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSizes.s20),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSizes.s20),
          ),
          prefixIcon: const Icon(Icons.search),
          hintText: "Search"),
    );
  }
}
