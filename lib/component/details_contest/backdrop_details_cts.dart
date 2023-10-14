import 'package:flutter/material.dart';
import 'package:typing_contest_mobile/component/details_contest/orga_card.dart';
import 'package:typing_contest_mobile/models/contest.dart';

class BackGroundDetailCT extends StatelessWidget {
  const BackGroundDetailCT({
    super.key,
    required this.size,
    required this.contest,
  });

  final Size size;
  final Contest contest;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      //40% of our total height
      height: size.height * 0.35,
      child: Stack(
        children: [
          Container(
            height: size.height * 0.35 - 50,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(50),
              ),
              image: DecorationImage(
                image: AssetImage(contest.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          //somthing in here
          Positioned(
            bottom: size.width * 0.03,
            right: 0,
            child: Container(
              //cover 90% picture
              width: size.width * 0.55,
              height: size.height * 0.085,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  topLeft: Radius.circular(50),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 5),
                    blurRadius: 40,
                    color: const Color(0xFF12153D).withOpacity(0.2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.006,
                  ),
                  OrgaCard(orga: contest.orga[0]),
                ],
              ),
            ),
          ),
          const SafeArea(
            child: BackButton(),
          ),
        ],
      ),
    );
  }
}
