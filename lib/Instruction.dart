import 'package:flutter/material.dart';
import 'package:ChronicleAR/ARScanner.dart';

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
      body: Center(
          child: GridView.count(
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
                    color: Colors.white,
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
                    color: Colors.white,
                  )),
              color: Color(0xFF2965FF),
            ),
            Container(
                padding: const EdgeInsets.all(8),
                child: Image(
                  image: AssetImage('assets/Info.png'),
                )),
            Container(padding: const EdgeInsets.all(8)),
            const SizedBox(
              height: 30,
              width: 50,
            ),
            RaisedButton(
              color: Colors.blue[900],
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ARScanner()),
                );
              },
              child: Text("Start",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'CircularStd',
                    letterSpacing: 2.0,
                    color: Color(0xFFFFC107),
                  )),
            ),
          ])),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Add your onPressed code here!
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ARScanner()),
          );
        },
        label: Text('Start Scanning',
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'CircularStd',
              color: Colors.blue[900],
            )),
        icon: Icon(Icons.scanner, color: Colors.blue[900]),
        backgroundColor: Colors.blue[50],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: BottomAppBar(
          elevation: 0.0,
          child: Container(
            height: 60,
            color: Color(0xFF2965FF),
          )),
    ));
  }
}

/*const SizedBox(
                      height: 30,
                      width: 50,
                    ),
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
                    ),*/
