import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:typing_contest_mobile/component/history/round.dart';
import 'package:typing_contest_mobile/models/contest.dart';

// ignore: camel_case_types
class List_History_Round extends StatefulWidget {
  const List_History_Round({super.key});

  @override
  State<List_History_Round> createState() => _ContestEnteredState();
}

class _ContestEnteredState extends State<List_History_Round> {
  final user = FirebaseAuth.instance.currentUser!;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.09),
              child: Text(
                'Round',
                style: TextStyle(fontSize: size.height * 0.03),
              ),
            ),
          ),
          SizedBox(height: size.height * 0.01),
          Flexible(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  for (var i = 0; i < contest.length; i++) ...[
                    His_Round(
                      itemIndex: i,
                      ct: contest[i],
                    ),
                  ]
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
