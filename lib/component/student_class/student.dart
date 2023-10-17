import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:typing_contest_mobile/models/student.dart';


class StudentOfClass extends StatefulWidget {
  const StudentOfClass({super.key});

  @override
  State<StudentOfClass> createState() => _StudentListScreenState();
}
class _StudentListScreenState extends State<StudentOfClass> {

  bool selectAll = false;
  List<bool> checkboxValues = List<bool>.filled(students.length, false);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title:const Text('Danh sách học sinh'),
        ),
        body: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.fromLTRB(size.height* 0.01,size.height* 0.03,size.height* 0.01,size.height* 0.01),
                child: Text(
                  'Teachers',
                  style: TextStyle(
                      fontSize: size.height * 0.03,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                      fontFamily: 'BeVietnamPro'
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.height*0.015),
              child:const Divider(
                color: Colors.blue,
                thickness: 1,
              ),
            ),
            Container(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(students[1]?.image??''),
                ),
                title: Text(students[1]?.email ?? '',
                  style: TextStyle(
                    fontFamily: 'BeVietnamPro',
                    fontSize: size.height*0.022
                ),),
                subtitle: Text('Name: ${students[1]?.id ?? ''}',
                  style: TextStyle(
                    fontSize: size.height*0.02,
                    fontFamily: 'BeVietnamPro',
                  )
                  ,),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(size.height* 0.01,0,size.height* 0.01,0),
              child:const Divider(
                color: Colors.blue,
                thickness: 1.8,
              ),
            ),
            Align(

              child: Padding(
                padding: EdgeInsets.fromLTRB(size.height * 0.01, size.height * 0.01, size.height * 0.01, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Classmates',
                          style: TextStyle(
                            fontSize: size.height * 0.03,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent,
                              fontFamily: 'BeVietnamPro'
                          ),
                        ),
                        Text(
                          '${students.length} student',
                          style: TextStyle(
                            fontSize: size.height * 0.023,
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.bold,
                              fontFamily: 'BeVietnamPro'
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                       const SizedBox(width: 0),
                        Checkbox(
                          value: selectAll,
                          onChanged: (value) {
                            setState(() {
                              selectAll = value ?? false;
                              checkboxValues = List<bool>.filled(students.length, selectAll);
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: ListView.builder(
                  itemCount: students.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(left: size.height*0.01),
                      child: Row(
                        children: [
                          Checkbox(
                            value: checkboxValues[index],
                            onChanged: (value) {
                              setState(() {
                                checkboxValues[index] = value ?? false;
                              });
                            },
                          ),
                          Expanded(
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundImage: AssetImage(students[index]?.image ?? ''),
                              ),
                              title: Text(students[index]?.email ?? '',
                              style: TextStyle(
                                fontSize: size.height*0.02,
                                fontFamily: 'BeVietnamPro',
                              ),),
                              subtitle: Text('School: ${students[index]?.trainingFacility ?? ''}',
                                  style: TextStyle(
                                      fontSize: size.height*0.017,
                                      fontFamily: 'BeVietnamPro',
                                  )),
                              trailing: SizedBox(
                                child: IconButton(
                                  icon: const Icon(Icons.close_sharp),
                                  color: Colors.redAccent,
                                  onPressed: () {
                                    // setState(() {
                                    //   students.removeAt(index);
                                    // });
                                  },
                                ),
                              ),
                              onTap: () {
                                // Handle onTap event
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        )
    );
  }
}
class CheckBoxModel{
  String? title;
  bool? value;
  CheckBoxModel({@required this.title,  this.value = false});
}
