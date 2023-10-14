import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:typing_contest_mobile/component/history/contest.dart';
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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          leading: const BackButton(),
        ),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              height: size.height * 0.25,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                ),
                image: DecorationImage(
                  image: AssetImage('lib/images/background.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  Text(
                    user.displayName!,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: size.width * 0.055),
                  ),
                  SizedBox(height: size.height * 0.01),
                  Center(
                    child: Column(
                      children: [
                        Container(
                          width: size.width * (130 / size.width),
                          height: size.height * (130 / size.height),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: size.width * (4 / size.width),
                              color: Theme.of(context).scaffoldBackgroundColor,
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
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.09),
                child: Text(
                  'Contest',
                  style: TextStyle(fontSize: size.height * 0.03),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.01),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    for (var i = 0; i < contest.length; i++)
                      His_Contest(
                        itemIndex: i,
                        ct: contest[i],
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
