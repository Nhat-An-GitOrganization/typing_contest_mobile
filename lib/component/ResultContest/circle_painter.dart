import 'package:flutter/material.dart';
import 'dart:math';

class CirclePainter extends CustomPainter {
  final Color color1;
  final Color color2;
  final double percentage;

  CirclePainter({required this.color1, required this.color2, required this.percentage});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width / 2, size.height / 2);

    final paint1 = Paint()
      ..color = color1
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10.0;
    final sweepAngle = 2 * pi * percentage / 100;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      sweepAngle,
      false,
      paint1,
    );

    final textPainter = TextPainter(
      text: TextSpan(
        text: '${percentage.toStringAsFixed(0)}%',
        style: TextStyle(
          color: color1,
          fontSize: 20.0,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );
    final textX = (size.width - textPainter.width) / 2;
    final textY = (size.height - textPainter.height) / 2;
    textPainter.paint(canvas, Offset(textX, textY));

    final paint2 = Paint()
      ..color = color2
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10.0;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2 + sweepAngle,
      2 * pi - sweepAngle,
      false,
      paint2,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
