import 'package:flutter/material.dart';

class Instruction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    child: Image(
                  image: AssetImage('assets/PhoneScanning.png'),
                ))
              ]),
          alignment: Alignment(1.0, 0.0),
        ),
      ),
    ));
  }
}
