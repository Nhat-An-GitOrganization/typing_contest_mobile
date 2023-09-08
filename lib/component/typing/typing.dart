import 'package:flutter/material.dart';

class Typing extends StatefulWidget {
  const Typing(
      {super.key, required this.label, this.value, required this.onTap});
  final dynamic label;
  final dynamic value;
  final ValueSetter<dynamic> onTap;
  @override
  State<Typing> createState() => _TypingState();
}

class _TypingState extends State<Typing> {
  renderLabel() {
    if (widget.label is Widget) {
      return widget.label;
    }

    return Text(
      widget.label,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onTap(widget.value);
      },
      child: Padding(
        padding: const EdgeInsets.all(15.5),
        // ignore: avoid_unnecessary_containers
        child: Container(
          child: Center(
            child: renderLabel(),
          ),
        ),
      ),
    );
  }
}
