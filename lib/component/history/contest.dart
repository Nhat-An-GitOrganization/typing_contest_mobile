import 'package:flutter/material.dart';
import 'package:typing_contest_mobile/models/contest.dart';

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
      height: size.height * 0.12,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          InkWell(
            onTap: ontapCallback,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  color: const Color.fromARGB(255, 141, 205, 213)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.05),
                    child: Align(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'TypingBee Spring 2023',
                            style: TextStyle(
                              color: const Color.fromARGB(255, 40, 40, 40),
                              fontSize: size.width * 0.045,
                            ),
                          ),
                          Text(
                            'Ngày kết thúc: 10-02-2023',
                            style: TextStyle(
                              color: const Color.fromARGB(255, 58, 69, 75),
                              fontSize: size.width * 0.035,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: size.width * 0.3,
                    //margin: const EdgeInsets.only(left: 0),
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 215, 215, 215),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(22),
                          bottomRight: Radius.circular(22)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(size.width * 0.02),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Vòng 5/6',
                                style: TextStyle(
                                  color: const Color.fromARGB(255, 58, 69, 75),
                                  fontSize: size.width * 0.032,
                                ),
                              ),
                              Text(
                                'Rank: 999999',
                                style: TextStyle(
                                  color: const Color.fromARGB(255, 58, 69, 75),
                                  fontSize: size.width * 0.032,
                                ),
                              ),
                            ],
                          ),
                        ],
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
