import 'package:flutter/material.dart';
import 'dart:async';

class TypingSpeedTestGame extends StatefulWidget {
  const TypingSpeedTestGame({super.key});

  @override
  State<TypingSpeedTestGame> createState() => _TypingSpeedTestGameState();
}

class _TypingSpeedTestGameState extends State<TypingSpeedTestGame> {
  TextEditingController textEditingController = TextEditingController();
  static const maxTime = 60;
  int timeLeft = maxTime;
  int mistakes = 0;
  int wpm = 0;
  int cpm = 0;
  String typedText = '';
  List<Color?> correctCharacters = List.filled(paragraphs[0].length, null);
  late Timer timer;
  bool isTypingComplete = false;
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
          _showResultDialog();
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
      _resetTextField();
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
      if (typedText.length == paragraphs[0].length) {
        // Check if typedText matches the original paragraph
        isTypingComplete = true;
        timer.cancel();
        _showResultDialog(); // Display the result dialog
      }
      calculateStats();
    });
  }

  void _showResultDialog() {
    int totalTime = maxTime - timeLeft;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Typing Test Result'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Total time: $totalTime s / $maxTime s'),
              Text('Mistakes: $mistakes'),
              Text('WPM: $wpm'),
              Text('CPM: $cpm'),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                resetGame();
              },
              child: const Text('Try Again'),
            ),
          ],
        );
      },
    );
  }

  void _resetTextField() {
    textEditingController.clear();
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
                  ],
                ),
                const SizedBox(height: 17),
                TextField(
                  controller: textEditingController,
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
];
