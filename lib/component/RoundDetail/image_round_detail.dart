import 'package:flutter/material.dart';

class MyImageContainer extends StatelessWidget {
  final String imageUrl;

  const MyImageContainer({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 2 / 5,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
        border: Border.all(
          color: Colors.white,
          width: MediaQuery.of(context).size.height * 0,
          style: BorderStyle.solid,
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(1.0, 1.0),
            blurRadius: 1.0,
            spreadRadius: 1.0,
          ),
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 0.0),
            blurRadius: 0.0,
            spreadRadius: 0.0,
          ),
        ],
      ),
    );
  }
}
