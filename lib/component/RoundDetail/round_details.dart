import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import '../../models/round.dart';
import '../typing/typing.dart';


Future<RoundContest> fetchData(String id) async{
  try{

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
      throw Exception('Error: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error: $e');
  }
}


class DetailRound extends StatefulWidget {
  final String id;
  const DetailRound({super.key, required this.id});

  @override
  // ignore: library_private_types_in_public_api
  _DetailRoundState createState() => _DetailRoundState();
}

class _DetailRoundState extends State<DetailRound> {
  late Future<RoundContest> futureRound;

  @override
  void initState() {
    super.initState();
    futureRound = fetchData(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<RoundContest>(
        future: futureRound,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData) {
            return const Center(child: Text("No data available"));
          } else {
            final round = snapshot.data!;
            return buildRoundUI(round);
          }
        },
      ),
    );
  }

  Widget buildRoundUI(RoundContest round) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height*2 / 5,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(round.imageUrl??""),
              fit: BoxFit.cover,
            ),
            border: Border.all(
              color: Colors.white,
              width: 0,
              style: BorderStyle.solid,
            ),
            borderRadius:const BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(1.0, 1.0),
                blurRadius: 1.0,
                spreadRadius: 1.0,
              ),
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 0.0),
                blurRadius: 0.0,
                spreadRadius: 0.0,
              ),
            ],
          ),
        ),
        Positioned(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(size.height * 0.36,size.height * 0.36,0,0),
                  alignment: Alignment.center,
                  child: FloatingActionButton(
                    child: Icon(Icons.send),
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TypingSpeedTestGame(),
                        ),
                      );
                    },
                  ),
                ),
                Expanded (

                  child: SingleChildScrollView(
                    child: Column(

                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: size.height * 0.05),
                          child: Text(
                            "Ngày bắt đầu  :  Ngày kết thúc",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: size.height * 0.025,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(size.height * 0.07,size.height * 0.01,size.height * 0.01,size.height * 0.01),
                          child: Row(
                            children: [
                              Text(
                                round.startTime?.substring(0, 10) ?? '',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: size.height * 0.018,
                                ),
                              ),
                              SizedBox(width: size.width*0.16),
                              Text(
                                round.endTime?.substring(0, 10) ?? '',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize:size.height*0.018,
                                ),
                              ),
                            ],
                          ),


                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(size.height * 0.07,size.height * 0.01,size.height * 0.01,size.height * 0.01),

                          child: Wrap(
                            alignment: WrapAlignment.start,
                            children: [
                              Flexible(
                                child: Text(
                                  round.name??'',
                                  style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontSize:size.height*0.06,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(size.height * 0.07,size.height * 0.01,size.height * 0.01,size.height * 0.01),
                          child: Wrap(
                            alignment: WrapAlignment.start,
                            children: [
                              Flexible(
                                child: Text(
                                  round.description??'',
                                  style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontSize:size.height*0.025,
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
            )),
      ],
    );
  }
}
