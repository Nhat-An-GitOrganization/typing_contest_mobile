import 'package:flutter/material.dart';

class Orga extends StatelessWidget {
  const Orga({super.key, required this.orga});
  final Map orga;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: size.height * 0.085,
              width: size.width * 0.27,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(
                    orga['image'],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.12,
            ),
          ],
        ),
      ],
    );
  }
}
