import 'package:flutter/material.dart';
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
                  height: 20 / 2,
                ),
                Row(
                  children: [
                    Text(
                      '${contest.dateStart} - ${contest.dateEnd}',
                      style: const TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const Text(
                      '15min',
                      style: TextStyle(color: Colors.grey),
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
              onPressed: () {},
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
          )
        ],
      ),
    );
  }
}
