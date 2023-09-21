import 'package:flutter/material.dart';
import 'dart:async';

class TypingSpeedTestGame extends StatefulWidget {
  const TypingSpeedTestGame({super.key});

  @override
  State<TypingSpeedTestGame> createState() => _TypingSpeedTestGameState();
}

class _TypingSpeedTestGameState extends State<TypingSpeedTestGame> {
  TextEditingController textEditingController = TextEditingController();
  FocusNode inputNode = FocusNode();
  static const maxTime = 100;
  int timeLeft = maxTime;
  int mistakes = 0;
  int wpm = 0;
  int cpm = 0;
  String typedText = '';
  List<Color?> correctCharacters = List.filled(paragraphs[0].length, null);
  late Timer timer;
  bool isTypingComplete = false;
  int currentCursorPosition = -1;
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

    wpm = ((totalWords / elapsedTime) * 60).round();
    cpm = ((totalChars / elapsedTime) * 60).round();
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

      // Cập nhật vị trí hiện tại của dấu "|"
      currentCursorPosition = typedText.length - 1;

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

  void openKeyboard() {
    FocusScope.of(context).requestFocus(inputNode);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF17A2B8),
        body: Container(
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
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
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
                    'CPM: $cpm',
                    style: const TextStyle(
                      color: Colors.blue,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Center(
                  child: SizedBox(
                    width: double.infinity,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          for (int i = 0; i < paragraphs[0].length; i++)
                            WidgetSpan(
                              child: Text(
                                paragraphs[0][i] +
                                    (i == currentCursorPosition ? '|' : ''),
                                style: TextStyle(
                                  fontSize: 21,
                                  letterSpacing: 1,
                                  color: correctCharacters[i] ?? Colors.grey,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Time Left: $timeLeft s',
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              TextField(
                controller: textEditingController,
                onChanged: handleInput,
                enabled: timeLeft > 0,
                autofocus: true,
                focusNode: inputNode,
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
    );
  }
}

final List<String> paragraphs = [
  'New Text  New Text New Text New Text New Text New Text New Text',
];
