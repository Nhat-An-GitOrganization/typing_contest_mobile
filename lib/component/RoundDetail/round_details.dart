import 'package:flutter/material.dart';
import 'package:typing_contest_mobile/component/typing/typing.dart';

import '../../models/User.dart';
import '../../net_working/api_request.dart';

import 'package:flutter/material.dart';

class DetailRound extends StatefulWidget {
  final int userId;

  const DetailRound({super.key, required this.userId});

  @override
  // ignore: library_private_types_in_public_api
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
      body: Stack(
        children: [
          Container(
            decoration:const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/images/background.png'),
                fit: BoxFit.cover,
              ),
            ),
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            top: 20.0,
            left: 5.0,
            child: IconButton(
              icon:const Icon(
                Icons.arrow_back,
                color: Colors.blueAccent,
                size: 30.0,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(

              height: MediaQuery.of(context).size.height * 3 / 5,
              decoration: const BoxDecoration(
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
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Lỗi: ${snapshot.error}'));
                      } else {
                        final user = snapshot.data;
                        return Expanded(
                          child: SingleChildScrollView(
                            physics: const ClampingScrollPhysics(),
                            padding: const EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 0.0),
                            clipBehavior: Clip.hardEdge,
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
                                        style: const TextStyle(
                                          fontSize: 24.0,
                                          color: Colors.lightBlueAccent,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 8.0),
                                      Text(
                                        user?.body ?? '',
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
                                        user?.body ?? '',
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
                                        user?.body ?? '',
                                        style: const TextStyle(
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
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 7,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          right: 0,
                          height: MediaQuery.of(context).size.height / 6,
                          child: Container(
                            decoration:const BoxDecoration(
                              color: Colors.black87,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40.0),
                                topRight: Radius.circular(40.0),
                              ),
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                        const TypingSpeedTestGame(),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 20.0,
                                      horizontal: 130.0,
                                    ),
                                  ),
                                  child: const Text(
                                    'Tham gia',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
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

