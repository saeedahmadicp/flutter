import 'package:flutter/material.dart';

class PressButton extends StatelessWidget {
  final String buttonTitle;
  final Function onPressed;

  PressButton({this.buttonTitle, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5.0,
      color: Colors.orange,
      borderRadius: BorderRadius.circular(30.0),
      child: MaterialButton(
        child: Text(
          buttonTitle,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
