import 'package:flutter/material.dart';
import 'package:typing_contest_mobile/component/details_contest/details_contest_page.dart';
import 'package:typing_contest_mobile/models/contest.dart';

class ContestDetail extends StatelessWidget {
  const ContestDetail({
    super.key,
    required this.contest,
  });
  final Contest contest;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: DetailsPageContest(
          contest: contest,
        ),
      ),
    );
  }
}
