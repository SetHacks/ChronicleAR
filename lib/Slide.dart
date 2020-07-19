import 'package:flutter/material.dart';

class Slide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Container(
      child: Center(
        Slider(
          min: 0,
          max: 100,
          value: _value,
          onChanged: (value) {
            setState(() {
              _value = value;
            });
          },
        ),
      ),
    )));
  }
}
