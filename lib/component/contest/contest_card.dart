import 'package:flutter/material.dart';
import 'package:typing_contest_mobile/models/contest.dart';
import 'package:typing_contest_mobile/screen/contest_dts_screen.dart';

class ContestCard extends StatelessWidget {
  const ContestCard({
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
        horizontal: 20,
        vertical: 10,
      ),
      height: size.height * (160 / size.height),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // Background
          Container(
            height: size.height * (140 / size.height),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              color: itemIndex.isEven
                  ? const Color.fromARGB(255, 10, 187, 197)
                  : const Color.fromARGB(255, 246, 168, 59),
            ),
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                color: isDarkMode
                    ? const Color.fromARGB(255, 76, 76, 76)
                    : const Color.fromARGB(255, 215, 215, 215),
                borderRadius: BorderRadius.circular(22),
              ),
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
                            fontFamily: 'BeVietnamPro'),
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
