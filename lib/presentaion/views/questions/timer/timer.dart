import 'package:elevate_online_exam/presentaion/views/questions/timer/timer_viewmodel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:elevate_online_exam/presentaion/helper/app_sizes.dart';
import 'package:flutter/material.dart';

class Timer extends StatelessWidget {
  final int duration;
  const Timer({super.key, required this.duration});

  String formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return "$minutes.$secs";
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TimerViewmodel()..startTimer(duration),
      child: Padding(
        padding: const EdgeInsets.only(right: 16),
        child: Row(
          children: [
            SizedBox(
              width: AppSizes.s24.w,
              height: AppSizes.s30.h,
              child: Image.asset(
                'assets/images/alarm_icon.png',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            BlocBuilder<TimerViewmodel, int>(
              builder: (context, remainingTime) {
                print(remainingTime);
                if (remainingTime == 0) {
                  return const Text(
                    "Time's up!",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  );
                }
                return Text(
                  formatTime(remainingTime),
                  style: const TextStyle(fontSize: 20, color: Colors.green),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
