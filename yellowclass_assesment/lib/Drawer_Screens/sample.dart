import 'package:flutter/material.dart';

class Sample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Yellow",
              style: TextStyle(color: Colors.orangeAccent),
            ),
            Text(
              "Class",
              style: TextStyle(color: Colors.black),
            )
          ],
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 9.0,
      ),
      body: Center(
        child:
            Text("The App is Developed by V Ram Kishan for Yelllow Class !!"),
      ),
    );
  }
}
