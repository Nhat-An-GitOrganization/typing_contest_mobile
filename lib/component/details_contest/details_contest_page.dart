import 'package:flutter/material.dart';
import 'package:typing_contest_mobile/component/details_contest/backdrop_details_cts.dart';
import 'package:typing_contest_mobile/component/details_contest/title_details_contest.dart';
import 'package:typing_contest_mobile/models/contest.dart';

class DetailsPageContest extends StatelessWidget {
  const DetailsPageContest({super.key, required this.contest});
  final Contest contest;
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    // it width provide us total height and width
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BackGroundDetailCT(size: size, contest: contest),
        const SizedBox(height: 0),
        TitleDetailsContest(contest: contest),
        //Genres(contest: contest),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: size.width * 0.042,
            horizontal: size.width * 0.047,
          ),
          child: Text(
            'Chi Tiết',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.047),
          child: Text(
            contest.description,
            style: TextStyle(
              fontSize: size.height * (16 / size.height),
              color: isDarkMode ? const Color.fromARGB(255, 209, 209, 214) :  const Color.fromARGB(255, 89, 91, 118),              
            ),
          ),
        ),
      ],
    );
  }
}
