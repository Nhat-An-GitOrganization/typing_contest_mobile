import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:typing_contest_mobile/component/ranking/ranking_round_screen.dart';

class TypingSpeedTestGame extends StatefulWidget {
  const TypingSpeedTestGame({super.key});

  @override
  State<TypingSpeedTestGame> createState() => _TypingSpeedTestGameState();
}

class _TypingSpeedTestGameState extends State<TypingSpeedTestGame> {
  TextEditingController textEditingController = TextEditingController();
  FocusNode inputNode = FocusNode();
  static const maxTime = 300;
  int timeLeft = maxTime;
  int mistakes = 0;
  int wpm = 0;
  String typedText = '';
  List<Color?> correctCharacters = List.filled(paragraphs[0].length, null);
  late Timer timer;
  bool isTypingComplete = false;
  double currentCursorPosition = -1;
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    startTimer();
    _scrollController = ScrollController();
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
      typedText = '';
      startTimer();
      _resetTextField();
    });
  }

  void calculateStats() {
    int totalWords = typedText.trim().split(' ').length;
    int elapsedTime = maxTime - timeLeft;

    wpm = ((totalWords / elapsedTime) * 60).round();
  }

  double calculateAccuracy() {
    int correctCharactersCount = 0;

    for (int i = 0; i < typedText.length; i++) {
      if (i < paragraphs[0].length && typedText[i] == paragraphs[0][i]) {
        correctCharactersCount++;
      }
    }

    double accuracy = (correctCharactersCount / typedText.length) * 100;
    return accuracy;
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
      int tempLength = typedText.length; // Lưu trữ giá trị typedText.length

      if (tempLength % 100 == 0) {
        int moveCount = tempLength ~/ 100; // Số lần di chuyển
        _scrollController.animateTo(
          _scrollController.offset +
              (moveCount + 50), // Khoảng cần di chuyển (30px)
          curve: Curves.linear, // Đường cong di chuyển
          duration: const Duration(milliseconds: 500), // Thời gian di chuyển
        );
      }
    });
  }

  void _showResultDialog() {
    int totalTime = maxTime - timeLeft;
    double accuracy = calculateAccuracy();
    AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.scale,
      title: 'Finished',
      desc:
          'WPM: $wpm \n Mistakes: $mistakes  \n Accuracy: ${accuracy.toStringAsFixed(2)}% \n Full time: $totalTime s / $maxTime s',
      btnOkOnPress: () {
        // resetGame();
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (_) => const RankingRoundScreen()));
      },
      btnOkText: 'Done',
    ).show();
  }

  void _resetTextField() {
    textEditingController.clear();
  }

  void openKeyboard() {
    FocusScope.of(context).requestFocus(inputNode);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double progressPercentage = (typedText.length / paragraphs[0].length) * 100;
    double backgroundOpacity = 0.3;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF17A2B8),
        body: Container(
          height: size.height,
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
              Stack(
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
              ),
              SizedBox(
                height: size.height * (20 / size.height),
              ),
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
                    'Time: $timeLeft',
                    style: const TextStyle(
                      color: Colors.blue,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    // Xử lý sự kiện nhấp vào ở đây
                    if (!inputNode.hasFocus) {
                      FocusScope.of(context).requestFocus(inputNode);
                    }
                  },
                  child: Center(
                    child: SingleChildScrollView(
                      controller: _scrollController,
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
              ),
              Opacity(
                opacity: 0.0,
                child: TextField(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final List<String> paragraphs = [
  "The sun was setting on the horizon, casting a warm golden glow across the peaceful meadows. Birds chirped happily, their melodious songs filling the air. A gentle breeze rustled the leaves of the tall oak trees, creating a soothing sound. It was a tranquil evening, perfect for reflection and contemplation. As I walked along the winding path, my mind wandered to distant memories. The laughter of childhood echoed in my ears, reminding me of carefree days spent playing in the fields. I could almost taste the sweetness of ice cream on my tongue, feel the warmth of the summer sun on my skin. The path led me to a small, secluded pond nestled among the trees. Its surface shimmered like a mirror, reflecting the vibrant colors of the surrounding flora. I sat down on a moss-covered rock, observing the dance of dragonflies and the gentle ripples caused by the occasional fish breaking the surface. Lost in my thoughts, I contemplated the passage of time. How quickly it slips through our fingers, like grains of sand in an hourglass. Memories, both joyful and painful, woven into the tapestry of our lives. Each moment a precious gift, never to be repeated. The evening sky transformed into a canvas of breathtaking hues - a masterpiece painted by nature itself. Shades of orange, pink, and purple melted together, creating a stunning panorama. I couldn't help but marvel at the beauty that surrounded me. As darkness descended, stars began to twinkle in the night sky, revealing the vastness of the universe. I pondered the mysteries of the",
];
