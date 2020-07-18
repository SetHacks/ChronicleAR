import 'package:flutter/material.dart';

class Instruction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Color(0xFF2965FF),
      body: Center(
        child: Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    child: Text('chronicleAR',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'CircularStd',
                          letterSpacing: 5.0,
                          color: Color(0xFFFFC107),
                        )),
                    alignment: Alignment(1.0, 0.0),
                    padding: EdgeInsets.only(right: 7)),
              ]),
        ),
      ),
    ));
  }
}
