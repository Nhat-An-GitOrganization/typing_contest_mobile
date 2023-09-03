import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    super.key,
    this.onChanged,
  });
  final ValueChanged? onChanged;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20 / 4,
          ),
          decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.4),
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextField(
            onChanged: onChanged,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              icon: SvgPicture.asset('lib/svg/search.svg'),
              hintText: 'Search',
              hintStyle: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
