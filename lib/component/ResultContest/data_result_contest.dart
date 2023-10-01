import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';


class DetailRoundResult extends StatelessWidget {
  final user;

  const DetailRoundResult(this.user);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final colorList = <Color>[
      Colors.greenAccent,
      Colors.blue,
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[

        SizedBox(height:size.height * 0.03),
        Container(
          padding: EdgeInsets.all(size.height*0.01),
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
         Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width*0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Kết quả",
                style: TextStyle(
                  fontSize: size.width *0.06,
                  color: Colors.lightBlueAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: size.height*0.01),
              Text(
                "Kết quả cuộc thi Typing Contest 1. "
                    "Chúc mừng bạn đã hoàn thành cuộc thi",

                style: TextStyle(
                  fontSize: size.width *0.045,
                ),
              ),
              SizedBox(height: size.height*0.01),
              Text(
                'Người tham gia:',
                style: TextStyle(
                  fontSize: size.width *0.06,
                  color: Colors.lightBlueAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: size.height*0.01),
              Text(
                "Phạm Việt Hoàng",
                style: TextStyle(
                  fontSize: size.width *0.045,
                ),
              ),
              SizedBox(height: size.height*0.01),
              Text(
                'Độ chính xác:',
                style: TextStyle(
                  fontSize: size.width *0.06,
                  color: Colors.lightBlueAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: size.height*0.01),
              Text(
                "100%",
                style: TextStyle(
                  fontSize: size.width *0.045,
                ),
              ),
              SizedBox(height: size.height*0.01),
              Text(
                'Tốc độ (WPM):',
                style: TextStyle(
                  fontSize: size.width *0.06,
                  color: Colors.lightBlueAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: size.height*0.01),
              Text(
                "35",
                style: TextStyle(
                  fontSize: size.width *0.045,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
