import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TimeUpDialog extends StatelessWidget {
  final Function() endExam;
  const TimeUpDialog({super.key, required this.endExam});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: AlertDialog(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/svgs/hour_glass.svg"),
            const Text(
              'Time out !!',
              style: TextStyle(fontSize: 24, color: Colors.red),
            )
          ],
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          SizedBox(
            height: 40,
            width: 191,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  endExam();
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF02369C),
                    foregroundColor: Colors.white),
                child: const Text('View score')),
          )
        ],
      ),
    );
  }
}
