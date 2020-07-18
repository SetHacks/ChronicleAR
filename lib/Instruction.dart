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
                  child: Image(
                    image: AssetImage('assets/PhoneScanning.png'),
                    height: 150,
                    width: 150,
                  ),
                  alignment: Alignment(-1.0, -1.0),
                  padding: EdgeInsets.only(left: 8, bottom: 100),
                ),
                Container(
                  child: Image(
                    image: AssetImage('assets/Info.png'),
                    height: 150,
                    width: 150,
                  ),
                  alignment: Alignment(1.0, 1.0),
                  padding: EdgeInsets.only(right: 7, bottom: 100),
                ),
                Container(),
              ]),
        ),
      ),
    ));
  }
}
