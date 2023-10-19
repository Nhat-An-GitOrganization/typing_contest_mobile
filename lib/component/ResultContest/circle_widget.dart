import 'dart:ui';

import 'package:flutter/material.dart';

import 'circle_painter.dart';

class CircleWidget extends StatefulWidget {
  final Color color1;
  final Color color2;
  final double endPercentage;

  CircleWidget({required this.color1, required this.color2, required this.endPercentage});

  @override
  _CircleWidgetState createState() => _CircleWidgetState();
}

class _CircleWidgetState extends State<CircleWidget> with SingleTickerProviderStateMixin {
  double currentPercentage = 1.0;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    startAnimation();
  }

  void startAnimation() {
    _controller.forward(from: 0.0);

    _controller.addListener(() {
      setState(() {
        currentPercentage = lerpDouble(
          currentPercentage,
          widget.endPercentage,
          _controller.value,
        )!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CirclePainter(color1: widget.color1, color2: widget.color2, percentage: currentPercentage),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(CircleWidget oldWidget) {
    if (widget.endPercentage != oldWidget.endPercentage) {
      startAnimation();
    }
    super.didUpdateWidget(oldWidget);
  }
}
