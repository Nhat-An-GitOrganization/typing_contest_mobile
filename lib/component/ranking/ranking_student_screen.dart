import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
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
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.blue,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Text(
                    'Quay lại bài thi',
                    style: TextStyle(
                      fontSize: size.height * 0.025,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: size.height * 0.02),
                  Text(
                    'Bài thi test 1',
                    style: TextStyle(
                      fontSize: size.height * 0.05,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  ConfettiWidget(
                    confettiController: controller,
                    shouldLoop: true,
                    blastDirectionality: BlastDirectionality.explosive,
                  ),
                  SizedBox(height: size.height * 0.05),
                  SizedBox(
                    height: size.height * 0.6,
                    width: size.height * 0.4,
                    child: Column(
                      children: [
                        CarouselSlider(
                          carouselController: carouselController,
                          options: CarouselOptions(
                            height: size.height * 0.55,
                            aspectRatio: 16 / 9,
                            viewportFraction: 0.8,
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
                                playerName: 'Player 1',
                                wpm: 250,
                                accuracy: '90%'),
                            const PlayerCard(
                                url: 'lib/images/actor_2.png',
                                playerName: 'Player 2',
                                wpm: 150,
                                accuracy: '80%'),
                            const PlayerCard(
                                url: 'lib/images/actor_3.png',
                                playerName: 'Player 3',
                                wpm: 100,
                                accuracy: '70%'),
                          ].reversed.toList(),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RankingRoundScreen()),
                      );
                    },
                    child: const Text('Xem Bảng Xếp Hạng'),
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

class PlayerCard extends StatelessWidget {
  final String? url;
  final String playerName;
  final int wpm;
  final String? accuracy;

  const PlayerCard({
    required this.url,
    required this.playerName,
    required this.wpm,
    required this.accuracy,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Colors.lightBlue,
            Colors.white,
            Colors.lightBlue,
            Colors.yellow,
            Colors.lightBlue,
          ],
          stops: [
            0.1,
            0.4,
            0.6,
            0.8,
            1,
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              url ?? 'lib/images/actor_1.png',
              height: 100,
              width: 100,
              fit: BoxFit.fill,
            ),
            SizedBox(height: size.height * 0.035),
            Text(
              playerName,
              style:
                  TextStyle(fontSize: size.height * 0.035, color: Colors.white),
            ),
            SizedBox(height: size.height * 0.03),
            Text(
              'WPM: $wpm',
              style:
                  TextStyle(fontSize: size.height * 0.035, color: Colors.white),
            ),
            SizedBox(height: size.height * 0.03),
            Text(
              'Accuracy: $accuracy',
              style:
                  TextStyle(fontSize: size.height * 0.035, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
