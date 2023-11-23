import 'package:flutter/material.dart';

class ProgressPercentage extends StatelessWidget {
  const ProgressPercentage({
    super.key,
    required this.backgroundOpacity,
    required this.progressPercentage,
  });

  final double backgroundOpacity;
  final double progressPercentage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 25,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(backgroundOpacity),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        LinearProgressIndicator(
          value: progressPercentage / 100,
          backgroundColor: Colors.transparent,
          valueColor:
              const AlwaysStoppedAnimation<Color>(Colors.green),
          minHeight: 25,
          borderRadius: BorderRadius.circular(20),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: Text(
              '${progressPercentage.toStringAsFixed(0)}%',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}