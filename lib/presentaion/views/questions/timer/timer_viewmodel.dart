import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimerViewmodel extends Cubit<int> {
  TimerViewmodel() : super(initialTime);
  static int initialTime = 10 * 60;
  Timer? _timer;
  void startTimer(int duration) {
    initialTime = duration * 60;
    _timer?.cancel();
    emit(initialTime);

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state > 0) {
        emit(state - 1); // Decrement time
      } else {
        timer.cancel();
        emit(0); // End time
      }
    });
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
