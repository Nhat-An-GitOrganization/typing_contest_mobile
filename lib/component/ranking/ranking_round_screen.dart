import 'package:flutter/material.dart';

const Color primaryColor = Colors.blue; // Màu xanh chính
const Color secondaryColor = Colors.white; // Màu trắng

// ignore: must_be_immutable
class RankingRoundScreen extends StatelessWidget {
  List<String> names = [
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

  RankingRoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Tắt biểu tượng debug
      home: Scaffold(
        bottomNavigationBar: BottomAppBar(
          child: Container(
            color: secondaryColor,
            child: Card(
              margin:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
              elevation: 0,
              color: primaryColor,
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Vị trí",
                      style: TextStyle(
                        color: secondaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    CircleAvatar(
                      foregroundColor: Colors.green,
                    ),
                    Text(
                      "Tên",
                      style: TextStyle(
                        color: secondaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Điểm",
                      style: TextStyle(
                        color: secondaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: primaryColor,
              pinned: true,
              snap: false,
              floating: false,
              expandedHeight: 200.0,
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(4.0),
                child: Container(
                  color: primaryColor.withOpacity(0.7),
                  height: 50,
                  child: const Row(
                    children: [
                      SizedBox(width: 35),
                      Text(
                        "Vị trí",
                        style: TextStyle(
                          color: secondaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 52),
                      Text(
                        "Hồ sơ",
                        style: TextStyle(
                          color: secondaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 60),
                      Text(
                        "Tên",
                        style: TextStyle(
                          color: secondaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 60),
                      Text(
                        "Điểm",
                        style: TextStyle(
                          color: secondaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: <Color>[
                        primaryColor.withOpacity(0.7),
                        secondaryColor
                      ],
                    ),
                  ),
                  child: const Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 50.0),
                        child: Text(
                          "BẢNG XẾP HẠNG",
                          style: TextStyle(
                            fontSize: 30,
                            color: secondaryColor,
                            fontWeight: FontWeight.bold,
                          ),
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
              elevation: 9.0,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) => buildList(context, index),
                childCount: names.length,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildList(BuildContext txt, int index) {
    int ind = index + 1;
    final pos = ind.toString();
    final name = names[index];

    Widget listItem;

    if (ind == 1) {
      listItem = Card(
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        shadowColor: Colors.grey[200],
        color: Colors.yellow, // Màu vàng
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                pos,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const CircleAvatar(
                foregroundColor: Colors.green,
              ),
              Text(
                name,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "Điểm",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      );
    } else if (ind == 2) {
      listItem = Card(
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        shadowColor: Colors.grey[200],
        color: Colors.grey,
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                pos,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const CircleAvatar(
                foregroundColor: Colors.green,
              ),
              Text(
                name,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "Điểm",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      );
    } else if (ind == 3) {
      listItem = Card(
        shadowColor: Colors.grey[200],
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        color: Colors.brown,
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                pos,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const CircleAvatar(
                foregroundColor: Colors.green,
              ),
              Text(
                name,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "Điểm",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      );
    } else {
      listItem = Card(
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        shadowColor: Colors.grey[200],
        color: secondaryColor, // Màu trắng
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                pos,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const CircleAvatar(
                foregroundColor: Colors.green,
              ),
              Text(
                name,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "Điểm",
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

    return Stack(
      children: [
        Container(
          color: Colors.grey[200],
          child: listItem,
        ),
      ],
    );
  }
}
