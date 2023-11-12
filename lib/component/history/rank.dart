import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:typing_contest_mobile/models/contest.dart';

// ignore: camel_case_types
class His_Rank extends StatelessWidget {
  const His_Rank({
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

    Color primaryColor = isDarkMode
        ? const Color.fromARGB(255, 78, 78, 78)
        : const Color.fromARGB(255, 146, 206, 255);
    Color secondaryColor = isDarkMode
        ? const Color.fromARGB(255, 100, 100, 100)
        : const Color.fromARGB(255, 207, 232, 255);
    return SizedBox(
      height: 100,
      child: TimelineTile(
          alignment: TimelineAlign.manual,
          lineXY: 0.25,
          beforeLineStyle: const LineStyle(
            color: Color.fromARGB(255, 216, 237, 255),
          ),
          indicatorStyle: const IndicatorStyle(
            color: Color.fromARGB(255, 254, 212, 94),
          ),
          startChild: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '20/1',
                style: TextStyle(
                  //color: const Color.fromARGB(255, 58, 69, 75),
                  fontSize: size.width * 0.05,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          endChild: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            margin: EdgeInsets.symmetric(
              horizontal: size.width * 0.02,
              vertical: size.width * 0.025,
            ),
            height: size.height * 0.12,
            child: InkWell(
              child: Stack(
                children: [
                  Container(
                    //height: size.height * 0.25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          primaryColor,
                          secondaryColor,
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: size.width * 0.05,
                    top: size.width * 0.05,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: size.width * 0.2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '375wpm',
                                style: TextStyle(
                                  fontSize: size.width * 0.036,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: size.width * 0.2,
                          padding: EdgeInsets.only(right: size.width * 0.03),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '80%',
                                style: TextStyle(
                                  //color: const Color.fromARGB(255, 58, 69, 75),
                                  fontSize: size.width * 0.036,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: size.width * 0.2,
                          padding: EdgeInsets.only(right: size.width * 0.03),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '534333',
                                style: TextStyle(
                                    //color: const Color.fromARGB(255, 58, 69, 75),
                                    fontSize: size.width * 0.036),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: size.width * 0.05,
                    top: size.width * 0.13,
                    child: Text(
                      '29:43:44',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: size.width * 0.036,
                          color: isDarkMode
                              ? const Color.fromARGB(255, 176, 176, 176)
                              : const Color.fromARGB(255, 105, 105, 105)),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
