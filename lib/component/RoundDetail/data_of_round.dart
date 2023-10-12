import 'package:flutter/material.dart';
import '../../models/round.dart';

class ContestDataDisplay extends StatelessWidget {
  final Future<RoundContest> futureRound;
  const ContestDataDisplay({Key?key,required this.futureRound}): super(key:key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder<RoundContest>(
      future: futureRound,
      builder: (context, snapshot) {

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Lỗi: ${snapshot.error}'));
        } else {
          final round = snapshot.data;
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
                          'Vong thi ${round?.nameContest ?? ''}',
                          style: TextStyle(
                            fontSize:  size.width *0.05,
                            color: Colors.lightBlueAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: size.height*0.01),
                        Text(
                          round?.name ?? '',
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
                          round?.description ?? '',
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
                          round?.startTime ??'',
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
                          round?.endTime ?? '',
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
      },
    );
  }
}
