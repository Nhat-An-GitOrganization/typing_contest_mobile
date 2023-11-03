import 'package:flutter/material.dart';
import 'package:typing_contest_mobile/component/history/menu.dart';
import 'package:typing_contest_mobile/models/contest.dart';

// ignore: camel_case_types
class His_Round extends StatelessWidget {
  const His_Round({
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
      margin: EdgeInsets.symmetric(
        horizontal: size.width * 0.02,
        vertical: size.width * 0.025,
      ),
      height: size.height * 0.19,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: size.height * 0.27,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              color: const Color.fromARGB(255, 216, 237, 255),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 10),
              height: size.height * 0.4,
              width: size.width * 0.3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(22),
                child: Image.asset(
                  ct.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            left: size.width * 0.33,
            top: size.width * 0.03,
            child: SizedBox(
              height: size.height * 0.18,
              width: size.width - 150,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Spacer(),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                ct.title,
                                style: TextStyle(
                                  fontSize: size.height * (15 / size.height),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.01,
                                    vertical: size.height * 0.05),
                                child: ThongTin(size, 'User', '200000')),
                            Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.015),
                                child: ThongTin(size, 'User', '3')),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.015),
                              child: ThongTin(size, 'User', '2'),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                  left: size.width * 0.8,
                  top: size.width * 0.05,
                ),
                child: const MenuItems(),
              ),
              Container(
                padding: EdgeInsets.only(
                    left: size.width * 0.7, top: size.width * 0.04),
                child: Column(
                  children: [
                    Text(
                      '100222',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 229, 91, 0),
                        fontSize: size.width * 0.055,
                      ),
                    ),
                    Text(
                      'Rank',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 187, 75, 0),
                        fontSize: size.width * 0.04,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Column ThongTin(Size size, String name, String int) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          name,
          style: TextStyle(
            color: const Color.fromARGB(255, 40, 40, 40),
            fontSize: size.width * 0.035,
          ),
        ),
        Text(
          int,
          style: TextStyle(
            color: const Color.fromARGB(255, 58, 69, 75),
            fontSize: size.width * 0.03,
          ),
        ),
      ],
    );
  }
}
