import 'package:flutter/material.dart';

class Instruction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('Instructions!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'CircularStd',
                    letterSpacing: 2.0,
                    color: Color(0xFFFFC107),
                  )),
              elevation: 0.0,
              backgroundColor: Color(0xFF2965FF),
            ),
            backgroundColor: Color(0xFF2965FF),
            body: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(10),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: <Widget>[
                Container(
                    padding: const EdgeInsets.all(8),
                    child: Image(
                      image: AssetImage('assets/PhoneScanning.png'),
                    )),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('Scan the title of the book on the spine.',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'CircularStd',
                        letterSpacing: 1.0,
                        color: Color(0xFFFFC107),
                      )),
                  color: Color(0xFF2965FF),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('Learn about the book!',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'CircularStd',
                        letterSpacing: 1.0,
                        color: Color(0xFFFFC107),
                      )),
                  color: Color(0xFF2965FF),
                ),
                Container(
                    padding: const EdgeInsets.all(8),
                    child: Image(
                      image: AssetImage('assets/Info.png'),
                    )),
              ],
            ))

        /*Center(
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
                Container(
                  child: Image(
                    image: AssetImage('assets/Text1.png'),
                    height: 150,
                    width: 150,
                  ),
                  alignment: Alignment(0.0, 0.0),
                ),
              ]),
        ),
      ),
      */
        );
  }
}
