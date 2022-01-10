import 'package:flutter/material.dart';
import 'screens/loginScreen.dart';

//Future<void> main() async {
//  WidgetsFlutterBinding.ensureInitialized();
//  //await Firebase.initializeApp();
//  runApp(StackVault());
//}

void main() => runApp(StackVault());

class StackVault extends StatelessWidget {
  // This widget is the root of your application.

//  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

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
