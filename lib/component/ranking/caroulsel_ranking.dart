// ignore_for_file: file_names

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CaroulselRank extends StatefulWidget {
  const CaroulselRank({super.key});

  @override
  State<CaroulselRank> createState() => _CaroulselRankState();
}

class _CaroulselRankState extends State<CaroulselRank> {
  final CarouselController _carouselController = CarouselController();
  int _current = 0;

  final List<dynamic> _movies = [
    {
      'title': 'Spider-Man',
      'image':
          'https://m.media-amazon.com/images/I/71hvoqd-X3L._AC_SL1357_.jpg',
      'description': 'Spider-Man'
    },
    {
      'title': 'The Amazing Spiderman 2',
      'image':
          'https://scontent.fhan18-1.fna.fbcdn.net/v/t39.30808-6/405346930_669002545394862_41869691701001373_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=c42490&_nc_ohc=btztr1XoqWwAX9DXZBd&_nc_ht=scontent.fhan18-1.fna&oh=00_AfBiOMk6a_PDE4-RcBIE3BYzfI0ybNUszvhup6wH0vvB-g&oe=65750695',
      'description': 'The Amazing Spider-Man 2'
    },
    {
      'title': 'Spider-Man No Way Home',
      'image':
          'https://scontent.fhan18-1.fna.fbcdn.net/v/t39.30808-6/406899320_377699627969249_4017628346548516817_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=dd5e9f&_nc_ohc=Pqtmrpj29R0AX_1AUw7&_nc_ht=scontent.fhan18-1.fna&oh=00_AfBJbZswMyrs_-Vla5E_NRQc8Cp4hjc5rElUCSh7N9JEcg&oe=6575F94D',
      'description': 'Spider-Man No Way Home'
    }
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Image.network(_movies[_current]['image'], fit: BoxFit.cover),
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
                      });
                    }),
                carouselController: _carouselController,
                items: _movies.map((movie) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Container(
                                  height: 320,
                                  margin: const EdgeInsets.only(top: 30),
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Image.network(movie['image'],
                                      fit: BoxFit.cover),
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
                                  duration: const Duration(milliseconds: 500),
                                  opacity: _current == _movies.indexOf(movie)
                                      ? 1.0
                                      : 0.0,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0),
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
                                              '8.7',
                                              style: TextStyle(
                                                  fontSize: 14.0,
                                                  color: Colors.grey.shade600),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.access_time,
                                              color: Colors.grey.shade600,
                                              size: 20,
                                            ),
                                            const SizedBox(width: 5),
                                            Text(
                                              '3h',
                                              style: TextStyle(
                                                  fontSize: 14.0,
                                                  color: Colors.grey.shade600),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.2,
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.play_circle_filled,
                                                color: Colors.grey.shade600,
                                                size: 20,
                                              ),
                                              const SizedBox(width: 5),
                                              Text(
                                                'Watch',
                                                style: TextStyle(
                                                    fontSize: 14.0,
                                                    color:
                                                        Colors.grey.shade600),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ));
                    },
                  );
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
