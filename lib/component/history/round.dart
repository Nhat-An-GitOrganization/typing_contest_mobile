import 'package:flutter/material.dart';
import 'package:typing_contest_mobile/component/ranking/ranking_round_screen.dart';
import 'package:typing_contest_mobile/models/contest.dart';
import 'package:typing_contest_mobile/screen/contest_dts_screen.dart';

// ignore: camel_case_types
class His_Round extends StatelessWidget {
  const His_Round({
    Key? key,
    required this.itemIndex,
    required this.ct,
  }) : super(key: key);

  final int itemIndex;
  final Contest ct;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: size.width * 0.02,
        vertical: size.width * 0.02,
      ),
      height: size.height * 0.2,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const RankingRoundScreen(), //Detai class
              ),
            ),
          ),
          Container(
            height: size.height * 0.3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              color: const Color.fromARGB(255, 239, 188, 100),
            ),
          ),
          // Contest
          Positioned(
            top: 0,
            right: 0,
            bottom: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: size.height * (120 / size.height),
              width: size.width * (150 / size.width),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(22),
                child: Image.asset(
                  ct.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // Info Contest
          Positioned(
            bottom: 0,
            left: 0,
            child: SizedBox(
              height: size.height * 0.18,
              width: size.width - 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      ct.title,
                      style: TextStyle(
                        fontSize: size.height * (16 / size.height),
                      ),
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ContestDetail(contest: ct),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(left: 20, bottom: 20),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20 * 1.5,
                        vertical: 20 / 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'Tham gia',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: size.height * (15 / size.height),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
