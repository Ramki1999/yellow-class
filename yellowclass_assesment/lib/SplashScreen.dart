import 'package:flutter/material.dart';
import 'package:yellowclass_assesment/FadeAnimation.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

///Setting the duration to 3 seconds
class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationPage);
  }

  /// Navigates the control to HomeScreen once the animation is complete
  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/LoginScreen');
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FadeAnimation(
              1,
              Container(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Image.asset('asset/title.png'))),
        ],
      )),
    );
  }
}
