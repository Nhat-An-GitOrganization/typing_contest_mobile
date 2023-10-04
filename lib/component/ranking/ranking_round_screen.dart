import 'package:flutter/material.dart';
import 'package:typing_contest_mobile/screen/home_screen.dart';

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
              // Xử lý sự kiện khi nút được nhấn
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
                        point: '888',
                        color: Colors.green,
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
                        point: '777',
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
                            rank: '1145',
                            position: '4',
                          ),
                          ContestantList(
                            url: 'lib/images/actor_2.png',
                            name: 'Emily',
                            rank: '1245',
                            position: '5',
                          ),
                          ContestantList(
                            url: 'lib/images/actor_3.png',
                            name: 'Josheph',
                            rank: '2153',
                            position: '6',
                          ),
                          ContestantList(
                            url: 'lib/images/actor_4.png',
                            rank: '3456',
                            name: 'Kristine',
                            position: '7',
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
  final String? point;
  final double? height;
  const WinnerContainer(
      {Key? key,
      this.isFirst = false,
      this.color,
      this.point,
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
                      colors: [Colors.blue, Colors.blue, Colors.blue]),
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
                    decoration: const BoxDecoration(
                      color: Colors.white,
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
                    height: size.height * 0.090,
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
                            colors: [Colors.blue, Colors.blue, Colors.blue]),
                        border: Border.all(
                          color: Colors.blue,
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
            top: size.width * 0.35,
            child: SizedBox(
              width: size.width * 0.27,
              child: Center(
                child: Column(
                  children: [
                    Text(
                      winnerName ?? 'Emma Aria',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: size.width * 0.04,
                          fontFamily: 'BeVietnamPro',
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      point ?? '999',
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
  final String? rank;
  final String? position;
  const ContestantList(
      {Key? key, this.url, this.name, this.rank, this.position})
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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        position ?? '8', // Hiển thị vị trí xếp hạng
                        style: const TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
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
                        style: const TextStyle(color: Colors.blue),
                      ),
                      Text(
                        '@${name ?? 'Name'}',
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: size.width * 0.045,
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
