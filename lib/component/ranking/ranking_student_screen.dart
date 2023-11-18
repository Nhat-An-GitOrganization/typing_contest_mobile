import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:typing_contest_mobile/component/ranking/ranking_round_screen.dart';

class RankingStudentScreen extends StatefulWidget {
  const RankingStudentScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _RankingStudentScreenState createState() => _RankingStudentScreenState();
}

class _RankingStudentScreenState extends State<RankingStudentScreen> {
  final CarouselController carouselController = CarouselController();
  final ConfettiController controller = ConfettiController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return WillPopScope(
        onWillPop: () async {
          // Disable the back button press
          return false;
        },
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: size.height * 0.10,
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ConfettiWidget(
                        confettiController: controller,
                        shouldLoop: true,
                        blastDirectionality: BlastDirectionality.explosive,
                      ),
                      SizedBox(
                        height: size.height * 0.8,
                        width: size.height * 0.42,
                        child: Column(
                          children: [
                            CarouselSlider(
                              carouselController: carouselController,
                              options: CarouselOptions(
                                height: size.height * 0.8,
                                aspectRatio: 16 / 9,
                                viewportFraction: 1,
                                initialPage: 0,
                                enableInfiniteScroll: false,
                                autoPlay: true,
                                autoPlayInterval: const Duration(seconds: 3),
                                autoPlayAnimationDuration:
                                    const Duration(milliseconds: 2000),
                                autoPlayCurve: Curves.fastOutSlowIn,
                                enlargeCenterPage: true,
                                scrollDirection: Axis.horizontal,
                                onPageChanged: (index, reason) {
                                  if (index == 2) {
                                    carouselController.stopAutoPlay();
                                    controller.play();
                                  }
                                },
                              ),
                              items: [
                                const PlayerCard(
                                  url: 'lib/images/actor_1.png',
                                  playerName: 'giangnlhph26511@fpt.edu.vn',
                                  wpm: 999,
                                  accuracy: '100%',
                                  score: 9999,
                                  cardIndex: 1,
                                ),
                                const PlayerCard(
                                  url: 'lib/images/actor_2.png',
                                  playerName: 'giangnlhph26511@fpt.edu.vn',
                                  wpm: 999,
                                  accuracy: '100%',
                                  score: 9999,
                                  cardIndex: 2,
                                ),
                                const PlayerCard(
                                  url: 'lib/images/actor_3.png',
                                  playerName: 'giangnlhph26511@fpt.edu.vn',
                                  wpm: 999,
                                  accuracy: '100%',
                                  score: 9999,
                                  cardIndex: 3,
                                ),
                              ].reversed.toList(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                TextButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RankingRoundScreen()),
                    );
                  },
                  label: Text(
                    'Bỏ Qua',
                    style: TextStyle(
                      fontSize: 30,
                      color: isDarkMode
                          ? const Color.fromARGB(255, 58, 69, 75)
                          : const Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  icon: Icon(
                    FontAwesomeIcons.arrowRightLong,
                    color: isDarkMode
                        ? const Color.fromARGB(255, 58, 69, 75)
                        : const Color.fromARGB(255, 255, 255, 255),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

class PlayerCard extends StatelessWidget {
  final String? url;
  final String playerName;
  final int wpm;
  final int score;
  final String? accuracy;
  final int cardIndex;

  const PlayerCard({
    required this.url,
    required this.playerName,
    required this.wpm,
    required this.score,
    required this.accuracy,
    required this.cardIndex,
    Key? key,
  }) : super(key: key);
  Color getBorderColor() {
    if (cardIndex == 1) {
      return const Color.fromRGBO(255, 215, 0, 1);
    } else if (cardIndex == 2) {
      return Colors.grey;
    } else if (cardIndex == 3) {
      return Colors.orange;
    } else {
      return Colors.transparent; // Mặc định không có viền
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
        color: isDarkMode
            ? const Color.fromARGB(255, 58, 69, 75)
            : const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (cardIndex == 1)
              Image.asset(
                'lib/images/crown.png',
                height: size.height * 0.04,
                width: size.width * 0.12,
              )
            else
              SizedBox(height: size.height * 0.045),
            Column(
              children: [
                Container(
                  width: size.width *
                      0.30, // Kích thước mong muốn cho hình tròn và viền
                  height: size.height * 0.15,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: getBorderColor(),
                      width: 4.0, // Độ rộng của đường viền
                    ),
                  ),
                  padding: const EdgeInsets.all(
                      0.0), // Khoảng cách từ đường viền đến hình ảnh
                  child: ClipOval(
                    child: Image.asset(
                      url ?? 'lib/images/actor_1.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                if (cardIndex == 1)
                  FaIcon(
                    FontAwesomeIcons.medal,
                    color: getBorderColor(),
                    size: size.height * 0.05,
                  ),
                if (cardIndex == 2 || cardIndex == 3)
                  FaIcon(
                    FontAwesomeIcons.medal,
                    color: getBorderColor(),
                    size: size.height * 0.05,
                  ),
              ],
            ),
            SizedBox(height: size.height * 0.035),
            Text(
              playerName,
              style: TextStyle(
                fontSize: size.height * 0.03,
                color: isDarkMode
                    ? const Color.fromARGB(255, 255, 255, 255)
                    : const Color.fromARGB(255, 58, 69, 75),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: size.height * 0.02),
            Text(
              '$wpm' 'WPM' ' | $accuracy',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: size.height * 0.045,
                color: isDarkMode
                    ? const Color.fromARGB(255, 255, 255, 255)
                    : const Color.fromARGB(255, 58, 69, 75),
              ),
            ),
            SizedBox(height: size.height * 0.02),
            Text(
              '$score',
              style: TextStyle(
                fontSize: size.height * 0.045,
                color: isDarkMode
                    ? const Color.fromARGB(255, 255, 255, 255)
                    : const Color.fromARGB(255, 58, 69, 75),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
