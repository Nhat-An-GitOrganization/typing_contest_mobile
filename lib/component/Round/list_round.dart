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
    // TODO: implement build
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        buildAppbar(),
        const SizedBox(
          height: 20,
        ),
        for (var i = 0; i < contest.length; i++)
          Column(
            children: [
              Round(
                itemIndex: i,
                ct: contest[i],
              ),
              const SizedBox(height: 15), // Khoảng cách 5px giữa các phần tử
            ],
          ),
      ]),
    );
  }
}

AppBar buildAppbar() {
  return AppBar(
    automaticallyImplyLeading: false,
    elevation: 0,
    title: const Text('Contest'),
    centerTitle: false,
    leading: const BackButton(),
  );
}
