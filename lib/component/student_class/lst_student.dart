import 'package:flutter/material.dart';
import 'package:typing_contest_mobile/component/student_class/student.dart';

import '../../models/student.dart';

class ListStudent extends StatefulWidget {
  const ListStudent({super.key});

  @override
  State<ListStudent> createState() => _ListStudentState();
}

class _ListStudentState extends State<ListStudent> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: const Text(
          'Danh sách sinh viên ',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontFamily: 'BeVietnamPro'),
        ),
        centerTitle: false,
        leading: const BackButton(),
      ),
      body: Stack(
        children: [
          SizedBox(
            height: size.height * 0.001,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: students.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    StudentOfClass(
                      itemIndex: index,
                      st: students[index],
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
