import 'package:flutter/material.dart';
import 'package:typing_contest_mobile/component/student_class/student.dart';
import 'package:typing_contest_mobile/models/round.dart';

class ClassDetail extends StatelessWidget {
  const ClassDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: isDarkMode
            ? const Color.fromARGB(255, 58, 69, 75)
            : const Color.fromARGB(255, 255, 255, 255),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: isDarkMode
                  ? const Color.fromARGB(255, 58, 69, 75)
                  : const Color.fromARGB(255, 255, 255, 255),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Chi tiết lớp học',
            style: TextStyle(
              fontSize: size.height * 0.03,
              fontWeight: FontWeight.bold,
              color: isDarkMode
                  ? const Color.fromARGB(255, 58, 69, 75)
                  : const Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(size.height * 0.01),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
                  height: size.height * 0.13, // Chiều cao của banner
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Stack(
                    children: [
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'NET101',
                              style: TextStyle(
                                color: isDarkMode
                                    ? const Color.fromARGB(255, 58, 69, 75)
                                    : const Color.fromARGB(255, 255, 255, 255),
                                fontSize: size.width * 0.05,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Phạm Gia Khánh',
                              style: TextStyle(
                                color: isDarkMode
                                    ? const Color.fromARGB(255, 58, 69, 75)
                                    : const Color.fromARGB(255, 255, 255, 255),
                                fontSize: size.width * 0.05,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Mô tả: Đây là lớp học vui nhộn',
                              style: TextStyle(
                                color: isDarkMode
                                    ? const Color.fromARGB(255, 58, 69, 75)
                                    : const Color.fromARGB(255, 255, 255, 255),
                                fontSize: size.width * 0.05,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 10,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const StudentOfClass(),
                              ),
                            );
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              isDarkMode
                                  ? const Color.fromARGB(255, 58, 69, 75)
                                  : const Color.fromARGB(255, 255, 255, 255),
                            ), // Màu nền khi trạng thái bình thường
                            foregroundColor: MaterialStateProperty.all<Color>(
                                Colors
                                    .blue), // Màu chữ khi trạng thái bình thường
                            overlayColor: MaterialStateProperty.all<Color>(
                                Colors.blue), // Màu nền khi được nhấn
                            // Các thuộc tính khác
                          ),
                          child: const Text('Sinh viên'),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(size.height * 0.01,
                        size.height * 0.01, size.height * 0.01, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Danh sách cuộc thi',
                              style: TextStyle(
                                fontSize: size.height * 0.03,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueAccent,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: size.height * 0.015),
                  child: const Divider(
                    color: Colors.blue,
                    thickness: 3,
                  ),
                ),
                SizedBox(
                  height: size.height * 1, // Giới hạn chiều cao của ListView
                  child: ListView.builder(
                    itemCount: Rounds.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(left: size.height * 0.01, bottom: size.height * 0.03),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage:
                                AssetImage(Rounds[index].imageUrl ?? ''),
                          ),
                          title: Text(
                            Rounds[index].name ?? '',
                            style: TextStyle(
                              fontSize: size.height * 0.02,
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Thời gian bắt đầu: ${Rounds[index].startTime ?? ''}',
                                style: TextStyle(
                                  fontSize: size.height * 0.017,
                                ),
                              ),
                              Text(
                                'Thời gian kết thúc: ${Rounds[index].endTime ?? ''}',
                                style: TextStyle(
                                  fontSize: size.height * 0.017,
                                ),
                              ),
                              Text(
                                'Tổng thời gian: ${Rounds[index].totalTime ?? ''}',
                                style: TextStyle(
                                  fontSize: size.height * 0.017,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
