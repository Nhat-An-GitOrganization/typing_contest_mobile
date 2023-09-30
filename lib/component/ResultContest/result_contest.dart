import 'package:flutter/material.dart';
import 'package:typing_contest_mobile/component/ranking/ranking_round_screen.dart';
import '../../models/User.dart';
import 'data_result_contest.dart';

class ResultContest extends StatefulWidget {
  final int userId;
  const ResultContest({super.key, required this.userId});

  @override
  // ignore: library_private_types_in_public_api
  _ResultContestPageState createState() => _ResultContestPageState();
}

class _ResultContestPageState extends State<ResultContest> {
  late Future<User> futureUser;

  final colorList = <Color>[
    Colors.greenAccent,
    Colors.blue,
  ];

  @override
  Widget build(BuildContext context) {
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
                    DetailRoundResult(user), // Call MyWidget here with the user data
                  ],
                )
            );
          }
        },
      ),
      bottomNavigationBar: Container(

        padding:const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        decoration:const BoxDecoration(
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
