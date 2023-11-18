import 'package:flutter/material.dart';
import 'package:typing_contest_mobile/component/ranking/ranking_student_screen.dart';

class RankingFinish extends StatefulWidget {
  const RankingFinish({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _RankingStudentScreenState createState() => _RankingStudentScreenState();
}

class _RankingStudentScreenState extends State<RankingFinish> {
  @override
  void initState() {
    super.initState();

    // Wait for a short delay (for example, 500 milliseconds) and then show the pop-up
    Future.delayed(const Duration(milliseconds: 0), () {
      _showRankingStudentPopUp();
    });
  }

  void _showRankingStudentPopUp() {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 2000),
      pageBuilder: (BuildContext buildContext, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return SlideTransition(
          position: Tween(begin: const Offset(0, 1), end: Offset.zero)
              .animate(animation),
          child: const RankingStudentScreen(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
      ),
    );
  }
}
