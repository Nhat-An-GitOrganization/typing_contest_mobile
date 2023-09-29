import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:popover/popover.dart';
import 'package:typing_contest_mobile/component/class/menu_item.dart';
import 'package:typing_contest_mobile/component/class/orga.dart';
import 'package:typing_contest_mobile/models/contest.dart';
import 'package:typing_contest_mobile/screen/contest_dts_screen.dart';

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
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 20 / 2,
      ),
      height: 220,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        border: Border.all(
          color: Colors.grey, // Màu viền
          width: 2.0, // Độ dày viền
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
                      builder: (context) =>
                          ContestDetail(contest: ct), //Detai class
                    ),
                  ),
              child: Container(
                  height: 140,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(ct.image),
                    ),
                  ),
                  child: ClipRect(
                      child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(20.0),
                                    topRight: Radius.circular(20.0),
                                  ),
                                  color: isDarkMode
                                      ? Colors.black.withOpacity(0.3)
                                      : Colors.white.withOpacity(0.3))))))),
          // Info Contest
          Positioned(
            top: 25,
            right: 25,
            child: GestureDetector(
              onTap: () {
                showPopover(
                  context: context,
                  bodyBuilder: (BuildContext context) => const MenuItem(),
                  width: 80,
                  height: 70,
                  backgroundColor: Colors.blue,
                  direction: PopoverDirection.bottom,
                  arrowHeight: 7,
                  arrowWidth: 10,
                  arrowDxOffset: 156,
                  arrowDyOffset: -175,
                );
              },
              child: const Icon(Icons.more_vert),
            ),
          ),
          Positioned(
            bottom: 15,
            right: 0,
            child: SizedBox(
              //cover 90% picture
              width: size.width * 0.3,
              height: 120,
              child: Column(
                children: [
                  const SizedBox(
                    height: 0,
                  ),
                  Orga(orga: ct.orga[0]),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            top: -70,
            left: 0,
            child: SizedBox(
              height: 100,
              width: size.width - 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 100),
                    child: Text(
                      ct.title,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'BeVietnamPro',
                      ),
                    ),
                  ),
                  //const Spacer(),
                  const Padding(
                      padding: EdgeInsets.only(left: 20, top: 16, bottom: 10),
                      child: Text(
                        'Name',
                        style:
                            TextStyle(fontSize: 17, fontFamily: 'BeVietnamPro'),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 50),
                    child: Text(
                      'Create date: ${ct.dateStart}',
                      style: const TextStyle(
                        fontSize: 15,
                        fontFamily: 'BeVietnamPro',
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20, top: 10),
                    child: Text(
                      'SV : 20',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'BeVietnamPro',
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
