import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(OnlineTestingService());
}

class OnlineTestingService extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Online Testing Service',
      theme: ThemeData.light(),
      home: LoginScreen(),
      routes: <String, WidgetBuilder>{
        'loginScreen': (context) => LoginScreen(),
        'studentScreen': (context) => LoginScreen(),
      },
    );
  }
}
