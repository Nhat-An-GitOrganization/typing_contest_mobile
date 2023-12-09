import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:typing_contest_mobile/component/RoundDetail/image_round_detail.dart';
import 'package:typing_contest_mobile/component/RoundDetail/typing_button_widget.dart';
import 'package:typing_contest_mobile/models/contest.dart';
import '../../models/round.dart';

// Future<RoundContest> fetchData(String id) async {
//   try {
//     var url = Uri.parse("https://66.42.55.38:4001/api/Rounds/$id");
//     var httpClient = HttpClient();
//     httpClient.badCertificateCallback =
//         (X509Certificate cert, String host, int port) => true;
//     var request = await httpClient.getUrl(url);
//     var response = await request.close();
//     if (response.statusCode == HttpStatus.ok) {
//       var jsonData = await response.transform(utf8.decoder).join();
//       var decodedData = jsonDecode(jsonData);
//       if (decodedData is Map<String, dynamic>) {
//         final Map<String, dynamic> data = json.decode(jsonData);
//         return RoundContest.fromJson(data);
//       } else {
//         throw Exception('Error: Invalid data format1');
//       }
//     } else {
//       throw Exception('Error: ${response.statusCode}');
//     }
//   } catch (e) {
//     throw Exception('Error: $e');
//   }
// }

Future<RoundContest> fetchMockData(String id) async {
  await Future.delayed(const Duration(
      seconds: 2)); // Simulating a delay as if fetching from an API

  Map<String, dynamic> mockData = {
    'id': '123',
    'idContest': '456',
    'name': 'Mock Round',
    'nameContest': 'Mock Contest',
    'description':
        'This is a mock description This is a mock description This is a mock description This is a mock description This is a mock description This is a mock description  ',
    'imageUrl':
        'https://www.google.com/url?sa=i&url=https%3A%2F%2Fnhatrangclub.vn%2Fthreads%2Fhinh-nen-anh-dep-thien-nhien.1045190%2F&psig=AOvVaw2YfnVBFZGx_iKoC5C6qpT4&ust=1699778754900000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCMCN58XHu4IDFQAAAAAdAAAAABAE',
    'timeLimit': 60,
    'maxAccess': 100,
    'availability': 50,
    'isDisableBackspace': false,
    'isHavingSpecialChar': false,
    'totalTime': '2 hours',
    'startTime': '2023-11-11 09:00:00',
    'startTimeContest': '2023-11-10 10:00:00',
    'endTime': '2023-11-11 11:00:00',
    'endTimeContest': '2023-11-12 12:00:00',
    'createdDate': '2023-11-10 08:00:00',
    'createdBy': 'Admin',
    'modifiedDate': '2023-11-10 12:00:00',
    'modifiedBy': 'Editor',
    'deletedDate': '2023-11-12 15:00:00',
    'deletedBy': 'Supervisor',
    'status': 1,
    'isFinal': true,
  };

  RoundContest mockRound = RoundContest.fromJson(mockData);

  return mockRound;
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
        future: fetchMockData(id),
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
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Stack(
      children: [
        const MyImageContainer(
          imageUrl: 'lib/images/background.png',
        ),
        Positioned(
            child: Column(
          children: [
            // OragCards(
            //   ct: ct,
            // ),
            Container(
              margin: EdgeInsets.fromLTRB(
                0,
                size.height * 0.4,
                0,
                0,
              ),
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
                          size.height * 0),
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
                          size.height * 0,
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
                          size.height * 0.005,
                          size.height * 0.01,
                          size.height * 0.01),
                      child: Row(
                        children: [
                          Text(
                            'Chi tiết',
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
                      padding: EdgeInsets.only(top: size.height * 0.01),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: round.isHavingSpecialChar == false
                                    ? Container(
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.fromLTRB(
                                            size.width * 0.06,
                                            0,
                                            size.width * 0.06,
                                            size.width * 0.03),
                                        padding: EdgeInsets.fromLTRB(
                                          size.height * 0,
                                          size.height * 0.015,
                                          size.height * 0,
                                          size.height * 0.015,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.grey.withOpacity(0.7),
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "Khoảng trắng",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: size.height * 0.02,
                                            ),
                                          ),
                                        ),
                                      )
                                    : const SizedBox.shrink(),
                              ),
                              Expanded(
                                child: round.isHavingSpecialChar == false
                                    ? Container(
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.fromLTRB(
                                            size.width * 0.06,
                                            0,
                                            size.width * 0.06,
                                            size.width * 0.03),
                                        padding: EdgeInsets.fromLTRB(
                                          size.height * 0,
                                          size.height * 0.015,
                                          size.height * 0,
                                          size.height * 0.015,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.grey.withOpacity(0.7),
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "Ký tự đặc biệt",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: size.height * 0.02,
                                            ),
                                          ),
                                        ),
                                      )
                                    : const SizedBox.shrink(),
                              ),
                            ],
                          ),
                          SizedBox(height: size.height * 0.03),
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
                                    color: isDarkMode
                                        ? Colors.white
                                        : Colors.black,
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
                                    color: isDarkMode
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: size.height * 0.025,
                                  ),
                                ),
                              )),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: Container(
                                padding:
                                    EdgeInsets.only(left: size.height * 0.06),
                                child: Text(
                                  round.totalTime ?? '',
                                  style: TextStyle(
                                    color:
                                        const Color.fromARGB(255, 89, 91, 118),
                                    fontSize: size.height * 0.022,
                                  ),
                                ),
                              )),
                              Expanded(
                                  child: Container(
                                padding:
                                    EdgeInsets.only(left: size.height * 0.1),
                                child: Text(
                                  round.maxAccess.toString(),
                                  style: TextStyle(
                                    color:
                                        const Color.fromARGB(255, 89, 91, 118),
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
                                    size.height * 0.05,
                                    size.height * 0.03,
                                    size.height * 0,
                                    size.height * 0),
                                child: Text(
                                  "Trạng thái",
                                  style: TextStyle(
                                    color: isDarkMode
                                        ? Colors.white
                                        : Colors.black,
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
                                  "Khả dụng",
                                  style: TextStyle(
                                    color: isDarkMode
                                        ? Colors.white
                                        : Colors.black,
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
                                  child: Container(
                                padding: EdgeInsets.fromLTRB(
                                    size.height * 0.05,
                                    size.height * 0,
                                    size.height * 0,
                                    size.height * 0.04),
                                child: Text(
                                  round.status == 0
                                      ? 'Đang diễn ra'
                                      : ("Không hoạt động"),
                                  style: TextStyle(
                                    color:
                                        const Color.fromARGB(255, 89, 91, 118),
                                    fontSize: size.height * 0.022,
                                  ),
                                ),
                              )),
                              Expanded(
                                  child: Container(
                                padding: EdgeInsets.fromLTRB(
                                    size.height * 0.1,
                                    size.height * 0,
                                    size.height * 0,
                                    size.height * 0.04),
                                child: Text(
                                  round.availability.toString(),
                                  style: TextStyle(
                                    color:
                                        const Color.fromARGB(255, 89, 91, 118),
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
