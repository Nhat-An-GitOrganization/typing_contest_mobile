import 'package:flutter/material.dart';

class ShowingText extends StatelessWidget {
  const ShowingText({
    super.key,
    required this.inputNode,
    required ScrollController scrollController,
    required this.currentCursorPosition,
    required this.correctCharacters,
    required this.paragraphs,
  }) : _scrollController = scrollController;

  final FocusNode inputNode;
  final ScrollController _scrollController;
  final double currentCursorPosition;
  final List<Color?> correctCharacters;
  final List<String> paragraphs;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          // Xử lý sự kiện nhấp vào ở đây
          if (!inputNode.hasFocus) {
            FocusScope.of(context).requestFocus(inputNode);
          }
        },
        child: Center(
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
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
    );
  }
}
