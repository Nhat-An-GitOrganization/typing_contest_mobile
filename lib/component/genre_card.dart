import 'package:flutter/material.dart';

class GenreCard extends StatelessWidget {
  final String genre;

  const GenreCard({super.key, required this.genre});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(left: 20),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20 / 4, // 5 padding top and bottom
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black26),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        genre,
        style: TextStyle(
          color: isDarkMode
              ? Colors.white.withOpacity(0.5)
              : Colors.black.withOpacity(0.8),
          fontSize: 16,
        ),
      ),
    );
  }
}
