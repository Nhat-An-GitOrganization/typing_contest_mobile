import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:typing_contest_mobile/component/Round/list_round.dart';
import 'package:typing_contest_mobile/models/contest.dart';

class TitleDetailsContest extends StatelessWidget {
  const TitleDetailsContest({
    super.key,
    required this.contest,
  });

  final Contest contest;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(size.width * 0.042),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  contest.title,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                SizedBox(
                  height: size.height * 0.012,
                ),
                Row(
                  children: [
                    Text(
                      '${contest.dateStart} - ${contest.dateEnd}',
                      style: const TextStyle(
                          color: Color.fromARGB(255, 89, 91, 118)),
                    ),
                    SizedBox(
                      width: size.width * 0.08,
                    ),
                    const Text(
                      '15min',
                      style: TextStyle(color: Color.fromARGB(255, 89, 91, 118)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.075,
            width: size.height * 0.075,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ListRound(contest: contest)),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const FaIcon(FontAwesomeIcons.rightToBracket)),
          ),
        ],
      ),
    );
  }
}
