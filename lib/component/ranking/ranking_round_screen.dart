import 'package:flutter/material.dart';
import 'package:typing_contest_mobile/screen/home_screen.dart';

class RankingRoundScreen extends StatelessWidget {
  const RankingRoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
        color: Colors.lightBlue,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
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
                      color: Colors.white,
                      fontSize: size.width * 0.07,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'BeVietnamPro'),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      gradient: const LinearGradient(
                          colors: [Colors.white, Colors.white, Colors.white])),
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
                        url: 'lib/images/actor_1.png',
                        winnerName: 'Alina',
                        height: size.height * 0.16,
                        rank: '2',
                        color: Colors.green,
                      ),
                      const WinnerContainer(
                        isFirst: true,
                        color: Colors.yellow,
                      ),
                      WinnerContainer(
                        winnerName: 'Sofiya',
                        url: 'lib/images/actor_1.png',
                        height: size.height * 0.15,
                        rank: '3',
                        color: Colors.orange,
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
                          colors: [Colors.white, Colors.white, Colors.white])),
                  child: Padding(
                    padding: EdgeInsets.all(size.width * 0.002),
                    child: Container(
                      height: size.height * 0.47,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0)),
                          color: Colors.blue),
                      child: GridView.count(
                        crossAxisCount: 1,
                        childAspectRatio: 3.5,
                        children: const [
                          ContestantList(
                            url: 'lib/images/actor_1.png',
                            name: 'Shona',
                            rank: '1145',
                          ),
                          ContestantList(
                            url: 'lib/images/actor_1.png',
                            name: 'Emily',
                            rank: '1245',
                          ),
                          ContestantList(
                            url: 'lib/images/actor_1.png',
                            name: 'Josheph',
                            rank: '2153',
                          ),
                          ContestantList(
                            url: 'lib/images/actor_1.png',
                            rank: '3456',
                            name: 'Kristine',
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
  final double? height;
  const WinnerContainer(
      {Key? key,
      this.isFirst = false,
      this.color,
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
                      colors: [Colors.white, Colors.white, Colors.white]),
                  border: Border.all(
                    color:
                        Colors.white, //kHintColor, so this should be changed?
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
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40.0),
                          topRight: Radius.circular(40.0)),
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
                    height: size.height * 0.096,
                    width: size.width * 0.27,
                  ),
                Padding(
                  padding: EdgeInsets.only(
                      top: size.height * 0.06, left: size.height * 0.02),
                  child: ClipOval(
                    clipBehavior: Clip.antiAlias,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                            colors: [Colors.white, Colors.white, Colors.white]),
                        border: Border.all(
                          color: Colors
                              .amber, //kHintColor, so this should be changed?
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
                      top: size.height * 0.145, left: size.height * 0.06),
                  child: Container(
                    height: size.height * 0.025,
                    width: size.height * 0.025,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: color ?? Colors.red,
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
            top: size.width * 0.38,
            child: SizedBox(
              width: size.width * 0.26,
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
                      rank ?? '1',
                      style: TextStyle(
                        color: color ?? Colors.white,
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
  final String? rank;
  const ContestantList({Key? key, this.url, this.name, this.rank})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(
          left: size.width * 0.06,
          right: size.width * 0.06,
          bottom: size.width * 0.01,
          top: size.width * 0.03),
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
              colors: [Colors.white, Colors.white, Colors.white]),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(size.width * 0.005),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.05, vertical: size.width * 0.01),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: ClipOval(
                        clipBehavior: Clip.antiAlias,
                        child: Image.asset(
                          url ?? 'lib/images/actor_1.png',
                          height: size.height * 0.07,
                          width: size.height * 0.07,
                          fit: BoxFit.fill,
                        )),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name ?? 'Name',
                        style: const TextStyle(color: Colors.white),
                      ),
                      Text(
                        '@${name ?? 'Name'}',
                        style: TextStyle(
                          color: Colors.white54,
                          fontSize: size.width * 0.04,
                          fontFamily: 'BeVietnamPro',
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        rank ?? '1234',
                        style: const TextStyle(color: Colors.white),
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
