import 'package:flutter/material.dart';
import 'package:typing_contest_mobile/component/typing/typing.dart';

class KeyBoard extends StatefulWidget {
  const KeyBoard({super.key});

  @override
  State<KeyBoard> createState() => _KeyBoardState();
}

class _KeyBoardState extends State<KeyBoard> {
  late List<List<dynamic>> keys;
  late String amount;
  @override
  void initState() {
    super.initState();
    keys = [
      ['q', 'w', 'e', 'r', 't', 'y', 'u', 'i', 'o', 'p'],
      ['a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l'],
      [
        const Icon(Icons.keyboard_capslock),
        'z',
        'x',
        'c',
        'v',
        'b',
        'n',
        'm',
        const Icon(Icons.keyboard_backspace)
      ],
      ['123', ' ', 'Nhập'],
    ];

    amount = '';
  }

  onKeyTab(val) {
    setState(() {
      amount = amount + val;
    });
  }

  onBackSpacePress() {
    if (amount.isEmpty) {
      return;
    }
    setState(() {
      amount = amount.substring(0, amount.length - 1);
    });
  }

  renderKeyBoard() {
    return keys
        .map(
          (x) => Row(
            children: x.map(
              (y) {
                return Expanded(
                  child: Typing(
                    label: y,
                    value: y,
                    onTap: (val) {
                      if (val is Widget) {
                        onBackSpacePress();
                      } else {
                        onKeyTab(val);
                      }
                    },
                  ),
                );
              },
            ).toList(),
          ),
        )
        .toList();
  }

  renderAmount() {
    String display = 'Typing Now Or You Will Be Late';
    TextStyle style = const TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.bold,
      color: Colors.grey,
    );
    if (amount.isNotEmpty) {
      display = amount;
      style = style.copyWith(
        color: Colors.black,
      );
    }

    return Expanded(
      child: Center(
        child: Text(
          display,
          style: style,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            renderAmount(),
            ...renderKeyBoard(),
          ],
        ),
      ),
    );
  }
}
