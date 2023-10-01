import 'package:flutter/material.dart';
import 'package:typing_contest_mobile/component/typing/typing.dart';
import '../../models/User.dart';
import '../../net_working/api_request.dart';
import 'data_of_round.dart';

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
    Size size = MediaQuery.of(context).size;
    EdgeInsetsGeometry padding = EdgeInsets.all(size.width * 0.05);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/images/background.png'),
                fit: BoxFit.cover,
              ),
            ),
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            top: size.height *0.02,
            left: size.width *0.01,
            child: IconButton(
              icon: const Icon(
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
                  ContestDataDisplay(futureUser: futureUser),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 10,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          right: 0,
                          height: MediaQuery.of(context).size.height / 9,
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.black87,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40.0),
                                topRight: Radius.circular(40.0),
                              ),
                            ),

                            child: Center(
                              child: Padding(
                                padding: padding,
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
                                    padding: EdgeInsets.symmetric(
                                      vertical: size.height * 0.01,
                                      horizontal: size.width * 0.3,
                                    ),
                                  ),
                                  child:  Text(
                                    'Tham gia',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: size.width *0.045,
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
