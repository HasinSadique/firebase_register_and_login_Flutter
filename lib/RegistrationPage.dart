import 'package:firebase_registera_and_login/LoginPage.dart';
import 'package:firebase_registera_and_login/RegistrationPage.dart';
import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key key}) : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String _email, _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registration Page"),
      ),
      body: Form(
        key: formkey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                decoration: InputDecoration(hintText: "Email"),
                keyboardType: TextInputType.emailAddress,
                onSaved: (input) {
                  _email = input;
                },
                validator: (input) {
                  if (input.isEmpty) {
                    return "Email cannot be empty.";
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 80),
              child: TextFormField(
                decoration: InputDecoration(hintText: "Password"),
                obscureText: true,
                onSaved: (input) {
                  _password = input;
                },
                validator: (input) {
                  if (input.length < 6) {
                    return "Password should be at least 6 characters long.";
                  }
                  return null;
                },
              ),
            ),
            FlatButton(
              color: Colors.blue,
              onPressed: () {
                Navigator.pop(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: Text(
                "Register",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Have an account?"),
                SizedBox(
                  height: 30,
                  width: 5,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  child: Text(
                    "Log in",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
