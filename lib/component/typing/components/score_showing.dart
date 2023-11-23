import 'package:flutter/material.dart';

class ScoreShowing extends StatelessWidget {
  const ScoreShowing({
    super.key,
    required this.mistakes,
    required this.wpm,
    required this.timeLeft,
  });

  final int mistakes;
  final int wpm;
  final int timeLeft;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Mistakes: $mistakes',
          style: const TextStyle(
            color: Colors.red,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'WPM: $wpm',
          style: const TextStyle(
            color: Colors.blue,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Time: $timeLeft',
          style: const TextStyle(
            color: Colors.blue,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}