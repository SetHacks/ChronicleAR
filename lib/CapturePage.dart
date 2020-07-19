import 'dart:async';
import 'dart:math';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:sensors/sensors.dart';

class CapturePage extends StatefulWidget {
  final CameraDescription camera;
  const CapturePage({
    Key key,
    @required this.camera,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() => new CapturePageState();
}

class CapturePageState extends State<CapturePage> {
  List<double> _accelerometerValues;
  StreamSubscription<dynamic> subscription;
  int a = 0;
  CameraController _controller;
  Future<void> _initializeControllerFuture;
  @override
  void initState() {
    super.initState();
    /*subscription = userAccelerometerEvents.listen((UserAccelerometerEvent event) {
      setState(() {
        _accelerometerValues = <double>[event.x, event.y, event.z];
      });
    });*/
    // To display the current output from the Camera,
    // create a CameraController.
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.camera,
      // Define the resolution to use.
      ResolutionPreset.medium,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
    _controller.startImageStream((image) => print(image.format.raw.toString()));
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the Future is complete, display the preview.
            return CameraPreview(_controller);
          } else {
            // Otherwise, display a loading indicator.
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
