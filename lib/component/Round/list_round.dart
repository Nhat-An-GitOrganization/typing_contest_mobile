import 'package:flutter/material.dart';
import 'package:typing_contest_mobile/component/Round/round.dart';
import 'package:typing_contest_mobile/models/contest.dart';

class ListRound extends StatefulWidget {
  const ListRound({super.key, required this.contest});
  final Contest contest;
  @override
  State<ListRound> createState() => _ListRoundState();
}

class _ListRoundState extends State<ListRound> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 26, 115, 232),
        title: const Text(
          'Vòng thi',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        leading: const BackButton(),
      ),
      body: Stack(
        children: [
          SizedBox(
            height: size.height * 0.001,
          ),
          SizedBox(
            child: ListView.builder(
              itemCount: contest.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Round(
                      itemIndex: index,
                      ct: contest[index],
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
