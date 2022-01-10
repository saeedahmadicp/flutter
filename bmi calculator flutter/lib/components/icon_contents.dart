import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class IconContents extends StatelessWidget {
  final IconData icon;
  final String label;

  IconContents({this.icon, this.label});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            size: 80.0,
          ),
          SizedBox(
            height: 15.0,
          ),
          Text(label, style: kLabelTextStyle),
        ],
      ),
    );
  }
}
