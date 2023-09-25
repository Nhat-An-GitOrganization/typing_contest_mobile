import 'package:flutter/material.dart';
import 'package:typing_contest_mobile/component/typing/typing.dart';

import '../../models/User.dart';
import '../../net_working/api_request.dart';

class DetailRound extends StatefulWidget {
  final int userId;

  DetailRound({required this.userId});

  @override
  _DetailRoundState createState() => _DetailRoundState();
}

class _DetailRoundState extends State<DetailRound> {
  late Future<User> futureUser;

  @override
  void initState() {
    super.initState();
    futureUser = ApiServices.fetchDetail(widget.userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chi Tiết Cuộc Thi'),
      ),
      body: Stack(
        children: [
          Image.asset(
            'assets/s1.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 3 / 5,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(60.0),
                ),
              ),
              child: Column(
                children: <Widget>[
                  FutureBuilder<User>(
                    future: futureUser,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Lỗi: ${snapshot.error}'));
                      } else {
                        final user = snapshot.data;
                        return Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[

                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        user?.title ?? '',
                                        style: TextStyle(
                                          fontSize: 24.0,
                                          color: Colors.lightBlueAccent,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 8.0),
                                      Text(
                                        user?.body ?? '',
                                        style: TextStyle(
                                          fontSize: 16.0,
                                        ),
                                      ),
                                      SizedBox(height: 16.0),
                                      Text(
                                        'Thông tin chi tiết:',
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          color: Colors.lightBlueAccent,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 8.0),
                                      Text(
                                        user?.body ?? '',
                                        style: TextStyle(
                                          fontSize: 16.0,
                                        ),
                                      ),
                                      SizedBox(height: 16.0),
                                      Text(
                                        'Thông tin chi tiết:',
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          color: Colors.lightBlueAccent,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 8.0),
                                      Text(
                                        user?.body ?? '',
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
                    },
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 5,
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: 10,
                          left: 0,
                          right: 0,
                          height: MediaQuery.of(context).size.height / 5,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black87,
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const TypingSpeedTestGame(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'Tham gia',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.blue,
                                    padding: EdgeInsets.symmetric(
                                      vertical: 20.0,
                                      horizontal: 130.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
