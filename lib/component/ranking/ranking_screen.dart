import 'package:flutter/material.dart';

const Color primaryColor = Colors.blue; // Màu xanh chính
const Color secondaryColor = Colors.white; // Màu trắng

class RankingScreen extends StatelessWidget {
  final List<String> names = [
    "Người chơi 1",
    "Người chơi 2",
    "Người chơi 3",
    "Người chơi 4",
    "Người chơi 5",
    "Người chơi 6",
    "Người chơi 7",
    "Người chơi 8",
    "Người chơi 9",
    "Người chơi 10",
  ];

  RankingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: primaryColor,
            pinned: true,
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[
                      primaryColor.withOpacity(0.7),
                      secondaryColor,
                    ],
                  ),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "BẢNG XẾP HẠNG",
                      style: TextStyle(
                        fontSize: 30,
                        color: secondaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Icon(
                      Icons.emoji_events_rounded,
                      color: Colors.yellow, // Màu vàng
                      size: 70,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return buildRankingItem(context, index);
              },
              childCount: names.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRankingItem(BuildContext context, int index) {
    final position = index + 1;
    final playerName = names[index];
    const playerScore = 100; // Thay thế bằng điểm số thực tế của người chơi

    Color itemColor = Colors.white;
    if (position == 1) {
      itemColor = Colors.yellow;
    } else if (position == 2) {
      itemColor = Colors.grey;
    } else if (position == 3) {
      itemColor = Colors.brown;
    }

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      shadowColor: Colors.grey[200],
      color: itemColor,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              position.toString(),
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const CircleAvatar(
              foregroundColor: Colors.green,
            ),
            Text(
              playerName,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              "$playerScore điểm",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
