import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:typing_contest_mobile/screen/home_screen.dart';

class RankingScreen extends StatelessWidget {
  const RankingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: isDarkMode
            ? const Color.fromARGB(255, 58, 69, 75)
            : const Color.fromARGB(255, 255, 255, 255),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(30), // Đặt chiều cao tùy ý
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.blue,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                }),
          ),
        ),
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.all(size.height * 0.00),
            child: Column(
              children: [
                Text(
                  'BẢNG XẾP HẠNG',
                  style: TextStyle(
                      color: Colors.lightBlue,
                      fontSize: size.width * 0.065,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'BeVietnamPro'),
                ),
                Text(
                  'VÒNG THI TYPING BEE - VÒNG THI 1',
                  style: TextStyle(
                      color: Colors.lightBlue,
                      fontSize: size.width * 0.05,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'BeVietnamPro'),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Padding(
                  padding: EdgeInsets.all(size.width * 0.00),
                  child: SizedBox(
                    height: size.height * 0.9,
                    child: GridView.count(
                      crossAxisCount: 1,
                      childAspectRatio: 5.9,
                      children: const [
                        ContestantList(
                          url: 'lib/images/actor_1.png',
                          name: 'giangnlhph26511@fpt.edu.vn',
                          wpm: '999WPM',
                          accuracy: '100%',
                          score: '9999',
                          rank: '1',
                        ),
                        ContestantList(
                          url: 'lib/images/actor_1.png',
                          name: 'giangnlhph26511@fpt.edu.vn',
                          wpm: '888WPM',
                          accuracy: '100%',
                          score: '8888',
                          rank: '2',
                        ),
                        ContestantList(
                          url: 'lib/images/actor_1.png',
                          name: 'giangnlhph26511@fpt.edu.vn',
                          wpm: '777WPM',
                          accuracy: '100%',
                          score: '7777',
                          rank: '3',
                        ),
                        ContestantList(
                          url: 'lib/images/actor_1.png',
                          name: 'giangnlhph26511@fpt.edu.vn',
                          wpm: '666WPM',
                          accuracy: '100%',
                          score: '6666',
                          rank: '4',
                        ),
                        ContestantList(
                          url: 'lib/images/actor_2.png',
                          name: 'giangnlhph26511@fpt.edu.vn',
                          accuracy: '100%',
                          wpm: '555WPM',
                          score: '5555',
                          rank: '5',
                        ),
                        ContestantList(
                          url: 'lib/images/actor_2.png',
                          name: 'giangnlhph26511@fpt.edu.vn',
                          accuracy: '100%',
                          wpm: '555WPM',
                          score: '5555',
                          rank: '6',
                        ),
                        ContestantList(
                          url: 'lib/images/actor_2.png',
                          name: 'giangnlhph26511@fpt.edu.vn',
                          accuracy: '100%',
                          wpm: '555WPM',
                          score: '5555',
                          rank: '7',
                        ),
                        ContestantList(
                          url: 'lib/images/actor_2.png',
                          name: 'giangnlhph26511@fpt.edu.vn',
                          accuracy: '100%',
                          wpm: '555WPM',
                          score: '5555',
                          rank: '8',
                        ),
                        ContestantList(
                          url: 'lib/images/actor_2.png',
                          name: 'giangnlhph26511@fpt.edu.vn',
                          accuracy: '100%',
                          wpm: '555WPM',
                          score: '5555',
                          rank: '9',
                        ),
                        ContestantList(
                          url: 'lib/images/actor_2.png',
                          name: 'giangnlhph26511@fpt.edu.vn',
                          accuracy: '100%',
                          wpm: '555WPM',
                          score: '5555',
                          rank: '10',
                        ),
                      ],
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
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.0,
        vertical: size.height * 0.0,
      ),
      child: Padding(
        padding: EdgeInsets.all(size.width * 0.01),
        child: Container(
          decoration: BoxDecoration(
            color: isDarkMode
                ? const Color.fromARGB(255, 58, 69, 75)
                : const Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2), // Màu của đổ bóng
                spreadRadius: 0.5, // Kích thước đổ bóng
                blurRadius: 1, // Độ mờ của đổ bóng
                offset: const Offset(0, 1), // Vị trí của đổ bóng
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.00, vertical: size.height * 0.01),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(width: size.width * 0.05), // Adjust spacing

                    if (rank != '1' && rank != '2' && rank != '3')
                      const FaIcon(
                        FontAwesomeIcons.hashtag,
                        color: Colors.lightGreen,
                      ),
                    if (rank == '1')
                      const FaIcon(
                        FontAwesomeIcons.trophy,
                        color: Colors.yellow,
                      ),
                    if (rank == '2')
                      const FaIcon(
                        FontAwesomeIcons.medal,
                        color: Colors.grey,
                      ),
                    if (rank == '3')
                      const FaIcon(
                        FontAwesomeIcons.medal,
                        color: Colors.orange,
                      ),
                    SizedBox(width: size.width * 0.01), // Adjust spacing
                    Text(
                      rank ?? '6',
                      style: TextStyle(
                        color: rank == '1'
                            ? Colors.yellow
                            : rank == '2'
                                ? Colors.grey
                                : rank == '3'
                                    ? Colors.orange
                                    : Colors.lightGreen,
                      ),
                    ),
                    SizedBox(width: size.width * 0.02), // Adjust spacing
                    // Khoảng cách giữa rank và url
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
                SizedBox(width: size.width * 0.01), // Adjust spacing
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      name ?? 'giangnlhph26511@fpt.edu.vn',
                      style: TextStyle(
                        color: isDarkMode ? Colors.white : Colors.black,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: size.width * 0.01), // Adjust spacing
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Text(
                        accuracy ?? '100%',
                        style: TextStyle(
                          color: rank == '1'
                              ? const Color.fromRGBO(255, 215, 0, 1)
                              : rank == '2'
                                  ? Colors.grey
                                  : rank == '3'
                                      ? Colors.orange
                                      : Colors.green,
                          fontSize: size.height * 0.015,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(height: size.height * 0.005), // Adjust spacing
                    Expanded(
                      child: Text(
                        wpm ?? '999WPM',
                        style: TextStyle(
                          color: rank == '1'
                              ? const Color.fromRGBO(255, 215, 0, 1)
                              : rank == '2'
                                  ? Colors.grey
                                  : rank == '3'
                                      ? Colors.orange
                                      : Colors.green,
                          fontSize: size.height * 0.015,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(height: size.height * 0.005), // Adjust spacing
                    Expanded(
                      child: Text(
                        score ?? '9999',
                        style: TextStyle(
                          color: rank == '1'
                              ? const Color.fromRGBO(255, 215, 0, 1)
                              : rank == '2'
                                  ? Colors.grey
                                  : rank == '3'
                                      ? Colors.orange
                                      : Colors.green,
                          fontSize: size.height * 0.015,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: size.width * 0.05), // Adjust spacing
              ],
            ),
          ),
        ),
      ),
    );
  }
}
