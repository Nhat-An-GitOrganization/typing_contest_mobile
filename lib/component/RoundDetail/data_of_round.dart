import 'package:flutter/material.dart';

import '../../models/User.dart';

class ContestDataDisplay extends StatelessWidget {
  final Future<User> futureUser;
  const ContestDataDisplay({Key?key,required this.futureUser}): super(key:key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder<User>(
      future: futureUser,
      builder: (context, snapshot) {

        // if (snapshot.connectionState == ConnectionState.waiting) {
        //   return const Center(child: CircularProgressIndicator());
        // } else if (snapshot.hasError) {
        //   return Center(child: Text('Lỗi: ${snapshot.error}'));
        // } else {
        //   final user = snapshot.data;
          return  Expanded(
            child: SingleChildScrollView(
              physics:const ClampingScrollPhysics(),

              clipBehavior: Clip.hardEdge,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(size.height * 0.05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                       Text(
                          "TypingContest 1",
                          style: TextStyle(
                            fontSize:  size.width *0.05,
                            color: Colors.lightBlueAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: size.height*0.01),
                         Text(
                          "Tốc độ đánh máy của bạn có nhanh không? "
                              "Làm bài kiểm tra đánh máy của chúng tôi và "
                              "kiểm tra tốc độ đánh máy hiện tại của bạn.",
                          style: TextStyle(
                            fontSize:  size.width *0.045,
                          ),
                        ),
                        SizedBox(height: size.height*0.02),
                         Text(
                          'Miêu tả:',
                          style: TextStyle(
                            fontSize:  size.width *0.05,
                            color: Colors.lightBlueAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: size.height*0.01),
                         Text(
                          "Cuộc thi đánh máy poly",
                          style: TextStyle(
                            fontSize:  size.width *0.05,
                          ),
                        ),
                        SizedBox(height: size.height*0.02),
                         Text(
                          'Thời gian bắt đầu:',
                          style: TextStyle(
                            fontSize:  size.width *0.05,
                            color: Colors.lightBlueAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: size.height*0.01),
                         Text(
                          "30/9/2023",
                          style: TextStyle(
                            fontSize: size.width *0.045,
                          ),
                        ),
                        SizedBox(height: size.height*0.02),
                         Text(
                          'Thời gian kết thúc:',
                          style: TextStyle(
                            fontSize: size.width *0.05,
                            color: Colors.lightBlueAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: size.height*0.01),
                         Text(
                          "30/10/2023",
                          style: TextStyle(
                            fontSize: size.width *0.045,
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
