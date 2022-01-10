import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red[600],
        appBar: AppBar(
          title: Center(
              child: Text(
            'Dicee',
          )),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  @override
  int leftDiceNumber = 2;
  int rightDiceNumber = 2;
  int max = 6;
  void changeDiceFace() {
    setState(() {
      leftDiceNumber = Random().nextInt(max) + 1;
      rightDiceNumber = Random().nextInt(max) + 1;
    });
  }

  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: FlatButton(
                onPressed: () {
                  changeDiceFace();
                },
                child: Image.asset('images/dice$leftDiceNumber.png')),
          ),
          SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: FlatButton(
              onPressed: () {
                changeDiceFace();
              },
              child: Image.asset('images/dice$rightDiceNumber.png'),
            ),
          ),
        ],
      ),
    );
  }
}
