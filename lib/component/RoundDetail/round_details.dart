import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:typing_contest_mobile/component/typing/typing.dart';

import '../../models/round.dart';
import 'data_of_round.dart';


Future<RoundContest> fetchData(String id) async{
  // int currentPage = 1;
  // int pageSize = 10;
  // List<int> pageSizeOptions = [5, 10, 20];
  try{
    // var url = Uri.parse(
    // 'https://66.42.55.38:1001/api/Students/GetAllAsync?PageNumber=$currentPage&PageSize=$pageSize');
    var url =  Uri.parse("https://66.42.55.38:4001/api/Rounds/$id");
    var httpClient = HttpClient();
    httpClient.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    var request = await httpClient.getUrl(url);
    var response = await request.close();
    if (response.statusCode == HttpStatus.ok) {
      var jsonData = await response.transform(utf8.decoder).join();
      var decodedData = jsonDecode(jsonData);
      if (decodedData is Map<String, dynamic>) {
        final Map<String, dynamic> data = json.decode(jsonData);
        return RoundContest.fromJson(data);
      } else {
        throw Exception('Error: Invalid data format1');
      }
    } else {
      throw Exception('Error2: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error3: $e');
  }
}


class DetailRound extends StatefulWidget {
  final String Id;

  const DetailRound({super.key, required this.Id});

  @override
  // ignore: library_private_types_in_public_api
  _DetailRoundState createState() => _DetailRoundState();
}

class _DetailRoundState extends State<DetailRound> {
  late Future<RoundContest> futureRound;
  @override
  void initState() {
    super.initState();
    futureRound = fetchData(widget.Id);

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
                  ContestDataDisplay(futureRound: futureRound),
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
