import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:typing_contest_mobile/component/ranking/ranking_round_screen.dart';

import '../../models/User.dart';
import '../../net_working/api_request.dart';

class ResultContest extends StatefulWidget {
  final int userId;
  const ResultContest({super.key, required this.userId});

  @override
  // ignore: library_private_types_in_public_api
  _UserDetailPageState createState() => _UserDetailPageState();
}

class _UserDetailPageState extends State<ResultContest> {
  late Future<User> futureUser;
  final dataMap = <String, double>{
    "Mức độ chính xác": 4,
    "Phần còn lại": 16,
  };

  final colorList = <Color>[
    Colors.greenAccent,
    Colors.blue,
  ];
  @override
  void initState() {
    super.initState();
    futureUser = ApiServices.fetchDetail(widget.userId);
  }

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
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    child: PieChart(
                      dataMap: {
                        "Mức độ chính xác": double.parse(user!.id.toString()),
                        "Phần còn lại": 20 - double.parse(user.id.toString()),
                      },
                      chartType: ChartType.ring,
                      baseChartColor: Colors.grey[50]!.withOpacity(0.15),
                      colorList: colorList,
                      chartValuesOptions: const ChartValuesOptions(
                        showChartValuesInPercentage: true,
                      ),
                      totalValue: 20,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 20.0,
                    alignment: Alignment.center,
                    child:
                        null, // Bạn có thể thêm các widget lớp phủ ở đây nếu cần.
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          user.title ?? '',
                          style: const TextStyle(
                            fontSize: 24.0,
                            color: Colors.lightBlueAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          user.body ?? '',
                          style: const TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        const Text(
                          'Thông tin chi tiết:',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.lightBlueAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          user.body ?? '',
                          style: const TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        const Text(
                          'Thông tin chi tiết:',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.lightBlueAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          user.body ?? '',
                          style: const TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            // Xử lý sự kiện khi nút được nhấn (nếu cần)
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (_) => RankingRoundScreen()));
          },
          child: const Text('Go to ranking'),
        ),
      ),
    );
  }
}
