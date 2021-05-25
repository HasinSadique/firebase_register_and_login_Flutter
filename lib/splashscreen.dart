import 'package:firebase_registera_and_login/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class Splash extends StatefulWidget {
  const Splash({Key key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      image: Image(image: AssetImage("asset/logo.png"),
        height: 200,
        width: 200,

      ),
      navigateAfterSeconds: LoginPage(),
      seconds:5,
      loadingText: Text(
        "Excel IT AI",
        style: TextStyle(
          fontSize: 20,
        ),
      )

    );
  }
}
