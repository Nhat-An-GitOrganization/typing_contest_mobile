import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:typing_contest_mobile/component/RoundDetail/image_round_detail.dart';
import 'package:typing_contest_mobile/component/RoundDetail/orga_card.dart';
import 'package:typing_contest_mobile/component/RoundDetail/typing_button_widget.dart';
import 'package:typing_contest_mobile/models/contest.dart';
import '../../models/round.dart';

Future<RoundContest> fetchData(String id) async {
  try {
    var url = Uri.parse("https://66.42.55.38:4001/api/Rounds/$id");
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

class DetailRound extends StatelessWidget {
  final String id;
  final Contest ct;
  const DetailRound({Key? key, required this.id, required this.ct})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: FutureBuilder<RoundContest>(
        future: fetchData(id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData) {
            return const Center(child: Text("No data available"));
          } else {
            final round = snapshot.data!;
            return buildRoundUI(round, size, context);
          }
        },
      ),
    );
  }

  Widget buildRoundUI(RoundContest round, Size size, BuildContext context) {
    return Stack(
      children: [
        MyImageContainer(
          imageUrl: round.imageUrl ?? '',
        ),
        Positioned(
            child: Column(
          children: [
            OragCards(
              ct: ct,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          size.height * 0.03,
                          size.height * 0.03,
                          size.height * 0.01,
                          size.height * 0.01),
                      child: Row(
                        children: [
                          Text(
                            round.name ?? '',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          TypingButtonWidget(size),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          size.height * 0.03,
                          size.height * 0.01,
                          size.height * 0.01,
                          size.height * 0.01),
                      child: Row(
                        children: [
                          Text(
                            DateFormat('dd-MM-yyyy')
                                .format(DateTime.parse(round.startTime ?? '')),
                            style: TextStyle(
                              color: const Color.fromARGB(255, 89, 91, 118),
                              fontSize: size.width * 0.045,
                            ),
                          ),
                          SizedBox(width: size.width * 0.02),
                          Text(
                            DateFormat('dd-MM-yyyy')
                                .format(DateTime.parse(round.endTime ?? '')),
                            style: TextStyle(
                              color: const Color.fromARGB(255, 89, 91, 118),
                              fontSize: size.width * 0.045,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          size.height * 0.03,
                          size.height * 0.01,
                          size.height * 0.01,
                          size.height * 0.01),
                      child: Row(
                        children: [
                          Text(
                            'Details',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          SizedBox(width: size.width * 0.02),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          size.height * 0.03,
                          size.height * 0.01,
                          size.height * 0.01,
                          size.height * 0.01),
                      child: Text(
                        round.description ?? "",
                        style: TextStyle(
                            color: const Color.fromARGB(255, 89, 91, 118),
                            fontSize: size.height * (16 / size.height)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(size.height * 0,
                          size.height * 0.04, size.height * 0, size.height * 0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                  child: Container(
                                padding: EdgeInsets.fromLTRB(
                                    size.height * 0.05,
                                    size.height * 0,
                                    size.height * 0,
                                    size.height * 0),
                                child: Text(
                                  "Thời gian",
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: size.height * 0.025,
                                  ),
                                ),
                              )),
                              Expanded(
                                  child: Container(
                                padding: EdgeInsets.fromLTRB(
                                    size.height * 0.03,
                                    size.height * 0,
                                    size.height * 0,
                                    size.height * 0),
                                child: Text(
                                  "Số lần truy cập",
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: size.height * 0.025,
                                  ),
                                ),
                              )),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        left: size.height * 0.06),
                                    child: Text(
                                      round.totalTime ?? '',
                                      style: TextStyle(
                                        color: const Color.fromARGB(
                                            255, 89, 91, 118),
                                        fontSize: size.height * 0.022,
                                      ),
                                    ),
                                  )),
                              Expanded(
                                  flex: 2,
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        left: size.height * 0.1),
                                    child: Text(
                                      round.maxAccess.toString(),
                                      style: TextStyle(
                                        color: const Color.fromARGB(
                                            255, 89, 91, 118),
                                        fontSize: size.height * 0.022,
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: Container(
                                padding: EdgeInsets.fromLTRB(
                                    size.height * 0.052,
                                    size.height * 0.03,
                                    size.height * 0,
                                    size.height * 0),
                                child: round.isDisableBackspace == true
                                    ? Text(
                                        "Khoảng trắng",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: size.height * 0.025,
                                        ),
                                      )
                                    : const SizedBox(),
                              )),
                              Expanded(
                                  child: Container(
                                padding: EdgeInsets.fromLTRB(
                                    size.height * 0.052,
                                    size.height * 0.03,
                                    size.height * 0,
                                    size.height * 0),
                                child: round.isHavingSpecialChar == true
                                    ? Text(
                                        "Ký tự đặc biệt",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: size.height * 0.025,
                                        ),
                                      )
                                    : const SizedBox(),
                              )),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: Container(
                                padding: EdgeInsets.fromLTRB(
                                    size.height * 0.05,
                                    size.height * 0.03,
                                    size.height * 0,
                                    size.height * 0),
                                child: Text(
                                  "Trạng thái",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: size.height * 0.025,
                                  ),
                                ),
                              )),
                              Expanded(
                                  child: Container(
                                padding: EdgeInsets.fromLTRB(
                                    size.height * 0.05,
                                    size.height * 0.03,
                                    size.height * 0,
                                    size.height * 0),
                                child: Text(
                                  "availability",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: size.height * 0.025,
                                  ),
                                ),
                              )),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(
                                        size.height * 0.05,
                                        0,
                                        0,
                                        size.height * 0.1),
                                    child: Text(
                                      round.status == 0
                                          ? 'Đang diễn ra'
                                          : ("No"),
                                      style: TextStyle(
                                        color: const Color.fromARGB(
                                            255, 89, 91, 118),
                                        fontSize: size.height * 0.022,
                                      ),
                                    ),
                                  )),
                              Expanded(
                                  flex: 2,
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(
                                        size.height * 0.1,
                                        0,
                                        0,
                                        size.height * 0.1),
                                    child: Text(
                                      round.availability.toString(),
                                      style: TextStyle(
                                        color: const Color.fromARGB(
                                            255, 89, 91, 118),
                                        fontSize: size.height * 0.022,
                                      ),
                                    ),
                                  )),
                            ],
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
