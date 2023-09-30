import 'package:flutter/material.dart';

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 90,
      width: double.infinity,
      margin:const EdgeInsets.all(20),
      padding:const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 25,
      ),
      decoration: BoxDecoration(
        color:const Color(0xFF1393BA),
        borderRadius: BorderRadius.circular(20),
      ),
      child:const Text.rich(
        TextSpan(
          style: TextStyle(color: Colors.white),
          children: [
            TextSpan(text: "Giáo Viên\n"),
            TextSpan(
              text: "Xin chào",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}