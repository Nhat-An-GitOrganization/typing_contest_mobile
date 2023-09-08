import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
    return SizedBox(
      //40% of our total height
      height: size.height * 0.3,
      child: Stack(
        children: [
          Container(
            height: size.height * 0.3 - 50,
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
            bottom: 0,
            right: 0,
            child: Container(
              //cover 90% picture
              width: size.width * 0.8,
              height: 90,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  topLeft: Radius.circular(50),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 5),
                    blurRadius: 50,
                    color: const Color(0xFF12153D).withOpacity(0.2),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'lib/svg/chalkboard-user-solid.svg',
                        width: 25,
                      ),
                      const SizedBox(
                        height: 20 / 4,
                      ),
                      RichText(
                        text: const TextSpan(
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: "Practice",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'lib/svg/person-praying-solid.svg',
                        width: 25,
                      ),
                      const SizedBox(
                        height: 20 / 4,
                      ),
                      const Text(
                        "Praying",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'lib/svg/user-graduate-solid.svg',
                        width: 25,
                      ),
                      const SizedBox(
                        height: 20 / 4,
                      ),
                      const Text(
                        "Success",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  )
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
