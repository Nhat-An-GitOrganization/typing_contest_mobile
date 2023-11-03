import 'package:flutter/material.dart';
import 'package:typing_contest_mobile/component/details_contest/orga_card.dart';
import 'package:typing_contest_mobile/models/contest.dart';

class OragCards extends StatelessWidget {
  final Contest ct;
  const OragCards({super.key, required this.ct});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.fromLTRB(
        size.height * 0.22,
        size.height * 0.35,
        0,
        0,
      ),
      alignment: Alignment.center,
      child: Container(
        width: size.width * 0.55,
        height: size.height * 0.09,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(size.height * 0.05),
            topLeft: Radius.circular(size.height * 0.05),
          ),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 5),
              blurRadius: size.height * 0.02,
              color: const Color(0xFF12153D).withOpacity(0.2),
            ),
          ],
        ),
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.006,
            ),
            OrgaCard(orga: ct.orga[0]),
          ],
        ),
      ),
    );
  }
}
