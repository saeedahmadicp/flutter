import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'student_screen.dart';
import 'package:online_testing_service/constants.dart';

class StudentProfile extends StatefulWidget {
  final data;
  StudentProfile({this.data});
  @override
  _StudentProfileState createState() => _StudentProfileState();
}

class _StudentProfileState extends State<StudentProfile> {
  String loggedInUser;
  String firstName, lastName, gender;
  String testName = 'Not any', bestScore = 'Not any';
  bool isTestTaken = false;

  @override
  void initState() {
    super.initState();
    updateData(widget.data);
  }

  void updateData(dynamic userData) {
    if (userData != null) {
      firstName = userData['firstName'].toString();
      lastName = userData['lastName'].toString();
      gender = userData['gender'].toString();
      if (userData['testName'].toString() != 'null') {
        bestScore = userData['score'].toString();
        testName = userData['testName'].toString();
        isTestTaken = true;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        onPressed: () {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => StudentScreen()),
              (route) => false);
        },
        appBarTitle: 'Student Profile',
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundColor: Colors.orange,
              child: Icon(
                (gender == 'male')
                    ? FontAwesomeIcons.male
                    : FontAwesomeIcons.female,
                size: 100,
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Center(
              child: Text(
                '$firstName $lastName',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Center(
              child: Text(
                (!isTestTaken)
                    ? 'No test Data'
                    : 'Test Name:  $testName\nBest Score:  $bestScore',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 20.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
