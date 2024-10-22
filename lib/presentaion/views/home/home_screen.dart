import 'package:elevate_online_exam/presentaion/helper/router_helper.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HOme Screen"),
        leading: IconButton(
            onPressed: () => {Navigator.pushNamed(context, AppRoutes.login)},
            icon: const Icon(Icons.arrow_back)),
      ),
      body: const Center(
        child: Text("HomeScreen"),
      ),
    );
  }
}
