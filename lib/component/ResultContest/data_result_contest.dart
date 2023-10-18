import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

import 'circle_widget.dart';


class DetailRoundResult extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final user;

  const DetailRoundResult(this.user, {super.key});

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
          padding: EdgeInsets.fromLTRB(size.height*0.1,size.height*0.01,size.height*0.01,size.height*0.01),
           child: SizedBox(
             width: size.width*0.6,
             height: size.height*0.36,
             child: CircleWidget(
             color1: Colors.blue,
             color2: const Color(0x97AFD9F6),
             endPercentage: 40,
              ),
        ),),
         Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width*0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: size.width*0.2),
                child: Text(
                  "Phạm Việt Hoàng",
                  style: TextStyle(
                      fontSize: size.width *0.06,
                      color: Colors.black
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(size.width*0.03,size.height*0.02,0,0),
                child: Text(
                  "Windows Server configured with the Web Server (IIS) server role."
                      "",
                  style: TextStyle(
                      fontSize: size.width *0.06,
                      color: Colors.grey
                  ),
                ),
              ),
              SizedBox(height: size.height*0.05),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: size.width*0.15),
                    child: Text(
                      "40%",
                      style: TextStyle(
                          fontSize: size.width *0.045,
                          color: Colors.black
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: size.width*0.45),
                    child: Text(
                      "35",
                      style: TextStyle(
                          fontSize: size.width *0.045,
                          color: Colors.black
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Độ chính xác',
                    style: TextStyle(
                      fontSize: size.width *0.06,
                      color: Colors.grey,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: size.width*0.28),
                    child: Text(
                      'WPM',
                      style: TextStyle(
                        fontSize: size.width *0.06,
                        color: Colors.grey,

                      ),
                    ),
                  ),
                ],
              ),


              SizedBox(height: size.height*0.01),


            ],
          ),
        ),
      ],
    );
  }
}
