import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;
import 'package:sensors/sensors.dart';
class ARScanner extends StatefulWidget{
  ARScanner({Key key}):super(key:key);
  @override
  State<StatefulWidget> createState() {
    return ARScannerPage();
  }

}
class ARScannerPage extends State<ARScanner>{
  List<double> _accelerometerValues;
  StreamSubscription<dynamic> subscription;
  int a =0;
  File _imageFile;

  @override
  void initState() {
    super.initState();
    subscription = userAccelerometerEvents.listen((UserAccelerometerEvent event) {
      setState(() {
        _accelerometerValues = <double>[event.x, event.y, event.z];
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    print(_accelerometerValues);
    print(sqrt(_accelerometerValues.map((e) =>pow(e,2) ).reduce((a, b) => a+b)));
    if(_accelerometerValues != null && sqrt(_accelerometerValues.map((e) =>pow(e,2) ).reduce((a, b) => a+b))<1){
      a+=1;

    }else{
      a=0;
    }
    if(a>10){

    }

    final List<String> accelerometer =
    _accelerometerValues?.map((double v) => v.toStringAsFixed(1))?.toList();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('$accelerometer'),
        ),
      ),
    );
  }


  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  Future<BookData> getBookInfo() async {

    Map<String, String> headers = {"Content-type": "application/json"};
    final response = await http.post("api/decks/",headers:headers,body: _imageFile.readAsBytesSync());

    return BookData.fromJson(response.body);

  }

}
class BookData {
  final String name;

  @override
  String toString() {
    return name;
  }

  BookData(this.name);

  factory BookData.fromJson(var json) {
    return BookData(json['name']);
  }
}
