import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:typing_contest_mobile/component/history/contest.dart';
import 'package:typing_contest_mobile/component/history/list_round.dart';
import 'package:typing_contest_mobile/models/contest.dart';

class ContestEntered extends StatefulWidget {
  const ContestEntered({super.key});

  @override
  State<ContestEntered> createState() => _ContestEnteredState();
}

class _ContestEnteredState extends State<ContestEntered> {
  final user = FirebaseAuth.instance.currentUser!;
  bool isLoading = false;

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
              height: size.height * 0.33,
              child: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
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
                                  top: 50), // Điều chỉnh giá trị top tùy ý
                              child: Text(
                                user.displayName!,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: size.width * 0.055,
                                  color:
                                      isDarkMode ? Colors.white : Colors.black,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: size.height * 0.04),
                      Center(
                        child: Column(
                          children: [
                            Container(
                              width: size.width * (130 / size.width),
                              height: size.height * (130 / size.height),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: size.width * (4 / size.width),
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    spreadRadius: 2,
                                    blurRadius: 10,
                                    color: Colors.black.withOpacity(0.1),
                                    offset: const Offset(0, 10),
                                  ),
                                ],
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(user.photoURL!),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.09),
                child: Text(
                  'Cuộc thi',
                  style: TextStyle(fontSize: size.height * 0.03),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.01),
            Flexible(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    for (var i = 0; i < contest.length; i++) ...[
                      His_Contest(
                        itemIndex: i,
                        ct: contest[i],
                        ontapCallback: () {
                          RoundMethod(size, context);
                        },
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
  // ignore: non_constant_identifier_names
  Future RoundMethod(Size size, BuildContext context) {
    final animationController = AnimationController(
      vsync: Navigator.of(context),
      duration: const Duration(
          milliseconds:
              1000), // Chỉnh thời gian hoàn thành hiệu ứng (500 milliseconds)
    );

    return showModalBottomSheet(
      transitionAnimationController: animationController,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          width: size.width * 0.9, // Chỉnh kích thước width của modal
          height: size.height * 0.73, // Chỉnh kích thước height của modal
          child: const List_History_Round(),
        );
      },
    );
  }
}
