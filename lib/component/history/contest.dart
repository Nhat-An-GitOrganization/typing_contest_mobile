import 'package:flutter/material.dart';
import 'package:typing_contest_mobile/models/contest.dart';
import 'package:typing_contest_mobile/screen/contest_dts_screen.dart';

// ignore: camel_case_types
class His_Contest extends StatelessWidget {
  const His_Contest({
    Key? key,
    required this.itemIndex,
    required this.ct,
    required this.ontapCallback,
  }) : super(key: key);

  final int itemIndex;
  final Contest ct;
  final VoidCallback ontapCallback;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
        margin: EdgeInsets.symmetric(
          horizontal: size.width * 0.02,
          vertical: size.width * 0.01,
        ),
        height: size.height * 0.14,
        child: Stack(alignment: Alignment.topCenter, children: [
          InkWell(
            onTap: ontapCallback,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                color: itemIndex.isEven
                    ? const Color.fromARGB(255, 10, 187, 197)
                    : const Color.fromARGB(255, 246, 168, 59),
              ),
              child: Container(
                margin: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 215, 215, 215),
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Padding(
                  padding: EdgeInsets.all(size.width * 0.03),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.05,
                        vertical: size.width * 0.02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name',
                              style: TextStyle(
                                color: const Color.fromARGB(255, 40, 40, 40),
                                fontSize: size.width * 0.065,
                              ),
                            ),
                            Text(
                              'time',
                              style: TextStyle(
                                color: const Color.fromARGB(255, 58, 69, 75),
                                fontSize: size.width * 0.06,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'điểm',
                              style: TextStyle(
                                color: const Color.fromARGB(255, 58, 69, 75),
                                fontSize: size.width * 0.045,
                              ),
                            ),
                            Text(
                              'điểm',
                              style: TextStyle(
                                color: const Color.fromARGB(255, 58, 69, 75),
                                fontSize: size.width * 0.045,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ]));
  }
}
