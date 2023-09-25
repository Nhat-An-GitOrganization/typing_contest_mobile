import 'package:flutter/material.dart';
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
    return Padding(
      padding: const EdgeInsets.all(20),
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
                const SizedBox(
                  height: 20 / 1.5,
                ),
                Row(
                  children: [
                    Text(
                      '${contest.dateStart} - ${contest.dateEnd}',
                      style: const TextStyle(
                          color: Color.fromARGB(255, 89, 91, 118)),
                    ),
                    const SizedBox(
                      width: 20,
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
            height: 64,
            width: 64,
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
              child: const Icon(
                Icons.add,
                size: 28,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
