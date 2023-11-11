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

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              height: size.height * 0.3,
              child: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      image: DecorationImage(
                        image: AssetImage('lib/images/history_rank.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                            color: Colors.black.withOpacity(0.35)),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 5),
                            child: const BackButton(
                              color: Colors.white,
                            ),
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
                                  color: Colors.white,
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
                                  child: ThongTin(size, 'Số lần truy cập:',
                                      'Phạm vi truy cập:', 'Backspace:')),
                              Container(
                                  margin: EdgeInsets.only(
                                    top: size.width * 0.02,
                                    left: size.width * 0.015,
                                  ),
                                  padding:
                                      EdgeInsets.only(top: size.width * 0.2),
                                  child: ThongTin(size, '3224', '3', '444')),
                              Container(
                                  margin: EdgeInsets.only(
                                    top: size.width * 0.02,
                                    left: size.width * 0.08,
                                  ),
                                  padding:
                                      EdgeInsets.only(top: size.width * 0.2),
                                  child: ThongTin(size, 'Ký tự đặc biệt:',
                                      'Thời gian:', 'Chung kết:')),
                              Container(
                                  margin: EdgeInsets.only(
                                    top: size.width * 0.02,
                                    left: size.width * 0.015,
                                  ),
                                  padding:
                                      EdgeInsets.only(top: size.width * 0.2),
                                  child: ThongTin(size, '3224', '3', '33')),
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
  Column ThongTin(Size size, String name, String name1, String name2) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(top: 20),
          child: Text(
            name,
            style: TextStyle(
              color: Colors.white,
              fontSize: size.width * 0.033,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 35),
          child: Text(
            name1,
            style: TextStyle(
              color: Colors.white,
              fontSize: size.width * 0.033,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 35),
          child: Text(
            name2,
            style: TextStyle(
              color: Colors.white,
              fontSize: size.width * 0.033,
            ),
          ),
        ),
      ],
    );
  }
}
