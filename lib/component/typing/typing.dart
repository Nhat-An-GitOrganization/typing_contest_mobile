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
  static const maxTime = 50;
  int timeLeft = maxTime;
  int mistakes = 0;
  int wpm = 0;
  late String typedText;
  List<Color?> correctCharacters = List.filled(paragraphs[0].length, null);
  late Timer timer;
  bool isTypingComplete = false;
  double currentCursorPosition = -1;
  ScrollController _scrollController = ScrollController();
  int tempLength = 0;
  late String initialText;
  bool isBackspace = false;

  @override
  void initState() {
    typedText = '';
    textEditingController = TextEditingController(text: typedText);
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
    return accuracy.isNaN ? 0 : accuracy;
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
      dismissOnTouchOutside: false,
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
                opacity: 1.0,
                child: TextFormField(
                  controller: textEditingController,
                  onChanged: (input) {
                    setState(() {
                      mistakes = 0;
                      for (int i = 0; i < input.length; i++) {
                        if (i < paragraphs[0].length) {
                          if (input[i] != paragraphs[0][i]) {
                            mistakes++;
                            correctCharacters[i] = Colors.red;
                          } else {
                            correctCharacters[i] = Colors.green;
                          }
                        }
                      }
                      // Xóa các ký tự nhập sai khi người dùng xóa
                      if (input.length < paragraphs[0].length && !isBackspace) {
                        for (int i = input.length;
                            i < paragraphs[0].length;
                            i++) {
                          correctCharacters[i] = null;
                        }
                      }
                      if (input.length == paragraphs[0].length) {
                        // Check if typedText matches the original paragraph
                        isTypingComplete = true;
                        timer.cancel();
                        _showResultDialog(); // Display the result dialog
                      }

                      // Cập nhật vị trí hiện tại của dấu "|"
                      currentCursorPosition = input.length - 1;
                      calculateStats();
                      int tempLength =
                          input.length; // Lưu trữ giá trị typedText.length
                      if (tempLength % 80 == 0) {
                        _scrollController.animateTo(
                          _scrollController.offset +
                              60, // Khoảng cần di chuyển (30px)
                          curve: Curves.linear, // Đường cong di chuyển
                          duration: const Duration(
                              milliseconds: 500), // Thời gian di chuyển
                        );
                      }
                    });

                    if (textEditingController.text.length < typedText.length && isBackspace) {
                      textEditingController.text = typedText;
                    } else {
                      setState(() {
                        typedText = textEditingController.text;
                      });
                    }
                  },
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
  "The sun was setting on the horizon, casting a warm golden glow across the peaceful meadows. I pondered the mysteries of the",
];
