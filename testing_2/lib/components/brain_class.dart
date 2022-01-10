import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = Firestore.instance;
List<MCQs> listData = [];

class BrainClass {
  int _length;
  var _data;

  Future loadData(List<MCQs> listData) async {
    _data = await _firestore.collection('MCQs').getDocuments();
    _length = _data.documents.length;
    return _data;
  }

  int getLength() {
    return _length;
  }
}

class MCQs {
  String mcqs;
  String optionA;
  String optionB;
  String optionC;
  String optionD;
  String correctOption;

  MCQs(
      {this.mcqs,
      this.optionA,
      this.optionB,
      this.optionC,
      this.optionD,
      this.correctOption});
}

class StudentsRecord {
  String firstName;
  String lastName;
  String score;
  String gender;
  String testName;

  StudentsRecord(
      {this.firstName, this.lastName, this.gender, this.testName, this.score});
}
