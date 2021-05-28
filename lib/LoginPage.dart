import 'package:firebase_registera_and_login/RegistrationPage.dart';
import 'package:firebase_registera_and_login/homepage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String _email, _password;

  Future <void> login() async {
    final formstate = formkey.currentState;

    if(formstate.validate()){
      formstate.save();
      FirebaseUser loginUser = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Homepage()));
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Login Page")),
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
                setState(() {
                  login();
                });
              },
              child: Text(
                "Login",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?"),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegistrationPage()));
                  },
                  child: Text(
                    "Sign up",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Text("Or, Sign in with"),
                SizedBox(height: 20,)
              ],
            )
          ],
        ),
      ),
    );
  }


}
