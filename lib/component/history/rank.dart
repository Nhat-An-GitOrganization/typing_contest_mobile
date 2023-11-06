import 'package:flutter/material.dart';
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

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      margin: EdgeInsets.symmetric(
        horizontal: size.width * 0.02,
        vertical: size.width * 0.025,
      ),
      height: size.height * 0.13,
      child: InkWell(
        child: Container(
          color: const Color.fromARGB(255, 216, 237, 255),
          // Mà
          child: Stack(
            children: [
              Positioned(
                left: -size.width * 0.11, // Điều chỉnh vị trí đường chéo
                top: -size.height * 0.1,
                child: Transform.rotate(
                  angle: -0.25, // Góc xoay của đường chéo
                  child: Container(
                    width: size.width * 0.72,
                    height: size.height * 0.3,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Color.fromARGB(255, 52, 164, 255),
                          Color.fromARGB(255, 26, 115, 232),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'TypingBee Spring 2023',
                          style: TextStyle(
                            color: const Color.fromARGB(255, 238, 238, 238),
                            fontSize: size.width * 0.045,
                          ),
                        ),
                        Text(
                          '20/12/2022 - 10/02/2023',
                          style: TextStyle(
                            color: const Color.fromARGB(255, 238, 238, 238),
                            fontSize: size.width * 0.035,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(size.width * 0.02),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Vòng 5/6',
                            style: TextStyle(
                              color: const Color.fromARGB(255, 58, 69, 75),
                              fontSize: size.width * 0.036,
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
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
