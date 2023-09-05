import 'package:flutter/material.dart';
import 'package:typing_contest_mobile/component/details_contest/backdrop_details_cts.dart';
import 'package:typing_contest_mobile/component/details_contest/genres_dt_contest.dart';
import 'package:typing_contest_mobile/component/details_contest/title_details_contest.dart';
import 'package:typing_contest_mobile/models/contest.dart';

class DetailsPageContest extends StatelessWidget {
  const DetailsPageContest({super.key, required this.contest});
  final Contest contest;
  @override
  Widget build(BuildContext context) {
    // it width provide us total height and width
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BackGroundDetailCT(size: size, contest: contest),
        const SizedBox(height: 20),
        TitleDetailsContest(contest: contest),
        Genres(contest: contest),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20 / 2,
            horizontal: 20,
          ),
          child: Text(
            'Details',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            contest.description,
            style: const TextStyle(
              color: Color(0xFF737599),
            ),
          ),
        ),
      ],
    );
  }
}

class Organizers extends StatelessWidget {
  const Organizers({super.key, required this.listOrga});
  final List listOrga;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            'Organizers',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(
            height: 20 / 2,
          ),
          SizedBox(
            height: 150,
            child: ListView.builder(
              itemBuilder: (context, index) => Container(),
            ),
          ),
        ],
      ),
    );
  }
}
