import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:typing_contest_mobile/component/ClassDetail/class_detail.dart';
import 'package:typing_contest_mobile/component/classPage/orga.dart';
import 'package:typing_contest_mobile/models/contest.dart';

class Class extends StatelessWidget {
  const Class({
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

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: size.width * 0.01,
        vertical: size.width * 0.03,
      ),
      height: size.height * 0.25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size.width * 0.05),
        border: Border.all(
          color: const Color.fromARGB(255, 204, 204, 204), // Màu viền
          width: 0.7, // Độ dày viền
        ),
      ),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          // Background
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ClassDetail(), //Detai class
              ),
            ),
            child: Container(
              height: size.height * 0.16,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(size.width * 0.05),
                  topRight: Radius.circular(size.width * 0.05),
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(ct.image),
                ),
              ),
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(size.width * 0.05),
                        topRight: Radius.circular(size.width * 0.05),
                      ),
                      color: isDarkMode
                          ? Colors.black.withOpacity(0.5)
                          : Colors.white.withOpacity(0.5),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: size.height * 0.03,
            right: 0,
            child: SizedBox(
              //cover 90% picture
              width: size.width * 0.3,
              height: size.height * 0.13,
              child: Column(
                children: [
                  Orga(
                    orga: ct.orga[0],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            top: -size.height * 0.08,
            left: 0,
            child: SizedBox(
              height: size.height * 0.4,
              width: size.width - 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: size.width * 0.06, top: size.height * 0.11),
                    child: Text(
                      ct.title,
                      style: TextStyle(
                        fontSize: size.width * 0.055,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: size.width * 0.06,
                        top: size.height * 0.02,
                        bottom: size.height * 0.01),
                    child: Text(
                      'Tên Lớp',
                      style: TextStyle(fontSize: size.width * 0.04),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: size.width * 0.06, top: size.height * 0.06),
                    child: Text(
                      'Ngày Tạo: ${ct.dateStart}',
                      style: TextStyle(
                        fontSize: size.width * 0.036,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: size.width * 0.06, top: size.height * 0.01),
                    child: Text(
                      'SV : 20',
                      style: TextStyle(
                        fontSize: size.width * 0.036,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
