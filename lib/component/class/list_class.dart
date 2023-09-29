import 'package:flutter/material.dart';
import 'package:typing_contest_mobile/component/class/class.dart';
import 'package:typing_contest_mobile/models/contest.dart';

class ListClass extends StatefulWidget {
  const ListClass({super.key});
  @override
  State<ListClass> createState() => _ListClassState();
}

class _ListClassState extends State<ListClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(//crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        //buildAppbar(),
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
          bottom: 15,
          right: 15,
          child: SizedBox(
            width: 60,
            height: 60,
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
              child: const Icon(
                Icons.add,
                size: 30,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

AppBar buildAppbar() {
  return AppBar(
    automaticallyImplyLeading: false,
    elevation: 0,
    title: const Text(
      'Class',
      style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'BeVietnamPro'),
    ),
    centerTitle: false,
    leading: const BackButton(),
  );
}
