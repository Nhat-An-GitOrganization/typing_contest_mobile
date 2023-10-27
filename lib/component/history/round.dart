import 'package:flutter/material.dart';
import 'package:popover/popover.dart';
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
        vertical: size.width * 0.02,
      ),
      height: size.height * 0.2,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: size.height * 0.27,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              color: const Color.fromARGB(255, 235, 202, 156),
            ),
          ),
          // Contest
          Positioned(
            top: 0,
            left: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
          // Info Contest
          Positioned(
            right: size.width * 0.025,
            top: size.height * 0.001,
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
                                  fontSize: size.height * (19 / size.height),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Text(
                            '19-02-2021',
                            style: TextStyle(
                              fontSize: size.height * (16 / size.height),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.01,
                                    vertical: size.height * 0.02),
                                child: ThongTin(size, 'User', '2000')),
                            Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.015),
                                child: ThongTin(size, 'Accesss', '3')),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.015),
                              child: ThongTin(size, 'Available', '2'),
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
              GestureDetector(
                onTap: () => showPopover(
                  context: context,
                  bodyBuilder: (context) => const MenuItems(),
                  width: size.width * 0.15,
                  height: size.height * 0.06,
                  contentDyOffset: -size.width * 0.4,
                  backgroundColor: const Color.fromARGB(255, 129, 192, 243),
                ),
                child: Container(
                  margin: EdgeInsets.only(
                      left: size.width * 0.8, top: size.width * 0.06),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(
                    Icons.menu,
                    color: Color.fromARGB(255, 52, 52, 52),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    left: size.width * 0.75, top: size.width * 0.06),
                child: Column(
                  children: [
                    Text(
                      '100',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 182, 16, 41),
                        fontSize: size.width * 0.06,
                      ),
                    ),
                    Text(
                      'Rank',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 172, 19, 40),
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
