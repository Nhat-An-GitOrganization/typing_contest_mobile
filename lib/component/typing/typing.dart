import 'package:flutter/material.dart';
import 'dart:async';

class TypingSpeedTestGame extends StatefulWidget {
  const TypingSpeedTestGame({super.key});

  @override
  State<TypingSpeedTestGame> createState() => _TypingSpeedTestGameState();
}

class _TypingSpeedTestGameState extends State<TypingSpeedTestGame> {
  static const maxTime = 60;
  int timeLeft = maxTime;
  int mistakes = 0;
  int wpm = 0;
  int cpm = 0;
  String typedText = '';
  List<Color?> correctCharacters = List.filled(paragraphs[0].length, null);
  late Timer timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (timeLeft > 0) {
          timeLeft--;
        } else {
          timer.cancel();
        }
      });
    });
  }

  void resetGame() {
    setState(() {
      timeLeft = maxTime;
      mistakes = 0;
      wpm = 0;
      cpm = 0;
      typedText = '';
      startTimer();
    });
  }

  void calculateStats() {
    int totalChars = typedText.length;
    int totalWords = typedText.trim().split(' ').length;
    int elapsedTime = maxTime - timeLeft;

    wpm = (totalWords / elapsedTime * 60).round();
    cpm = (totalChars / elapsedTime * 60).round();
  }

  void handleInput(String input) {
    setState(() {
      typedText = input;
      mistakes = 0;

      for (int i = 0; i < typedText.length; i++) {
        if (i < paragraphs[0].length) {
          if (typedText[i] != paragraphs[0][i]) {
            mistakes++;
            correctCharacters[i] = Colors.red;
          } else {
            correctCharacters[i] = Colors.green;
          }
        }
      }

      // Xóa các ký tự nhập sai khi người dùng xóa
      if (typedText.length < paragraphs[0].length) {
        for (int i = typedText.length; i < paragraphs[0].length; i++) {
          correctCharacters[i] = null;
        }
      }

      calculateStats();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF17A2B8),
        body: Center(
          child: Container(
            width: 770,
            padding: const EdgeInsets.all(35),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  offset: const Offset(0, 10),
                  blurRadius: 15,
                ),
              ],
            ),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          for (int i = 0; i < paragraphs[0].length; i++)
                            TextSpan(
                              text: paragraphs[0][i],
                              style: TextStyle(
                                fontSize: 21,
                                letterSpacing: 1,
                                color: correctCharacters[i] ?? Colors.grey,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 17),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Time Left: $timeLeft s'),
                    Text('Mistakes: $mistakes'),
                    Text('WPM: $wpm'),
                    Text('CPM: $cpm'),
                    ElevatedButton(
                      onPressed: resetGame,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        backgroundColor: const Color(0xFF17A2B8),
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('Try Again'),
                    ),
                  ],
                ),
                const SizedBox(height: 17),
                TextField(
                  onChanged: handleInput,
                  enabled: timeLeft > 0,
                  autofocus: true,
                  style: const TextStyle(fontSize: 18),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Start typing here...',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

final List<String> paragraphs = [
  'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
  'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
  'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
];
