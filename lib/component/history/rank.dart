import 'package:flutter/material.dart';
import 'package:typing_contest_mobile/models/contest.dart';

// ignore: camel_case_types
class His_Rank extends StatelessWidget {
  const His_Rank({
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
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      margin: EdgeInsets.symmetric(
        horizontal: size.width * 0.02,
        vertical: size.width * 0.025,
      ),
      height: size.height * 0.12,
      child: InkWell(
        child: Stack(
          children: [
            Container(
              //height: size.height * 0.25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                color: isDarkMode
                    ? const Color.fromARGB(255, 76, 76, 76)
                    : const Color.fromARGB(255, 216, 237, 255),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(size.width * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: size.width * 0.04),
                    child: Text(
                      '1',
                      style: TextStyle(
                        //color: const Color.fromARGB(255, 58, 69, 75),
                        fontSize: size.width * 0.045,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.zero,
                    child: Text(
                      '29:43  20/12/2022 ',
                      style: TextStyle(
                        //color: const Color.fromARGB(255, 58, 69, 75),
                        fontSize: size.width * 0.04,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: size.width * 0.07),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Vòng 5/6',
                          style: TextStyle(
                            //color: const Color.fromARGB(255, 58, 69, 75),
                            fontSize: size.width * 0.036,
                          ),
                        ),
                        Text(
                          '534545',
                          style: TextStyle(
                            //color: const Color.fromARGB(255, 58, 69, 75),
                            fontSize: size.width * 0.036,
                          ),
                        ),
                        Text(
                          '534545',
                          style: TextStyle(
                            //color: const Color.fromARGB(255, 58, 69, 75),
                            fontSize: size.width * 0.036,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
