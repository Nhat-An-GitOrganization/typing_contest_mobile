import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:typing_contest_mobile/component/history/rank.dart';
import 'package:typing_contest_mobile/models/contest.dart';

// ignore: camel_case_types
class List_Rank extends StatelessWidget {
  const List_Rank({
    super.key,
    required this.ct,
  });

  final Contest ct;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              height: size.height * 0.31,
              child: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      image: DecorationImage(
                        image: AssetImage('lib/images/history_background.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                      child: Container(
                        decoration: BoxDecoration(
                          color: isDarkMode
                              ? Colors.black.withOpacity(0.3)
                              : Colors.white.withOpacity(0.6),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 5),
                            child: const BackButton(),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 40), // Điều chỉnh giá trị top tùy ý
                              child: Text(
                                ct.title,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: size.width * 0.055,
                                  color:
                                      isDarkMode ? Colors.white : Colors.black,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                  margin: EdgeInsets.only(
                                      top: size.width * 0.02,
                                      left: size.width * 0.05),
                                  padding:
                                      EdgeInsets.only(top: size.width * 0.2),
                                  child: ThongTin(
                                      size, 'UserUserUser:', 'UserUserUser:')),
                              Container(
                                  margin: EdgeInsets.only(
                                    top: size.width * 0.02,
                                    left: size.width * 0.012,
                                  ),
                                  padding:
                                      EdgeInsets.only(top: size.width * 0.2),
                                  child: ThongTin(size, '3224', '3')),
                              Container(
                                  margin: EdgeInsets.only(
                                    top: size.width * 0.02,
                                    left: size.width * 0.06,
                                  ),
                                  padding:
                                      EdgeInsets.only(top: size.width * 0.2),
                                  child: ThongTin(
                                      size, 'UserUserUser:', 'UserUserUser:')),
                              Container(
                                  margin: EdgeInsets.only(
                                    top: size.width * 0.02,
                                    left: size.width * 0.012,
                                  ),
                                  padding:
                                      EdgeInsets.only(top: size.width * 0.2),
                                  child: ThongTin(size, '3224', '3')),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: size.height * 0.02),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.01),
            Flexible(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    for (var i = 0; i < contest.length; i++) ...[
                      His_Rank(
                        itemIndex: i,
                        ct: contest[i],
                      ),
                    ]
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Column ThongTin(Size size, String name, String int) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.only(top: 20),
          child: Text(
            name,
            style: TextStyle(
              color: const Color.fromARGB(255, 0, 0, 0),
              fontSize: size.width * 0.04,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 30),
          child: Text(
            int,
            style: TextStyle(
              color: const Color.fromARGB(255, 0, 0, 0),
              fontSize: size.width * 0.04,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 30),
          child: Text(
            int,
            style: TextStyle(
              color: const Color.fromARGB(255, 0, 0, 0),
              fontSize: size.width * 0.04,
            ),
          ),
        ),
      ],
    );
  }
}
