import 'dart:math';

import 'package:flutter/material.dart';

class CircularIndicatorPainter extends CustomPainter {
  final double progress;
  final double gapSize;

  CircularIndicatorPainter({required this.progress, this.gapSize = 16.0});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint backgroundPaint = Paint()
      ..color = Colors.red
      ..strokeWidth = 6
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final Paint progressPaint = Paint()
      ..color = Colors.blue[900]!
      ..strokeWidth = 6
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final double radius =
        (size.width / 2) - 6.0; // Adjust radius based on strokeWidth
    final Offset center = Offset(size.width / 2, size.height / 2);

    // Total angle of the circle
    final double totalAngle = 2 * pi;
    // Define the gap in radians
    final double gapAngle = gapSize * (pi / 180);
    // Angle for the progress, adjusted to leave a gap on both sides
    final double progressAngle = (totalAngle - 2 * gapAngle) * progress;

    // Draw the background red arc, leaving gaps on both ends
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      progressAngle + (2 * gapAngle), // Start angle for red background
      totalAngle -
          progressAngle -
          (2 * gapAngle), // Sweep angle for red background
      false,
      backgroundPaint,
    );

    // Draw the blue progress arc, leaving a gap at the start
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      gapAngle, // Start angle with gap
      progressAngle, // Sweep angle for blue progress
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
