import 'package:flutter/material.dart';

class Orga extends StatelessWidget {
  const Orga({super.key, required this.orga});
  final Map orga;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(orga['image']),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ],
    );
  }
}
