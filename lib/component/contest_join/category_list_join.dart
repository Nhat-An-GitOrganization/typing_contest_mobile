import 'package:flutter/material.dart';

class CategoryJoinList extends StatefulWidget {
  const CategoryJoinList({super.key});

  @override
  State<CategoryJoinList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryJoinList> {
  int selectedIndex = 0;
  List categories = ['All', 'Contest'];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20 / 2),
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(
              left: 20,
              right: index == categories.length - 1 ? 20 : 0,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.5),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              categories[index],
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
