import 'package:flutter/material.dart';

class MenuItems extends StatelessWidget {
  const MenuItems({super.key});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          color: const Color.fromARGB(255, 129, 192, 243),
          height: size.height * 0.03,
          child: const Text('BXH'),
        ),
        Container(
          color: const Color.fromARGB(255, 129, 192, 243),
          height: size.height * 0.03,
          child: const Text('Bài làm'),
        )
      ],
    );
  }
}
