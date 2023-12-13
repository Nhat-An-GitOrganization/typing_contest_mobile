import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:typing_contest_mobile/component/ranking/caroulsel_Ranking.dart';
import 'dart:async';

import 'components/progress_percent.dart';
import 'components/score_showing.dart';
import 'components/showing_text.dart';

class TypingSpeedTestGame extends StatefulWidget {
  const TypingSpeedTestGame({Key? key}) : super(key: key);

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
        Navigator.pop(context);
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
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: size.height,
          padding: const EdgeInsets.all(35),
          decoration: BoxDecoration(
            color: isDarkMode
            ? const Color.fromARGB(255, 58, 69, 75)
            : const Color.fromARGB(255, 255, 255, 255),
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
              ProgressPercentage(
                backgroundOpacity: backgroundOpacity,
                progressPercentage: progressPercentage,
              ),
              SizedBox(height: size.height * (20 / size.height)),
              ScoreShowing(mistakes: mistakes, wpm: wpm, timeLeft: timeLeft),
              SizedBox(height: size.height * 0.04),
              ShowingText(
                paragraphs: paragraphs,
                inputNode: inputNode,
                scrollController: _scrollController,
                currentCursorPosition: currentCursorPosition,
                correctCharacters: correctCharacters,
              ),
              textTyping(),
            ],
          ),
        ),
      ),
    );
  }

  Opacity textTyping() {
    return Opacity(
      opacity: 0.0,
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
            if (input.length < paragraphs[0].length && !isBackspace) {
              for (int i = input.length; i < paragraphs[0].length; i++) {
                correctCharacters[i] = null;
              }
            }
            if (input.length == paragraphs[0].length) {
              isTypingComplete = true;
              timer.cancel();
              _showResultDialog();
            }

            currentCursorPosition = input.length - 1;
            calculateStats();
            int tempLength = input.length;
            if (tempLength % 80 == 0) {
              _scrollController.animateTo(
                _scrollController.offset + 60,
                curve: Curves.linear,
                duration: const Duration(milliseconds: 500),
              );
            }
          });

          if (textEditingController.text.length < typedText.length &&
              isBackspace) {
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
        ),
      ),
    );
  }
}

final List<String> paragraphs = [
  "Dĩ nhiên, tôi có thể viết một đoạn văn tiếng Việt cho bạn.",
];
