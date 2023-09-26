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
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 20 / 2,
      ),
      height: 160,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // Background
          Container(
              height: 160,
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
                                  : Colors.white.withOpacity(0.3)))))),
          // Info Contest
          Positioned(
            bottom: 0,
            left: 0,
            child: SizedBox(
              height: 170,
              width: size.width - 50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 20),
                    child: Text(
                      ct.title,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'BeVietnamPro',
                      ),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        '${ct.dateStart} - ${ct.dateEnd}',
                        style: const TextStyle(
                            fontSize: 15, fontFamily: 'BeVietnamPro'),
                      )),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DetailRound(
                            userId: 1,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(left: 20, bottom: 20),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20 / 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'Tham gia',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: 'BeVietnamPro'),
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
