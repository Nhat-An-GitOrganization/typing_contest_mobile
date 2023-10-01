import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 35,
          color: Colors.blue,
          child: const Center(
            child: Text(
              'Sửa',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ),
        Container(
          height: 35,
          color: const Color.fromARGB(255, 83, 177, 254),
          child: const Center(
            child: Text(
              'Xóa',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
