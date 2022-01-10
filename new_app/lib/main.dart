import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text("My First App",
        textScaleFactor: 1.5,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          "Hello World",
          textAlign: TextAlign.center,
          textScaleFactor: 3.6,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Text(
          "Finish",
          textAlign: TextAlign.center,
          textScaleFactor: 1.5,
        ),
        color: Colors.blue,
      ),
    ),
  ));
}
