import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'merit_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:online_testing_service/components/brain_class.dart';

class LoadingStudentData extends StatefulWidget {
  @override
  _LoadingStudentDataState createState() => _LoadingStudentDataState();
}

class _LoadingStudentDataState extends State<LoadingStudentData> {
  final _firestore = Firestore.instance;

  @override
  void initState() {
    super.initState();
    loadStudentsData();
  }

  void loadStudentsData() async {
    List<StudentsRecord> list = [];
    final studentsData =
        await _firestore.collection('usersData').getDocuments();
    for (var student in studentsData.documents) {
      if (student['testName'].toString() != 'null') {
        list.add(StudentsRecord(
          firstName: student['firstName'].toString(),
          lastName: student['lastName'].toString(),
          gender: student['gender'].toString(),
          testName: student['testName'].toString(),
          score: student['score'].toString(),
        ));
      }
    }

    Navigator.push(context,
        MaterialPageRoute(builder: (context) => MeritListScreen(list: list)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitFadingFour(
          color: Colors.orange,
          size: 100.0,
        ),
      ),
    );
  }
}
