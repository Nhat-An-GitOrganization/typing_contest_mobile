import 'package:flutter/material.dart';

class OrgaCard extends StatelessWidget {
  const OrgaCard({super.key, required this.orga});
  final Map orga;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      width: 300,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 65,
                width: 90,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(orga['image']),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                orga['orginalName'],
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
