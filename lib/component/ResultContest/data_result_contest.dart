import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';


class DetailRoundResult extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final user;

  const DetailRoundResult(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    final colorList = <Color>[
      Colors.greenAccent,
      Colors.blue,
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 60.0),
        Container(
          padding: const EdgeInsets.all(10.0),
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
            chartRadius: MediaQuery.of(context).size.width * 10,
          ),
        ),
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height/35,
          alignment: Alignment.center,
          child: null,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Kết quả",
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.lightBlueAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                "Kết quả cuộc thi Typing Contest 1. "
                    "Chúc mừng bạn đã hoàn thành cuộc thi",

                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Người tham gia:',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.lightBlueAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                "Phạm Việt Hoàng",
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Độ chính xác:',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.lightBlueAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                "100%",
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Tốc độ (WPM):',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.lightBlueAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                "35",
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
