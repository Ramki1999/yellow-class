import 'dart:async';
import 'package:flutter/material.dart';
import 'package:yellowclass_assesment/LoginScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:yellowclass_assesment/SplashScreen.dart';
import 'package:yellowclass_assesment/camera.dart';
import 'package:camera/camera.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(new MyApp());
  cameras = await availableCameras();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Yellow Class',
        theme: ThemeData(
          primaryColor: Colors.white,
          accentColor: Colors.orangeAccent,
          fontFamily: "GT",
        ),
//      darkTheme: ThemeData.dark(),
        home: SafeArea(child: SplashScreen()),
        routes: <String, WidgetBuilder>{
          '/LoginScreen': (BuildContext context) =>
              SafeArea(child: LoginScreen())
        });
  }
}
