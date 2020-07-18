import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
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
  ArCoreController arCoreController;
  List<double> _accelerometerValues;
  StreamSubscription<dynamic> subscription;
  int a =0;
  File _imageFile;
  ScreenshotController screenshotController = ScreenshotController();

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
      //print(a);



    }else{
      a=0;
    }
    if(a>10){
      screenshotController.capture().then((File image) {
        setState(() {
          print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
          _imageFile = image;
        });
      }).catchError((onError) {
        print(onError);
      });
      a=0;

    }

    final List<String> accelerometer =
    _accelerometerValues?.map((double v) => v.toStringAsFixed(1))?.toList();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('$accelerometer'),
        ),
        body: Screenshot(
          controller: screenshotController,
          child: ArCoreView(

            onArCoreViewCreated: _onArCoreViewCreated,
          ),
        ),
      ),
    );
  }

  void _onArCoreViewCreated(ArCoreController controller) {
    arCoreController = controller;
    _addSphere(arCoreController);
    _addCylindre(arCoreController);
    _addCube(arCoreController);
  }

  void _addSphere(ArCoreController controller) {
    final material = ArCoreMaterial(
        color: Color.fromARGB(120, 66, 134, 244));
    final sphere = ArCoreSphere(
      materials: [material],
      radius: 0.1,
    );
    final node = ArCoreNode(
      shape: sphere,
      position: vector.Vector3(0, 0, -1.5),
    );
    controller.addArCoreNode(node);

  }

  void _addCylindre(ArCoreController controller) {
    final material = ArCoreMaterial(
      color: Colors.red,
      reflectance: 1.0,
    );
    final cylindre = ArCoreCylinder(
      materials: [material],
      radius: 0.5,
      height: 0.3,
    );
    final node = ArCoreNode(
      shape: cylindre,
      position: vector.Vector3(0.0, -0.5, -2.0),
    );
    controller.addArCoreNode(node);
  }

  void _addCube(ArCoreController controller) {
    final material = ArCoreMaterial(
      color: Color.fromARGB(120, 66, 134, 244),
      metallic: 1.0,
    );
    final cube = ArCoreCube(
      materials: [material],
      size: vector.Vector3(0.5, 0.5, 0.5),
    );
    final node = ArCoreNode(
      shape: cube,
      position: vector.Vector3(-0.5, 0.5, -3.5),
    );
    controller.addArCoreNode(node);
  }

  @override
  void dispose() {
    subscription.cancel();
    arCoreController.dispose();
    super.dispose();
  }

}
