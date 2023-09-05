import 'package:flutter/material.dart';
import 'package:typing_contest_mobile/component/genre_card.dart';
import 'package:typing_contest_mobile/models/contest.dart';

class Genres extends StatelessWidget {
  const Genres({
    super.key,
    required this.contest,
  });

  final Contest contest;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20 / 2,
      ),
      child: SizedBox(
        height: 36,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: contest.genra.length,
          itemBuilder: (context, index) => GenreCard(
            genre: contest.genra[index],
          ),
        ),
      ),
    );
  }
}
