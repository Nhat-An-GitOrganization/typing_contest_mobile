import 'package:flutter/material.dart';
import 'package:typing_contest_mobile/component/classPage/class.dart';
import 'package:typing_contest_mobile/models/contest.dart';

class ListClass extends StatefulWidget {
  const ListClass({super.key, required this.contest});
  final Contest contest;
  @override
  State<ListClass> createState() => _ListClassState();
}

class _ListClassState extends State<ListClass> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: const Text(
          'Class',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'BeVietnamPro',
          ),
        ),
        centerTitle: false,
        leading: const BackButton(),
      ),
      body: Stack(children: [
        Expanded(
          child: ListView.builder(
            itemCount: contest.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Class(
                    itemIndex: index,
                    ct: contest[index],
                  ),
                ],
              );
            },
          ),
        ),
        Positioned(
          bottom: size.height * 0.015,
          right: size.height * 0.015,
          child: SizedBox(
            width: size.width * 0.15,
            height: size.width * 0.15,
            child: ElevatedButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => ListClass(contest: contest)),
                // );
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(35),
                ),
              ),
              child: Icon(
                Icons.add,
                size: size.width * 0.08,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
