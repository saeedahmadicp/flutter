import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_testing_service/screens/registration_screen.dart';
import 'package:online_testing_service/utilities/constants.dart';
import 'package:online_testing_service/components/press_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:email_validator/email_validator.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  String _email, _password;
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  void _clearFields() {
    emailTextController.clear();
    passwordTextController.clear();
  }

  //text color
  Color colour = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kAppBar,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      controller: emailTextController,
                      textAlign: TextAlign.center,
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Enter email address',
                      ),
                      validator: (input) => !EmailValidator.validate(input)
                          ? 'Enter a valid email'
                          : null,
                      onSaved: (input) => _email = input,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      textAlign: TextAlign.center,
                      obscureText: true,
                      controller: passwordTextController,
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Enter password',
                      ),
                      validator: (input) => (input.length < 6)
                          ? 'Password must contain at least 6 characters'
                          : null,
                      onSaved: (input) => _password = input,
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    PressButton(
                      buttonTitle: 'Log In',
                      onPressed: () async {
                        if (!_formKey.currentState.validate()) {
                          _clearFields();
                          return;
                        }
                        _formKey.currentState.save();
                        try {
                          final user = await _auth.signInWithEmailAndPassword(
                              email: _email.trim(), password: _password);
                          if (user != null) {
                            //take action
                          }
                        } catch (e) {
                          print(e);
                        }

                        _clearFields();
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have account? ',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        colour = Colors.deepOrange;
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegistrationScreen()),
                      );
                    },
                    child: Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: colour,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
