import 'package:flutter/material.dart';

import '../../models/User.dart';

class ContestDataDisplay extends StatelessWidget {
  final Future<User> futureUser;
  const ContestDataDisplay({Key?key,required this.futureUser}): super(key:key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<User>(
      future: futureUser,
      builder: (context, snapshot) {
        // if (snapshot.connectionState == ConnectionState.waiting) {
        //   return const Center(child: CircularProgressIndicator());
        // } else if (snapshot.hasError) {
        //   return Center(child: Text('Lỗi: ${snapshot.error}'));
        // } else {
        //   final user = snapshot.data;
          return const Expanded(
            child: SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              padding: EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 0.0),
              clipBehavior: Clip.hardEdge,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                       Text(
                          "TypingContest 1",
                          style: TextStyle(
                            fontSize: 24.0,
                            color: Colors.lightBlueAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8.0),
                      Text(
                          "Tốc độ đánh máy của bạn có nhanh không? "
                              "Làm bài kiểm tra đánh máy của chúng tôi và "
                              "kiểm tra tốc độ đánh máy hiện tại của bạn.",
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(height: 16.0),
                        Text(
                          'Miêu tả:',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.lightBlueAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8.0),
                       Text(
                          "Cuộc thi đánh máy poly",
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(height: 16.0),
                        Text(
                          'Thời gian bắt đầu:',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.lightBlueAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          "30/9/2023",
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(height: 16.0),
                        Text(
                          'Thời gian kết thúc:',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.lightBlueAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          "30/10/2023",
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
    //  },
    );
  }
}
