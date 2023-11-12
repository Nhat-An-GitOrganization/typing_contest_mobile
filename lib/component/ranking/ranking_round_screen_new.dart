import 'package:flutter/material.dart';

class RankingRoundScreenNew extends StatelessWidget {
  const RankingRoundScreenNew({super.key});

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
          physics: const NeverScrollableScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.all(size.height * 0.01),
            child: Column(
              children: [
                Text(
                  'BẢNG XẾP HẠNG VÒNG THI',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: size.width * 0.065,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'BeVietnamPro'),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.lightBlue,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(size.width * 0.01),
                    child: Container(
                      height: size.height * 0.32,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.lightBlue,
                      ),
                      child: GridView.count(
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 3,
                        scrollDirection: Axis.vertical,
                        childAspectRatio: 0.48,
                        children: const [
                          ContestantList2(
                            url1: 'lib/images/1st.png',
                            url2: 'lib/images/3cham.png',
                            url: 'lib/images/actor_1.png',
                            name: 'Shona',
                            wpm: '1145',
                            accuracy: '65%',
                            score: '1234',
                          ),
                          ContestantList2(
                            url1: 'lib/images/2nd.png',
                            url2: 'lib/images/3cham.png',
                            url: 'lib/images/actor_2.png',
                            name: 'Emily',
                            accuracy: '60%',
                            wpm: '1245',
                            score: '1345',
                          ),
                          ContestantList2(),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.0),
                          topRight: Radius.circular(15.0),
                          bottomLeft: Radius.circular(15.0),
                          bottomRight: Radius.circular(15.0)),
                      gradient: LinearGradient(colors: [
                        Colors.lightBlue,
                        Colors.lightBlue,
                        Colors.lightBlue
                      ])),
                  child: Padding(
                    padding: EdgeInsets.all(size.width * 0.01),
                    child: Container(
                      height: size.height * 0.24,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0),
                              bottomLeft: Radius.circular(10.0),
                              bottomRight: Radius.circular(10.0)),
                          color: Colors.white),
                      child: GridView.count(
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 1,
                        childAspectRatio: 5.9,
                        children: const [
                          ContestantList(
                            url: 'lib/images/actor_1.png',
                            name: 'Shona',
                            wpm: '1145',
                            accuracy: '65%',
                            rank: '1',
                          ),
                          ContestantList(
                            url: 'lib/images/actor_2.png',
                            name: 'Emily',
                            accuracy: '60%',
                            wpm: '1245',
                            rank: '2',
                          ),
                          ContestantList(),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                          bottomLeft: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0)),
                      gradient: LinearGradient(colors: [
                        Colors.transparent,
                        Colors.transparent,
                        Colors.transparent
                      ])),
                  child: Padding(
                    padding: EdgeInsets.all(size.width * 0.01),
                    child: Container(
                      height: size.height * 0.24,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0),
                              bottomLeft: Radius.circular(20.0),
                              bottomRight: Radius.circular(20.0)),
                          color: Colors.transparent),
                      child: GridView.count(
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 1,
                        childAspectRatio: 5.9,
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
                            name: 'Emily',
                            accuracy: '60%',
                            wpm: '1245',
                            rank: '6',
                          ),
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

class ContestantList extends StatelessWidget {
  final String? url;
  final String? name;
  final String? wpm;
  final String? score;
  final String? accuracy;
  final String? rank;
  const ContestantList(
      {Key? key,
      this.url,
      this.score,
      this.name,
      this.wpm,
      this.accuracy,
      this.rank})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(
        left: size.width * 0.0001,
      ),
      child: Padding(
        padding: EdgeInsets.all(size.width * 0.01),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      rank ?? '3',
                      style: const TextStyle(color: Colors.black),
                    ),
                    SizedBox(
                        width:
                            size.width * 0.05), // Khoảng cách giữa rank và url
                    Center(
                      child: ClipOval(
                        clipBehavior: Clip.antiAlias,
                        child: Image.asset(
                          url ?? 'lib/images/actor_4.png',
                          height: size.height * 0.06,
                          width: size.height * 0.06,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      name ?? 'Name',
                      style: const TextStyle(color: Colors.black),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      accuracy ?? '85%',
                      style: const TextStyle(color: Colors.black),
                    ),
                    Text(
                      wpm ?? '555',
                      style: const TextStyle(color: Colors.black),
                    ),
                    Text(
                      score ?? '555',
                      style: const TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ContestantList2 extends StatelessWidget {
  final String? url;
  final String? url1;
  final String? url2;
  final String? name;
  final String? wpm;
  final String? accuracy;
  final String? score;

  const ContestantList2({
    Key? key,
    this.url,
    this.url1,
    this.url2,
    this.name,
    this.wpm,
    this.score,
    this.accuracy,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(size.width * 0.00),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.lightBlue,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: ClipOval(
                  clipBehavior: Clip.antiAlias,
                  child: Image.asset(
                    url1 ?? 'lib/images/3rd.png',
                    height: size.height * 0.08,
                    width: size.height * 0.08,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: ClipOval(
                  clipBehavior: Clip.antiAlias,
                  child: Image.asset(
                    url2 ?? 'lib/images/3cham.png',
                    height: size.height * 0.08,
                    width: size.height * 0.08,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: ClipOval(
                  clipBehavior: Clip.antiAlias,
                  child: Image.asset(
                    url ?? 'lib/images/actor_4.png',
                    height: size.height * 0.07,
                    width: size.height * 0.07,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  name ?? 'Name',
                  style: const TextStyle(color: Colors.black),
                ),
              ),
              Text(
                accuracy ?? '85%',
                style: const TextStyle(color: Colors.black),
              ),
              Text(
                wpm ?? '555',
                style: const TextStyle(color: Colors.black),
              ),
              Text(
                score ?? '555',
                style: const TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
