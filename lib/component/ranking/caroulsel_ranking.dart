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
      'title': 'Nguyễn Lê Nhật An',
      'stand': 'lib/images/crown.png',
      'image':
          'https://m.media-amazon.com/images/I/71hvoqd-X3L._AC_SL1357_.jpg',
      'description': 'Chúc mừng bạn đã đứng vị trí thứ 1',
      'color': Colors.yellow
    },
    {
      'title': 'Sooo nè',
      'stand': 'lib/images/crown.png',
      'image':
          'https://scontent.fhan18-1.fna.fbcdn.net/v/t39.30808-6/405346930_669002545394862_41869691701001373_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=c42490&_nc_ohc=btztr1XoqWwAX9DXZBd&_nc_ht=scontent.fhan18-1.fna&oh=00_AfBiOMk6a_PDE4-RcBIE3BYzfI0ybNUszvhup6wH0vvB-g&oe=65750695',
      'description': 'Chúc mừng bạn đã đứng vị trí thứ 2',
      'color': Colors.grey,
    },
    {
      'title': 'Cute Otter',
      'stand': 'lib/images/crown.png',
      'image':
          'https://scontent.fhan18-1.fna.fbcdn.net/v/t39.30808-6/406899320_377699627969249_4017628346548516817_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=dd5e9f&_nc_ohc=Pqtmrpj29R0AX_1AUw7&_nc_ht=scontent.fhan18-1.fna&oh=00_AfBJbZswMyrs_-Vla5E_NRQc8Cp4hjc5rElUCSh7N9JEcg&oe=6575F94D',
      'description': 'Chúc mừng bạn đã đứng vị trí thứ 3',
      'color': Colors.brown
    }
  ];
  @override
  void initState() {
    super.initState();
    _confettiControllers = List.generate(_movies.length, (index) {
      return ConfettiController();
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
    // bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
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
                          colors: [
                        Colors.grey.shade50.withOpacity(1),
                        Colors.grey.shade50.withOpacity(1),
                        Colors.grey.shade50.withOpacity(1),
                        Colors.grey.shade50.withOpacity(1),
                        Colors.grey.shade50.withOpacity(0.0),
                        Colors.grey.shade50.withOpacity(0.0),
                        Colors.grey.shade50.withOpacity(0.0),
                        Colors.grey.shade50.withOpacity(0.0),
                      ])),
                ),
              ),
              Positioned(
                bottom: 50,
                height: MediaQuery.of(context).size.height * 0.7,
                width: MediaQuery.of(context).size.width,
                child: CarouselSlider(
                  options: CarouselOptions(
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 2),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      height: 500.0,
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
                                child: AnimatedOpacity(
                                  opacity: _current == _movies.indexOf(movie)
                                      ? 1.0
                                      : 0.0,
                                  duration: const Duration(milliseconds: 500),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 320,
                                          margin:
                                              const EdgeInsets.only(top: 30),
                                          clipBehavior: Clip.hardEdge,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Image.network(
                                            movie['image'],
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        const SizedBox(height: 20),
                                        Text(
                                          movie['title'],
                                          style: const TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        // rating
                                        const SizedBox(height: 20),
                                        Text(
                                          movie['description'],
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              color: Colors.grey.shade600),
                                          textAlign: TextAlign.center,
                                        ),
                                        const SizedBox(height: 20),
                                        AnimatedOpacity(
                                          duration:
                                              const Duration(milliseconds: 500),
                                          opacity:
                                              _current == _movies.indexOf(movie)
                                                  ? 1.0
                                                  : 0.0,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  const Icon(
                                                    Icons.star,
                                                    color: Colors.yellow,
                                                    size: 20,
                                                  ),
                                                  const SizedBox(width: 5),
                                                  Text(
                                                    '12000',
                                                    style: TextStyle(
                                                        fontSize: 14.0,
                                                        color: Colors
                                                            .grey.shade600),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    'WPM: ',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14.0,
                                                      color:
                                                          Colors.blue.shade600,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 5),
                                                  Text(
                                                    '41',
                                                    style: TextStyle(
                                                        fontSize: 14.0,
                                                        color: Colors
                                                            .grey.shade600),
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
                                                            .green.shade600),
                                                  ),
                                                  const SizedBox(width: 5),
                                                  Text(
                                                    '89%',
                                                    style: TextStyle(
                                                        fontSize: 14.0,
                                                        color: Colors
                                                            .grey.shade600),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
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
                bottom: 30,
                child: TextButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RankingRoundScreen()),
                    );
                  },
                  label: const Text(
                    'Bỏ Qua',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black
                    ),
                  ),
                  icon: const Icon(                  
                    FontAwesomeIcons.arrowRightLong,
                    color: Colors.black,
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
