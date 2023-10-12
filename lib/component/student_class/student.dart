import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:typing_contest_mobile/models/student.dart';

class StudentOfClass extends StatelessWidget {
  const StudentOfClass({
    Key? key,
    required this.itemIndex,
    required this.st,
  }) : super(key: key);

  final int itemIndex;
  final Student st;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: size.width * 0.02,
        vertical: size.width * 0.02,
      ),
      height: size.height * 0.19,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // Background
          Container(
            height: size.height * 0.19,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              color: Colors.blue,
            ),
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      height: size.height * 0.095,
                      child: Container(
                        decoration:const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(22),
                            topRight: Radius.circular(22),
                          ),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(size.height*0.02, size.width *0.1, 0, size.width*0.04),
                              child:const Icon(
                                Icons.email,
                                color: Colors.black38,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(22),
                              color: isDarkMode
                                  ? Colors.black.withOpacity(0.3)
                                  : Colors.white.withOpacity(0.3),
                              border: Border.all(
                                color: Colors.black54,
                                width: size.height*0.002,
                              ),
                            ),
                            child: Stack(
                              alignment: Alignment.centerRight,
                              children: [

                                Positioned(
                                  right: size.height*0.02,
                                  child: CircleAvatar(
                                    radius: 30,
                                    backgroundImage: AssetImage(st?.image??''),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      top: size.height*0.02,
                      right: size.width*0.02,
                      child:const Icon(
                        Icons.more_vert,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),



          // Info Contest
          Positioned(
            bottom: 0,
            left: 0,
            child: SizedBox(
              height: size.height * 0.25,
              width: size.width - size.height*0.2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Padding(
                    padding: EdgeInsets.only(
                        left: size.width * 0.05, top: size.height * 0.07),
                    child: Text(
                      st?.trainingFacility??"",
                      style: TextStyle(
                        fontSize: size.width * 0.05,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'BeVietnamPro',
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(
                        left: size.width * 0.05, top: size.height * 0.02),
                    child: Text(
                      st?.trainingFacility??"",
                      style: TextStyle(
                        fontSize: size.width * 0.05,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'BeVietnamPro',
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.fromLTRB(size.width * 0.05,size.width * 0.05,size.width * 0.05,size.width * 0.05),
                    child: Text(
                      st?.email??"",
                      style: TextStyle(
                          fontSize: size.width * 0.040,
                          fontFamily: 'BeVietnamPro'),
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
