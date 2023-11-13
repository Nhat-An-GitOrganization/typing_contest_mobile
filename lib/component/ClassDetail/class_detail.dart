import 'package:flutter/material.dart';
import 'package:typing_contest_mobile/component/student_class/student.dart';

class ClassDetail extends StatelessWidget {
  const ClassDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.blue,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(size.height * 0.01),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Xử lý sự kiện khi biểu tượng avatar được nhấn
                      },
                      child: const Text('Bài kiểm tra'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const StudentOfClass(),
                          ),
                        );
                      },
                      child: const Text('Sinh viên'),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
                  height: size.height * 0.13, // Chiều cao của banner
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.blue, Colors.blue, Colors.blue],
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'NET101',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: size.width * 0.05,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Phạm Gia Khánh',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: size.width * 0.05,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Mô tả: Đây là lớp học vui nhộn',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: size.width * 0.05,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                    gradient: LinearGradient(
                      colors: [Colors.blue, Colors.blue, Colors.blue],
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(size.width * 0.006),
                    child: Stack(
                      children: [
                        Container(
                          height: size.height * 0.63,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0),
                            ),
                            color: Colors.white,
                          ),
                          child: GridView.count(
                            crossAxisCount: 1,
                            childAspectRatio: 3.5,
                            children: const [
                              ContestantList(
                                name: 'Bài test bla bla bla',
                                date: '2/8 - 4/8',
                                name1: 'test 1',
                              ),
                              ContestantList(
                                name: 'Bài test bla bla bla',
                                date: '2/8 - 4/8',
                                name1: 'test 2',
                              ),
                              ContestantList(
                                name: 'Bài test bla bla bla',
                                date: '2/8 - 4/8',
                                name1: 'test 3',
                              ),
                              ContestantList(
                                name: 'Bài test bla bla bla',
                                date: '2/8 - 4/8',
                                name1: 'test 4',
                              ),
                              ContestantList(
                                name: 'Bài test bla bla bla',
                                date: '2/8 - 4/8',
                                name1: 'test 5',
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
          ),
        ),
      ),
    );
  }
}

class ContestantList extends StatelessWidget {
  final String? name;
  final String? date;
  final String? name1;
  const ContestantList({Key? key, this.name, this.date, this.name1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(
          left: size.width * 0.06,
          right: size.width * 0.06,
          bottom: size.width * 0.03,
          top: size.width * 0.03),
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
              colors: [Colors.blue, Colors.blue, Colors.blue]),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(size.width * 0.005),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.05, vertical: size.width * 0.01),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name1 ?? 'test 1', // Hiển thị vị trí xếp hạng
                        style: const TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name ?? 'Name',
                        style: const TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        date ?? '1234',
                        style: const TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
