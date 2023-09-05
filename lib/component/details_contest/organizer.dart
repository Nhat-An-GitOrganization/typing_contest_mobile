import 'package:flutter/material.dart';
import 'package:typing_contest_mobile/component/details_contest/orga_card.dart';

class Organizers extends StatelessWidget {
  final List orga;

  const Organizers({super.key, required this.orga});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Organizers',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 152,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: orga.length,
              itemBuilder: (context, index) => OrgaCard(
                orga: orga[index],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
