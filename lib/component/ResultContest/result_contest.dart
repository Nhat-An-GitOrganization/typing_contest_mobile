import 'package:flutter/material.dart';
import 'package:typing_contest_mobile/component/ranking/ranking_round_screen.dart';
import '../../models/User.dart';
import 'data_result_contest.dart';

Future<User> fetchData() async {
  // Tạo một đối tượng User với dữ liệu cố định
  User user = User(
    userId: 1,
    id: 1,
    title: "cuoc thi",
    body:
        "Thời gian thành lập và đi vào hoạt động chưa nhiều, mới được một năm,"
        " nhưng nhiều Ban Chỉ đạo cấp tỉnh về phòng, chống tham nhũng, tiêu cực đã nỗ lực lớn, "
        "quyết tâm cao, có những kinh nghiệm quý, cách làm hay cần phát huy, nhân rộng;"
        " nhưng cũng có một số nơi hoạt động còn có những khó khăn, vướng mắc cần tháo gỡ",
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
  late Future<User> futureUser = fetchData();

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
      body: FutureBuilder<User>(
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
                MaterialPageRoute(builder: (_) => RankingRoundScreen()));
          },
          child: const Text('Go to ranking'),
        ),
      ),
    );
  }
}
