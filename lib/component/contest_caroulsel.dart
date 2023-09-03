import 'package:flutter/material.dart';
import 'package:typing_contest_mobile/component/card_carousel.dart';
import 'package:typing_contest_mobile/models/contest.dart';

class ContestCarousel extends StatefulWidget {
  const ContestCarousel({super.key});

  @override
  State<ContestCarousel> createState() => _ContestCarouselState();
}

class _ContestCarouselState extends State<ContestCarousel> {
  late PageController _pageController;
  int initialPage = 1;
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
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: AspectRatio(
        aspectRatio: 0.85,
        child: PageView.builder(
          // controller: _pageController,
          itemCount: contest.length,
          itemBuilder: (context, index) => ContestCardCarou(ct: contest[index]),
        ),
      ),
    );
  }
}

