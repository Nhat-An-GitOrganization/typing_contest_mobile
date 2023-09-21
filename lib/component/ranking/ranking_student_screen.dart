import 'package:flutter/material.dart';

const Color primaryColor = Colors.blue; // Màu xanh chính
const Color secondaryColor = Colors.white; // Màu trắng

class RankingStudentScreen extends StatelessWidget {
  const RankingStudentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.lightBlue,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: secondaryColor,
                    ),
                    onPressed: () {
                      // Xử lý khi nút "Quay lại bài thi" được nhấn
                      // Thêm xử lý tại đây để điều hướng quay lại bài thi
                    },
                  ),
                  const Text(
                    'Quay lại bài thi',
                    style: TextStyle(
                      fontSize: 16,
                      color: secondaryColor,
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    'Bài thi test 1',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: secondaryColor,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: <Color>[
                          primaryColor.withOpacity(0.7),
                          secondaryColor,
                        ],
                      ),
                    ),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 20.0),
                          child: Icon(
                            Icons.emoji_events_rounded,
                            color: Colors.yellow,
                            size: 70,
                          ),
                        ),
                        const SizedBox(
                            height:
                                10), // Khoảng cách giữa biểu tượng và đoạn văn bản
                        const Text(
                          'Xếp hạng sinh viên',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: secondaryColor,
                          ),
                        ),
                        const SizedBox(
                            height:
                                10), // Khoảng cách giữa đoạn văn bản và các thẻ người chơi
                        _buildContestantCard(
                            1, "Người chơi 1", "Điểm: 95", Colors.yellow),
                        _buildContestantCard(
                            2, "Người chơi 2", "Điểm: 90", Colors.grey),
                        _buildContestantCard(
                            3, "Người chơi 3", "Điểm: 85", Colors.brown),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Điều hướng đến màn hình xếp hạng đầy đủ ở đây
                    },
                    child: Text('Xem Bảng Xếp Hạng'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContestantCard(
      int rank, String name, String score, Color color) {
    return Card(
      margin: const EdgeInsets.all(10.0),
      shadowColor: Colors.grey[200],
      color: color,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              rank.toString(),
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
            Text(
              score,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
