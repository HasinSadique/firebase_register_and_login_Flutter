import 'package:firebase_registera_and_login/LoginPage.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child: Text("Hello User")),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.menu),
        ),
        appBar: AppBar(
          actions: [
            FlatButton(
                onPressed: () {
                  Navigator.pop(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                child: Text(
                  "Log out",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ))
          ],
          title: Text("Homepage"),
        ));
  }
}
