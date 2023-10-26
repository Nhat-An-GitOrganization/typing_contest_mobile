import 'package:flutter/material.dart';

class RankingRoundScreen extends StatelessWidget {
  const RankingRoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.blue,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(size.height * 0.008),
            child: Column(
              children: [
                Text(
                  'BẢNG XẾP HẠNG VÒNG THI',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: size.width * 0.07,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'BeVietnamPro'),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      gradient: const LinearGradient(
                          colors: [Colors.blue, Colors.blue, Colors.blue])),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      WinnerContainer(
                        url: 'lib/images/actor_2.png',
                        winnerName: 'Alina',
                        height: size.height * 0.16,
                        rank: '2',
                        wpm: '888',
                        accuracy: '90%',
                        color: Colors.lightGreen,
                      ),
                      const WinnerContainer(
                        isFirst: true,
                        color: Colors.yellow,
                      ),
                      WinnerContainer(
                        winnerName: 'Sofiya',
                        url: 'lib/images/actor_3.png',
                        height: size.height * 0.15,
                        rank: '3',
                        wpm: '777',
                        accuracy: '80%',
                        color: Colors.pink,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0)),
                      gradient: LinearGradient(
                          colors: [Colors.blue, Colors.blue, Colors.blue])),
                  child: Padding(
                    padding: EdgeInsets.all(size.width * 0.002),
                    child: Container(
                      height: size.height * 0.47,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0)),
                          color: Colors.white),
                      child: GridView.count(
                        crossAxisCount: 1,
                        childAspectRatio: 3.5,
                        children: const [
                          ContestantList(
                            url: 'lib/images/actor_1.png',
                            name: 'Shona',
                            wpm: '1145',
                            accuracy: '65%',
                            rank: '4',
                          ),
                          ContestantList(
                            url: 'lib/images/actor_2.png',
                            name: 'Emily',
                            accuracy: '60%',
                            wpm: '1245',
                            rank: '5',
                          ),
                          ContestantList(
                            url: 'lib/images/actor_3.png',
                            name: 'Josheph',
                            accuracy: '60%',
                            wpm: '2153',
                            rank: '6',
                          ),
                          ContestantList(
                            url: 'lib/images/actor_4.png',
                            accuracy: '55%',
                            wpm: '3456',
                            name: 'Kristine',
                            rank: '7',
                          ),
                          ContestantList(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class WinnerContainer extends StatelessWidget {
  final bool isFirst;
  final Color? color;
  final String? winnerPosition;
  final String? url;
  final String? winnerName;
  final String? rank;
  final String? accuracy;
  final String? wpm;
  final double? height;
  const WinnerContainer(
      {Key? key,
      this.isFirst = false,
      this.color,
      this.accuracy,
      this.wpm,
      this.winnerPosition,
      this.winnerName,
      this.rank,
      this.height,
      this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(size.width * 0.002),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: size.height * 0.11),
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Colors.lightBlue,
                      Colors.lightBlue,
                      Colors.lightBlue,
                      Colors.lightBlue,
                      Colors.lightBlue,
                    ],
                    stops: [
                      0.1,
                      0.4,
                      0.6,
                      0.8,
                      1,
                    ],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  ),
                  border: Border.all(
                    color: Colors.blue,
                  ),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0)),
                ),
                child: Padding(
                  padding: EdgeInsets.all(size.width * 0.002),
                  child: Container(
                    height: height ?? size.height * 0.18,
                    width: size.width * 0.26,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.lightBlue.withOpacity(0.1),
                          Colors.lightBlue.withOpacity(0.4),
                          Colors.lightBlue.withOpacity(0.6),
                          Colors.lightBlue.withOpacity(0.8),
                          Colors.lightBlue.withOpacity(1),
                        ],
                        stops: const [
                          0.1,
                          0.4,
                          0.6,
                          0.8,
                          1,
                        ],
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.lightBlue.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                      border: Border.all(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Stack(
              children: [
                if (isFirst)
                  Image.asset(
                    'lib/images/crown.png',
                    height: size.height * 0.050,
                    width: size.width * 0.27,
                  ),
                Padding(
                  padding: EdgeInsets.only(
                      top: size.height * 0.06, left: size.height * 0.02),
                  child: ClipOval(
                    clipBehavior: Clip.antiAlias,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.lightBlue.withOpacity(0.1),
                            Colors.lightBlue.withOpacity(0.4),
                            Colors.lightBlue.withOpacity(0.6),
                            Colors.lightBlue.withOpacity(0.8),
                            Colors.lightBlue.withOpacity(1),
                          ],
                          stops: const [
                            0.1,
                            0.4,
                            0.6,
                            0.8,
                            1,
                          ],
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.lightBlue.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                        border: Border.all(
                          color: Colors.white,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(size.width * 0.005),
                        child: ClipOval(
                          clipBehavior: Clip.antiAlias,
                          child: Image.asset(
                            url ?? 'lib/images/actor_1.png',
                            height: size.height * 0.09,
                            width: size.height * 0.09,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: size.height * 0.145, left: size.height * 0.055),
                  child: Container(
                    height: size.height * 0.025,
                    width: size.height * 0.025,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: color ?? Colors.white,
                    ),
                    child: Center(
                        child: Text(
                      rank ?? '1',
                      style: const TextStyle(color: Colors.white),
                    )),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: size.height * 0.17,
            child: SizedBox(
              width: size.height * 0.14,
              child: Center(
                child: Column(
                  children: [
                    Text(
                      winnerName ?? 'Emma Aria',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: size.width * 0.04,
                          fontFamily: 'BeVietnamPro',
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      accuracy ?? '100%',
                      style: TextStyle(
                        color: color ?? Colors.blue,
                        fontSize: size.width * 0.05,
                        fontFamily: 'BeVietnamPro',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      wpm ?? '999',
                      style: TextStyle(
                        color: color ?? Colors.blue,
                        fontSize: size.width * 0.05,
                        fontFamily: 'BeVietnamPro',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ContestantList extends StatelessWidget {
  final String? url;
  final String? name;
  final String? wpm;
  final String? accuracy;
  final String? rank;
  const ContestantList(
      {Key? key, this.url, this.name, this.wpm, this.accuracy, this.rank})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(
          left: size.width * 0.06,
          right: size.width * 0.06,
          bottom: size.width * 0.03,
          top: size.width * 0.03),
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
              colors: [Colors.blue, Colors.blue, Colors.blue]),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(size.width * 0.005),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.05, vertical: size.width * 0.01),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        rank ?? '8',
                        style: const TextStyle(color: Colors.blue),
                      ),
                      SizedBox(
                          width: size.width *
                              0.05), // Khoảng cách giữa rank và url
                      Center(
                        child: ClipOval(
                          clipBehavior: Clip.antiAlias,
                          child: Image.asset(
                            url ?? 'lib/images/actor_1.png',
                            height: size.height * 0.07,
                            width: size.height * 0.07,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name ?? 'Name',
                        style: const TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        accuracy ?? '85%',
                        style: const TextStyle(color: Colors.blue),
                      ),
                      Text(
                        wpm ?? '555',
                        style: const TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
