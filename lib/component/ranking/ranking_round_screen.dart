import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:typing_contest_mobile/screen/home_screen.dart';

class RankingRoundScreen extends StatefulWidget {
  const RankingRoundScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _RankingRoundScreenState createState() => _RankingRoundScreenState();
}

class _RankingRoundScreenState extends State<RankingRoundScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: isDarkMode
            ? const Color.fromARGB(255, 58, 69, 75)
            : const Color.fromARGB(255, 255, 255, 255),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(30), // Đặt chiều cao tùy ý
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.blue,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: size.height * 0.03),
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.all(size.height * 0.00),
              child: Column(
                children: [
                  Text(
                    'BẢNG XẾP HẠNG',
                    style: TextStyle(
                        color: const Color.fromARGB(255, 146, 206, 255),
                        fontSize: size.width * 0.065,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'BeVietnamPro'),
                  ),
                  Text(
                    'TYPING BEE SPRING 2023 - VÒNG 1',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 146, 206, 255),
                      fontSize: size.width * 0.05,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: size.height * 0.1),
                        child: Image.asset(
                          'lib/images/podium.png',
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          WinnerContainer(
                            height: size.height * 0.2,
                            rank: '2',
                            cardIndex: 2,
                            value: size.height * 0.0003,
                            value2: size.height * 0.001,
                          ),
                          WinnerContainer(
                            isFirst: true,
                            value: size.height * 0.00001,
                            value2: size.height * 0.001,
                            cardIndex: 1,
                          ),
                          WinnerContainer(
                            rank: '3',
                            height: size.height * 0.18,
                            value: size.height * 0.0005,
                            cardIndex: 3,
                            value2: size.height * 0.001,
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.47),
                        child: SizedBox(
                          height: size.height * 0.3,
                          child: GridView.count(
                            crossAxisCount: 1,
                            childAspectRatio: 5.9,
                            children: const [
                              ContestantList(
                                url: 'lib/images/actor_1.png',
                                name: 'giangnlhph26511@fpt.edu.vn',
                                wpm: '999WPM',
                                accuracy: '100%',
                                score: '9999',
                                rank: '1',
                              ),
                              ContestantList(
                                url: 'lib/images/actor_1.png',
                                name: 'giangnlhph26511@fpt.edu.vn',
                                wpm: '888WPM',
                                accuracy: '100%',
                                score: '8888',
                                rank: '2',
                              ),
                              ContestantList(
                                url: 'lib/images/actor_1.png',
                                name: 'giangnlhph26511@fpt.edu.vn',
                                wpm: '777WPM',
                                accuracy: '100%',
                                score: '7777',
                                rank: '3',
                              ),
                              ContestantList(
                                url: 'lib/images/actor_1.png',
                                name: 'giangnlhph26511@fpt.edu.vn',
                                wpm: '666WPM',
                                accuracy: '100%',
                                score: '6666',
                                rank: '4',
                              ),
                              ContestantList(
                                url: 'lib/images/actor_1.png',
                                name: 'giangnlhph26511@fpt.edu.vn',
                                wpm: '666WPM',
                                accuracy: '100%',
                                score: '6666',
                                rank: '5',
                              ),
                              ContestantList(
                                url: 'lib/images/actor_1.png',
                                name: 'giangnlhph26511@fpt.edu.vn',
                                wpm: '666WPM',
                                accuracy: '100%',
                                score: '6666',
                                rank: '6',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ContestantList extends StatelessWidget {
  final String? url;
  final String? name;
  final String? wpm;
  final String? score;
  final String? accuracy;
  final String? rank;
  const ContestantList(
      {Key? key,
      this.url,
      this.score,
      this.name,
      this.wpm,
      this.accuracy,
      this.rank})
      : super(key: key);
  Color getColorForRank(String? rank) {
    if (rank == '1') {
      return const Color.fromARGB(255, 248, 221, 133);
    } else if (rank == '2') {
      return const Color.fromARGB(255, 250, 191, 80);
    } else if (rank == '3') {
      return const Color.fromARGB(255, 224, 153, 241);
    } else {
      return const Color.fromARGB(255, 146, 206, 255);
    }
  }

  Color getTextColor(String? rank) {
    if (rank == '1') {
      return const Color.fromARGB(255, 236, 96, 3);
    } else if (rank == '2') {
      return const Color.fromARGB(255, 218, 36, 12);
    } else if (rank == '3') {
      return const Color.fromARGB(255, 141, 51, 163);
    } else {
      return const Color.fromARGB(255, 26, 115, 232);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(size.width * 0.01),
      child: Container(
        decoration: BoxDecoration(
          color: getColorForRank(rank),
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(1), // Màu của đổ bóng
              spreadRadius: 0.5, // Kích thước đổ bóng
              blurRadius: 1, // Độ mờ của đổ bóng
              offset: const Offset(0, 1), // Vị trí của đổ bóng
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.00, vertical: size.height * 0.01),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(width: size.width * 0.05),
                  if (rank != '1' && rank != '2' && rank != '3')
                    FaIcon(
                      FontAwesomeIcons.hashtag,
                      color: getTextColor(rank),
                    ),
                  if (rank == '1')
                    FaIcon(
                      FontAwesomeIcons.trophy,
                      color: getTextColor(rank),
                    ),
                  if (rank == '2')
                    FaIcon(
                      FontAwesomeIcons.medal,
                      color: getTextColor(rank),
                    ),
                  if (rank == '3')
                    FaIcon(
                      FontAwesomeIcons.medal,
                      color: getTextColor(rank),
                    ),
                  SizedBox(width: size.width * 0.01),
                  Text(
                    rank ?? '6',
                    style: TextStyle(color: getTextColor(rank)),
                  ),
                  SizedBox(width: size.width * 0.02),
                  Center(
                    child: ClipOval(
                      clipBehavior: Clip.antiAlias,
                      child: Image.asset(
                        url ?? 'lib/images/actor_4.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    name ?? 'giangnlhph26511@fpt.edu.vn',
                    style: TextStyle(
                        color: getTextColor(rank),
                        fontSize: size.height * 0.015,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Text(
                      accuracy ?? '100%',
                      style: TextStyle(
                        color: getTextColor(rank),
                        fontSize: size.height * 0.015,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      wpm ?? '999WPM',
                      style: TextStyle(
                        color: getTextColor(rank),
                        fontSize: size.height * 0.015,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      score ?? '9999',
                      style: TextStyle(
                        color: getTextColor(rank),
                        fontSize: size.height * 0.015,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
              SizedBox(width: size.width * 0.05), // Adjust spacing
            ],
          ),
        ),
      ),
    );
  }
}

class WinnerContainer extends StatelessWidget {
  final double? height;
  final String? rank;
  final String? url;
  final String? name;
  final String? wpm;
  final String? accuracy;
  final String? score;
  final double? value;
  final int cardIndex;

  final double? value2;
  final bool isFirst;
  Color getBorderColor() {
     if (cardIndex == 1) {
      return const Color.fromARGB(255, 248, 221, 133);
    } else if (cardIndex == 2) {
      return const Color.fromARGB(255, 250, 191, 80);
    } else if (cardIndex == 3) {
      return const Color.fromARGB(255, 224, 153, 241);
    } else {
      return const Color.fromARGB(255, 146, 206, 255);
    }
  }

  const WinnerContainer({
    Key? key,
    this.isFirst = false,
    this.rank,
    this.url,
    this.name,
    this.wpm,
    required this.cardIndex,
    this.value,
    this.value2,
    this.score,
    this.accuracy,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Column(
      children: [
        if (isFirst)
          Image.asset(
            'lib/images/crown.png',
            height: size.height * 0.04,
            width: size.width * 0.1,
          ),
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: getBorderColor(),
              width: 2.0,
            ),
          ),
          padding: const EdgeInsets.all(0.0),
          child: ClipOval(
            child: Image.asset(
              url ?? 'lib/images/actor_1.png',
              fit: BoxFit.cover,
              width: size.width / 5,
            ),
          ),
        ),
        if (cardIndex == 1)
          FaIcon(
            FontAwesomeIcons.medal,
            color: getBorderColor(),
            size: size.height * 0.04,
          ),
        if (cardIndex == 2 || cardIndex == 3)
          FaIcon(
            FontAwesomeIcons.medal,
            color: getBorderColor(),
            size: size.height * 0.04,
          ),
        SizedBox(
          height: size.height * 0.01,
        ),
        Container(
          constraints: const BoxConstraints(maxWidth: 100),
          child: Align(
            alignment: Alignment.topCenter,
            child: Text(
              name ?? 'giangnlhph26511@fpt.edu.vn',
              style: TextStyle(
                color: isDarkMode ? Colors.white : Colors.black,
                fontSize: size.height * 0.016,
              ),
              textAlign: TextAlign.center,
              softWrap: true,
            ),
          ),
        ),
        SizedBox(
          height: size.height * 0.01,
        ),
      ],
    );
  }
}
