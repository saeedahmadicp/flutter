import 'package:flutter/material.dart';
import 'package:online_testing_service/screens/login_screen.dart';
import 'package:online_testing_service/utilities/constants.dart';
import 'package:online_testing_service/components/press_button.dart';
import 'package:string_validator/string_validator.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  final _registrationFormKey = GlobalKey<FormState>();
  String _firstName, _lastName;
  String _email, _password;
  String _gender;
  String _selectedGender;

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _clearText() {
    _firstNameController.clear();
    _lastNameController.clear();
    _emailController.clear();
    _passwordController.clear();
    _selectedGender = null;
  }

  Color colour = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kAppBar,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: ListView(
          children: [
            Form(
                key: _registrationFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 100.0,
                    ),
                    TextFormField(
                      controller: _firstNameController,
                      keyboardType: TextInputType.name,
                      textAlign: TextAlign.center,
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Enter first Name',
                      ),
                      validator: (input) =>
                          !isAlpha(input) ? 'Enter a valid name' : null,
                      onSaved: (input) => _firstName = input,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      controller: _lastNameController,
                      keyboardType: TextInputType.name,
                      textAlign: TextAlign.center,
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Enter last name',
                      ),
                      validator: (input) =>
                          !isAlpha(input) ? 'Enter a valid name' : null,
                      onSaved: (input) => _lastName = input,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Select Gender:    ',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Radio(
                          activeColor: Colors.orange,
                          value: 'male',
                          groupValue: _selectedGender,
                          onChanged: (value) {
                            setState(() {
                              _selectedGender = value;
                              _gender = value;
                            });
                          },
                        ),
                        Text('Male     '),
                        Radio(
                          activeColor: Colors.orange,
                          value: 'female',
                          groupValue: _selectedGender,
                          onChanged: (value) {
                            setState(() {
                              _selectedGender = value;
                              _gender = value;
                            });
                          },
                        ),
                        Text('Female'),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      textAlign: TextAlign.center,
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Enter email address',
                      ),
                      validator: (input) => EmailValidator.validate(input)
                          ? 'Enter a valid email'
                          : null,
                      onSaved: (input) => _email = input,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.text,
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Enter password',
                      ),
                      validator: (input) =>
                          (input.length < 6) ? 'weak password' : null,
                      onSaved: (input) => _password = input,
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    PressButton(
                      buttonTitle: 'Register',
                      onPressed: () async {
                        if (!_registrationFormKey.currentState.validate()) {
                          _clearText();
                          return;
                        }
                        _registrationFormKey.currentState.save();
                        try {
                          final user =
                              await _auth.createUserWithEmailAndPassword(
                                  email: _email.trim(), password: _password);
                          if (user != null) {
                            //take action
                            ;
                          }
                        } catch (e) {}

                        _clearText();
                      },
                    )
                  ],
                )),
            SizedBox(
              height: 15.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Already have account? ',
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
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  child: Text(
                    'Log In',
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
    );
  }
}
