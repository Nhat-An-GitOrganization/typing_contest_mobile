import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:typing_contest_mobile/component/typing/typing.dart';

class TypingButtonWidget extends StatelessWidget {
  final Size size;

  const TypingButtonWidget(this.size, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        size.width * 0.3,
        size.height * 0.01,
        size.height * 0,
        size.height * 0,
      ),
      alignment: Alignment.center,
      child: SizedBox(
        height: size.height * 0.075,
        width: size.height * 0.075,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TypingSpeedTestGame(),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 26, 115, 232),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: const FaIcon(FontAwesomeIcons.rightToBracket),
        ),
      ),
    );
  }
}
