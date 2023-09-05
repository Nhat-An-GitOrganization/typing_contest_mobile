import 'package:flutter/material.dart';

class OrgaCard extends StatelessWidget {
  const OrgaCard({super.key, required this.orga});
  final Map orga;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      width: 80,
      child: Column(
        children: [
          Container(
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(orga['image']),
              ),
            ),
          ),
          const SizedBox(
            height: 20 / 2,
          ),
          Text(
            orga['orginalName'],
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
            maxLines: 2,
          ),
          const SizedBox(
            height: 20 / 4,
          ),
          const Text(
            'Organizer',
            maxLines: 1,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}