import 'package:ChronicleAR/ARScanner.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'ChronicleAR',
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
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
                Container(
                    child: Text('explore the unknown',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'CircularStd',
                          letterSpacing: 4.0,
                          color: Color(0xFFFFFFFF),
                        )),
                    alignment: Alignment(1.0, 1.0),
                    padding: EdgeInsets.only(right: 7)),
                Container(
                    child: CustomPaint(
                  size: Size(400, 100),
                  painter: MyPainter(),
                )),
                Container(
                    child: CustomPaint(
                  size: Size(400, 100),
                  painter: MyPainter2(),
                )),
                const SizedBox(height: 10),
                RaisedButton(
                  color: Colors.blue[900],
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ARScanner()),
                    );
                  },
                  child: Text("Start Scanning",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'CircularStd',
                        letterSpacing: 2.0,
                        color: Color(0xFFFFC107),
                      )),
/*const SizedBox(height: 30),
          RaisedButton(
            onPressed: () {},
            child: const Text('Enabled Button', style: TextStyle(fontSize: 20)),
          ),*/
                )
              ]),
        ),
      ),
    ));
  }
}

class MyPainter extends CustomPainter {
  //         <-- CustomPainter class
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Color(0xFFFFC107);
    paint.strokeWidth = 5;

    canvas.drawLine(
      Offset(50, 250),
      Offset(400, 20),
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}

class MyPainter2 extends CustomPainter {
  //         <-- CustomPainter class
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.white;
    paint.strokeWidth = 5;

    canvas.drawLine(
      Offset(225, 115),
      Offset(400, -10),
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}
