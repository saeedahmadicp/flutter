import 'package:flutter/material.dart';
import 'package:online_testing_service/components/brain_class.dart';
import 'online_test.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingTestData extends StatefulWidget {
  @override
  _LoadingTestDataState createState() => _LoadingTestDataState();
}

class _LoadingTestDataState extends State<LoadingTestData> {
  @override
  void initState() {
    // TODO: implement initState
    loadingTestData();
  }

  void loadingTestData() async {
    final testData = await brain.loadData(listData);
    for (var mcqsData in testData.documents) {
      MCQs tempMCQs = MCQs(
        mcqs: mcqsData['mcqs'].toString(),
        optionA: mcqsData['optionA'].toString(),
        optionB: mcqsData['optionB'].toString(),
        optionC: mcqsData['optionC'].toString(),
        optionD: mcqsData['optionD'].toString(),
        correctOption: mcqsData['correctOption'].toString(),
      );

      listData.add(tempMCQs);
      print(listData.length);
    }
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => OnlineTestScreen()));
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
