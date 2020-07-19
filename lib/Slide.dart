import 'package:flutter/material.dart';

class Slide extends StatefulWidget {
  @override
  _SlideState createState() => _SlideState();
}

class _SlideState extends State<Slide> {
  @override
  Widget build(BuildContext context) {
    double _value=0;
    return MaterialApp(
        home: Scaffold(
      body: SliderTheme(
        data: SliderTheme.of(context).copyWith(
          activeTrackColor: Colors.red,
          inactiveTrackColor: Colors.black,
          trackHeight: 3.0,
          thumbColor: Colors.yellow,
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8.0),
          overlayColor: Colors.purple.withAlpha(32),
          overlayShape: RoundSliderOverlayShape(overlayRadius: 14.0),
        ),
        child: Slider(
            value: _value,
            onChanged: (value) {
              setState(() {
                _value = value;
              });
            }),
      ),
    ));
  }
}
