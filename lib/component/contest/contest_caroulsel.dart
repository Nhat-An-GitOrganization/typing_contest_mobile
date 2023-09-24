import 'package:flutter/material.dart';
import 'package:typing_contest_mobile/component/contest/card_carousel.dart';
import 'package:typing_contest_mobile/models/contest.dart';
import 'dart:math' as math;

class ContestCarousel extends StatefulWidget {
  const ContestCarousel({super.key});

  @override
  State<ContestCarousel> createState() => _ContestCarouselState();
}

class _ContestCarouselState extends State<ContestCarousel> {
  late PageController _pageController;
  int initialPage = 0;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      viewportFraction: 0.8,
      initialPage: initialPage,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0),
      child: AspectRatio(
        aspectRatio: 0.95,
        child: PageView.builder(
          onPageChanged: (value) {
            setState(() {
              initialPage = value;
            });
          },
          controller: _pageController,
          physics: const ClampingScrollPhysics(),
          itemCount: contest.length,
          itemBuilder: (context, index) => buildContestSlider(index),
        ),
      ),
    );
  }

  Widget buildContestSlider(int index) => AnimatedBuilder(
        animation: _pageController,
        builder: (context, child) {
          double value = 0;
          if (_pageController.position.haveDimensions) {
            value = index - _pageController.page!;
            // Use 0.038 because 180*0.038 = 7 almost and we to rotate our poster
            //Use clamp so that value vary from -1 to 1
            value = (value * 0.038).clamp(-1, 1);
          }
          return AnimatedOpacity(
            duration: const Duration(milliseconds: 350),
            opacity: initialPage == index ? 1 : 0.4,
            child: Transform.rotate(
              angle: math.pi * value,
              child: ContestCardCarou(ct: contest[index]),
            ),
          );
        },
      );
}
