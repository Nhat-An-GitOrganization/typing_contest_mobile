import 'package:carousel_slider/carousel_slider.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:typing_contest_mobile/component/ranking/ranking_round_screen.dart';

class CaroulselRank extends StatefulWidget {
  const CaroulselRank({super.key});

  @override
  State<CaroulselRank> createState() => _CaroulselRankState();
}

class _CaroulselRankState extends State<CaroulselRank> {
  final CarouselController _carouselController = CarouselController();
  List<ConfettiController> _confettiControllers = [];
  int _current = 0;

  final List<dynamic> _movies = [
    {
      'title': 'Cute Otter',
      'stand': 'lib/images/crown.png',
      'image':
          'https://cdn.analyticsvidhya.com/wp-content/uploads/2023/08/Magic-AI-.png',
      'description': 'Chúc mừng bạn đã đứng vị trí thứ 3',
      'color': Colors.brown
    },
    {
      'title': 'Sooo nè',
      'stand': 'lib/images/crown.png',
      'image':
          'https://news.artnet.com/app/news-upload/2022/12/prisma-labs-lensa-ai.jpg',
      'description': 'Chúc mừng bạn đã đứng vị trí thứ 2',
      'color': Colors.grey,
    },
    {
      'title': 'Nguyễn Lê Nhật An',
      'stand': 'lib/images/crown.png',
      'image':
          'https://m.media-amazon.com/images/I/71hvoqd-X3L._AC_SL1357_.jpg',
      'description': 'Chúc mừng bạn đã đứng vị trí thứ 1',
      'color': Colors.yellow
    },
  ];
  @override
  void initState() {
    super.initState();
    _confettiControllers = List.generate(_movies.length, (index) {
      return ConfettiController()..play();
    });
  }

  @override
  void dispose() {
    // Dispose confetti controllers
    for (var controller in _confettiControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Image.network(_movies[_current]['image'], fit: BoxFit.cover),
              for (int i = 0; i < _movies.length; i++)
                Positioned(
                  top: 0,
                  left: 180,
                  height: MediaQuery.of(context).size.height * 0.7,
                  width: MediaQuery.of(context).size.width,
                  child: ConfettiWidget(
                    confettiController: _confettiControllers[i],
                    blastDirectionality: BlastDirectionality.explosive,
                    blastDirection: pi / 2,
                    shouldLoop: true,
                    colors: const [Colors.red, Colors.blue, Colors.green],
                    minimumSize: const Size(2, 2),
                    maximumSize: const Size(15, 15),
                  ),
                ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: isDarkMode
                          ? [
                              const Color.fromARGB(255, 46, 55, 67).withOpacity(1),
                              const Color.fromARGB(255, 46, 55, 67).withOpacity(1),
                              const Color.fromARGB(255, 46, 55, 67).withOpacity(1),
                              const Color.fromARGB(255, 46, 55, 67).withOpacity(1),
                              const Color.fromARGB(255, 46, 55, 67).withOpacity(0.0),
                              const Color.fromARGB(255, 46, 55, 67).withOpacity(0.0),
                              const Color.fromARGB(255, 46, 55, 67).withOpacity(0.0),
                              const Color.fromARGB(255, 46, 55, 67).withOpacity(0.0),
                            ]
                          : [
                              Colors.grey.shade50.withOpacity(1),
                              Colors.grey.shade50.withOpacity(1),
                              Colors.grey.shade50.withOpacity(1),
                              Colors.grey.shade50.withOpacity(1),
                              Colors.grey.shade50.withOpacity(0.0),
                              Colors.grey.shade50.withOpacity(0.0),
                              Colors.grey.shade50.withOpacity(0.0),
                              Colors.grey.shade50.withOpacity(0.0),
                            ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 50,
                height: MediaQuery.of(context).size.height * 0.7,
                width: MediaQuery.of(context).size.width,
                child: CarouselSlider(
                  options: CarouselOptions(
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      height: 600.0,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.70,
                      enlargeCenterPage: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                          for (int i = 0; i < _movies.length; i++) {
                            _confettiControllers[i].play();
                          }
                        });
                      }),
                  carouselController: _carouselController,
                  items: _movies.map((movie) {
                    return Stack(
                      children: [
                        Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: SingleChildScrollView(
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: isDarkMode
                                          ? const Color.fromARGB(255, 16, 16, 20)
                                          : Colors.white),
                                  child: AnimatedOpacity(
                                    duration: const Duration(milliseconds: 500),
                                    opacity: _current == _movies.indexOf(movie)
                                        ? 1.0
                                        : 0.0,
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: AnimatedContainer(
                                        margin: EdgeInsets.only(
                                          top: _current == _movies.indexOf(movie)
                                              ? 0.0
                                              : 100.0,
                                        ),
                                        duration:
                                            const Duration(milliseconds: 500),
                                        child: Stack(
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 20.0),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    height: 320,
                                                    margin: const EdgeInsets.only(
                                                        top: 30),
                                                    clipBehavior: Clip.hardEdge,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                    child: Image.network(
                                                      movie['image'],
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 20),
                                                  Text(
                                                    movie['title'],
                                                    style: TextStyle(
                                                        color: isDarkMode
                                                            ? Colors.white
                                                            : Colors.black,
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  // rating
                                                  const SizedBox(height: 20),
                                                  Text(
                                                    movie['description'],
                                                    style: TextStyle(
                                                        fontSize: 14.0,
                                                        color: isDarkMode
                                                            ? const Color
                                                                .fromARGB(255,
                                                                234, 232, 232)
                                                            : Colors
                                                                .grey.shade600),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  const SizedBox(height: 20),
                                                  AnimatedOpacity(
                                                    duration: const Duration(
                                                        milliseconds: 500),
                                                    opacity: _current ==
                                                            _movies.indexOf(movie)
                                                        ? 1.0
                                                        : 0.0,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            const Icon(
                                                              Icons.star,
                                                              color:
                                                                  Colors.yellow,
                                                              size: 20,
                                                            ),
                                                            const SizedBox(
                                                                width: 5),
                                                            Text(
                                                              '12000',
                                                              style: TextStyle(
                                                                  fontSize: 14.0,
                                                                  color: Colors
                                                                      .grey
                                                                      .shade600),
                                                            )
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            Text(
                                                              'WPM: ',
                                                              style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize: 14.0,
                                                                color: Colors.blue
                                                                    .shade600,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                                width: 5),
                                                            Text(
                                                              '41',
                                                              style: TextStyle(
                                                                  fontSize: 14.0,
                                                                  color: Colors
                                                                      .grey
                                                                      .shade600),
                                                            )
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            Text(
                                                              'Acc',
                                                              style: TextStyle(
                                                                  fontSize: 14.0,
                                                                  color: Colors
                                                                      .green
                                                                      .shade600),
                                                            ),
                                                            const SizedBox(
                                                                width: 5),
                                                            Text(
                                                              '89%',
                                                              style: TextStyle(
                                                                  fontSize: 14.0,
                                                                  color: Colors
                                                                      .grey
                                                                      .shade600),
                                                            )
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Positioned(
                                              child: Center(
                                                child: Image.asset(
                                                  movie['stand'],
                                                  width: 70,
                                                  color: movie['color'],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
              Positioned(
                right: 20,
                bottom: 20,
                child: TextButton.icon(
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
                        fontSize: 20,
                        color: isDarkMode ? Colors.white : Colors.black),
                  ),
                  icon: Icon(
                    FontAwesomeIcons.arrowRightLong,
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
