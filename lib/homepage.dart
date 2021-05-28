import 'package:firebase_registera_and_login/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String _name, _address, _mobile;
  String info= "info";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              )),
        ],
        title: Text("Homepage"),
      ),
      body: Form(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(hintText: "Full Name"),
                keyboardType: TextInputType.text,
                onSaved: (input) {
                  _name = input;
                },
                // validator: (input) {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(hintText: "Address"),
                keyboardType: TextInputType.text,
                onSaved: (input) {
                  _address = input;
                },
                // validator: (input) {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: "Mobile"
                        ""),
                keyboardType: TextInputType.number,
                onSaved: (input) {
                  _mobile = input;
                },
                // validator: (input) {
                //
                // },
              ),
            ),
            FlatButton(
                color: Colors.blue,
                onPressed: () {
                  setState(() {
                    info = "Hello: "+_name+_address+_mobile;

                    Firestore.instance.collection("profile").add({
                      "name": _name,
                      "address": _address,
                      "Mobile": _mobile
                    });
                  });

                },
                child: Text(
                  "Send",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )),
            Text(info)
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
            ),
            ListTile(
              leading: Image(
                image: AssetImage("asset/education_icon.png"),
                height: 30,
              ),
              title: Text(
                "Education",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: Image(
                image: AssetImage("asset/project_logo.png"),
                height: 30,
                width: 30,
              ),
              title: Text(
                "Projects",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
