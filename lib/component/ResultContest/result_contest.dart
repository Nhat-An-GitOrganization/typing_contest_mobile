import 'package:flutter/material.dart';
import 'package:typing_contest_mobile/component/ranking/ranking_round_screen.dart';
import 'package:typing_contest_mobile/models/round.dart';
import 'data_result_contest.dart';

Future<RoundContest> fetchData() async {
  // Tạo một đối tượng User với dữ liệu cố định
  RoundContest user = RoundContest(

    id: '1',

  );

  // Đợi một khoảng thời gian như làm tác vụ mạng thường làm
  await Future.delayed(const Duration(seconds: 2));

  // Trả về đối tượng User đã được tạo và giữ cố định dữ liệu
  return user;
}

class ResultContest extends StatefulWidget {
  final int userId;
  const ResultContest({super.key, required this.userId});

  @override
  // ignore: library_private_types_in_public_api
  _ResultContestPageState createState() => _ResultContestPageState();
}

class _ResultContestPageState extends State<ResultContest> {
  late Future<RoundContest> futureUser = fetchData();

  final colorList = <Color>[
    Colors.greenAccent,
    Colors.blue,
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kết quả vòng thi của bạn '),
        automaticallyImplyLeading: false,
      ),
      body: FutureBuilder<RoundContest>(
        future: futureUser,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Lỗi: ${snapshot.error}'));
          } else {
            final user = snapshot.data;
            return SingleChildScrollView(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                DetailRoundResult(
                    user), // Call MyWidget here with the user data
              ],
            ));
          }
        },
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(
            horizontal: size.height * 0.05, vertical: size.height * 0.02),
        decoration: const BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.0),
            topRight: Radius.circular(40.0),
          ),
        ),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (_) => const RankingRoundScreen()));
          },
          child: const Text('Go to ranking'),
        ),
      ),
    );
  }
}
