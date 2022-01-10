import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:online_testing_service/components/press_button.dart';
import 'package:online_testing_service/constants.dart';
import 'login_screen.dart';
import 'student_screen.dart';
import 'package:online_testing_service/components/brain_class.dart';

BrainClass brain = BrainClass();

class OnlineTestScreen extends StatefulWidget {
  @override
  _OnlineTestScreenState createState() => _OnlineTestScreenState();
}

class _OnlineTestScreenState extends State<OnlineTestScreen> {
  final _firestore = Firestore.instance;
  bool isSpin = false;

  int _index = 0;
  String _selectedOption;
  String _activeValue;
  String pressButtonText = 'Next';
  int score = 0;

  void storeData() async {
    final usersData =
        await _firestore.collection('usersData').document(LoggedInUser).get();

    if (usersData['score'] != null && usersData['score'] > score)
      ;
    else {
      await _firestore.collection('usersData').document(LoggedInUser).setData({
        'firstName': usersData['firstName'],
        'lastName': usersData['lastName'],
        'gender': usersData['gender'],
        'testName': 'Computer Basic',
        'score': score,
      });
    }
    isSpin = false;

    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => StudentScreen(),
        ),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kAppBar,
      body: ModalProgressHUD(
        inAsyncCall: isSpin,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 2,
                child: Center(
                  child: Material(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey,
                    elevation: 10,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          listData[_index] != null
                              ? listData[_index].mcqs
                              : 'Loading',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Expanded(
                flex: 1,
                child: Material(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey,
                  elevation: 10,
                  child: Center(
                    child: ListTile(
                      leading: Radio(
                        activeColor: Colors.orange,
                        groupValue: _activeValue,
                        value: listData[_index] != null
                            ? listData[_index].optionA
                            : 'Loading',
                        onChanged: (value) {
                          setState(() {
                            _activeValue = value;
                            _selectedOption = value;
                          });
                        },
                      ),
                      title: Text(
                        listData[_index] != null
                            ? listData[_index].optionA
                            : 'Loading',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Expanded(
                flex: 1,
                child: Material(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey,
                  elevation: 10,
                  child: Center(
                    child: ListTile(
                      leading: Radio(
                        activeColor: Colors.orange,
                        groupValue: _activeValue,
                        value: listData[_index] != null
                            ? listData[_index].optionB
                            : 'Loading',
                        onChanged: (value) {
                          setState(() {
                            _activeValue = value;
                            _selectedOption = value;
                          });
                        },
                      ),
                      title: Text(
                        listData[_index] != null
                            ? listData[_index].optionB
                            : 'Loading',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Expanded(
                flex: 1,
                child: Material(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey,
                  elevation: 10,
                  child: Center(
                    child: ListTile(
                      leading: Radio(
                        activeColor: Colors.orange,
                        groupValue: _activeValue,
                        value: listData[_index] != null
                            ? listData[_index].optionC
                            : 'Loading',
                        onChanged: (value) {
                          setState(() {
                            _activeValue = value;
                            _selectedOption = value;
                          });
                        },
                      ),
                      title: Text(
                        listData[_index] != null
                            ? listData[_index].optionC
                            : 'Loading',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Expanded(
                flex: 1,
                child: Material(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey,
                  elevation: 10,
                  child: Center(
                    child: ListTile(
                      leading: Radio(
                        activeColor: Colors.orange,
                        groupValue: _activeValue,
                        value: listData[_index] != null
                            ? listData[_index].optionD
                            : 'Loading',
                        onChanged: (value) {
                          setState(() {
                            _activeValue = value;
                            _selectedOption = value;
                          });
                        },
                      ),
                      title: Text(
                        listData[_index] != null
                            ? listData[_index].optionD
                            : 'Loading',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              PressButton(
                buttonTitle: pressButtonText,
                onPressed: () {
                  setState(() {
                    if (listData[_index].mcqs != null) {
                      if (_selectedOption == listData[_index].correctOption)
                        score++;
                      if (_index < (listData.length - 1)) {
                        _index++;
                      } else {
                        pressButtonText = 'Submit';
                        isSpin = true;
                      }
                    }
                  });

                  if (pressButtonText == 'Submit') {
                    storeData();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
