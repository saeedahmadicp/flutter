import 'package:flutter/material.dart';

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter value',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.orangeAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.orangeAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

final kAppBar = AppBar(
  backgroundColor: Colors.deepOrange,
  title: Center(
    child: Text(
      'Online Testing Service',
    ),
  ),
);

Widget buildAppBar({Function onPressed, String appBarTitle}) {
  return AppBar(
    backgroundColor: Colors.deepOrange,
    leading: GestureDetector(
      onTap: onPressed,
      child: Row(
        children: [
          Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          Text(
            'back',
          )
        ],
      ),
    ),
    title: Center(
      child: Text(
        appBarTitle,
      ),
    ),
  );
}
