import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:typing_contest_mobile/component/RoundDetail/round_details.dart';
import 'package:typing_contest_mobile/models/contest.dart';

class Round extends StatelessWidget {
  const Round({
    Key? key,
    required this.itemIndex,
    required this.ct,
  }) : super(key: key);

  final int itemIndex;
  final Contest ct;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: size.width * 0.02,
        vertical: size.width * 0.03,
      ),
      height: size.height * 0.19,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // Background
          Container(
            height: size.height * 0.19,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(ct.image),
              ),
            ),
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    color: isDarkMode
                        ? Colors.black.withOpacity(0.3)
                        : Colors.white.withOpacity(0.3),
                  ),
                ),
              ),
            ),
          ),
          // Info Contest
          Positioned(
            bottom: 0,
            left: 0,
            child: SizedBox(
              height: size.height * 0.19,
              width: size.width - 50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  Padding(
                    padding: EdgeInsets.only(
                        left: size.width * 0.05, top: size.height * 0.02),
                    child: Text(
                      ct.title,
                      style: TextStyle(
                        fontSize: size.width * 0.05,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: EdgeInsets.only(left: size.width * 0.05),
                    child: Text(
                      '${ct.dateStart} - ${ct.dateEnd}',
                      style: TextStyle(fontSize: size.width * 0.035),
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DetailRound(
                            id: '6c740a05-0664-46e8-90ff-248a638868c1',
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                          left: size.height * 0.03, bottom: size.width * 0.05),
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.05,
                        vertical: size.width * 0.01,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'Chi tiết',
                        style: TextStyle(
                            color: Colors.white, fontSize: size.width * 0.037),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
