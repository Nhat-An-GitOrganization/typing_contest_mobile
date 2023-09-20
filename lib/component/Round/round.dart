import 'package:flutter/material.dart';
import 'package:typing_contest_mobile/models/contest.dart';
import 'package:typing_contest_mobile/screen/contest_dts_screen.dart';

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
        horizontal: 20,
        vertical: 20 / 2,
      ),
      height: 160,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // Background
          Container(
            height: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              color: itemIndex.isEven
                  ? const Color.fromARGB(255, 10, 187, 197)
                  : const Color.fromARGB(255, 246, 168, 59),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 20,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                color: Colors.white,
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
              height: 160,
              width: 150,
              child: Image.asset(
                ct.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Info Contest
          Positioned(
            bottom: 0,
            left: 0,
            child: SizedBox(
              height: 136,
              width: size.width - 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      ct.title,
                      style: isDarkMode
                          ? Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.copyWith(color: Colors.black)
                          : Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    // onTap: () {
                    //   Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => ContestDetail(contest: ct),
                    //     ),
                    //   );
                    // },
                    child: Container(
                      margin: const EdgeInsets.only(left: 20, bottom: 20),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20 * 1.5,
                        vertical: 20 / 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'Tham gia',
                        style: isDarkMode
                            ? Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(color: Colors.black)
                            : Theme.of(context).textTheme.labelLarge,
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