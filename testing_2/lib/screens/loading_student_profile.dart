import 'package:flutter/material.dart';
import 'student_profile.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StudentProfileLoadingScreen extends StatefulWidget {
  @override
  _StudentProfileLoadingScreenState createState() =>
      _StudentProfileLoadingScreenState();
}

class _StudentProfileLoadingScreenState
    extends State<StudentProfileLoadingScreen> {
  final _firestore = Firestore.instance;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserData();
  }

  void getUserData() async {
    print(LoggedInUser);
    final data =
        await _firestore.collection('usersData').document(LoggedInUser).get();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => StudentProfile(
                  data: data,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitFadingFour(
          color: Colors.orange,
          size: 100,
        ),
      ),
    );
  }
}
