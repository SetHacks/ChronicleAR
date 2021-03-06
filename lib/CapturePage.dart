import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sensors/sensors.dart';
import 'dart:io';

class CapturePage extends StatefulWidget{
  final CameraDescription camera;
  const CapturePage({Key key, @required this.camera,}) : super(key: key);
  @override
  State<StatefulWidget> createState() => new CapturePageState();

}

class CapturePageState extends State<CapturePage>{
  List<double> _accelerometerValues;
  StreamSubscription<dynamic> subscription;
  int a =0;
  CameraController _controller;
  Future<void> _initializeControllerFuture;
  @override
  void initState() {
    super.initState();
    subscription = userAccelerometerEvents.listen((UserAccelerometerEvent event) {
      setState(() {
        _accelerometerValues = <double>[event.x, event.y, event.z];
      });
    });
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
  }
  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    if (_accelerometerValues != null && sqrt(_accelerometerValues.map((e) =>pow(e,2) ).reduce((a, b) => a+b))<1) {
      a+=1;

    } else {
      a=0;
    }
    if (a>100) {
      takePic().then((value){

        //take pictures

      });

      a=0;
  

    }
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
  Future<String> takePic() async {
    try {
      // Ensure that the camera is initialized.
      await _initializeControllerFuture;

      // Construct the path where the image should be saved using the path
      // package.
      final path = join(
        // Store the picture in the temp directory.
        // Find the temp directory using the `path_provider` plugin.
        (await getTemporaryDirectory()).path, 'book.png',);

      print(path);
      if (FileSystemEntity.typeSync(path) != FileSystemEntityType.notFound) {
        File temp = new File(path);
        temp.delete();
      }

      // Attempt to take a picture and log where it's been saved.
      ImageCache().clear();
      await _controller.takePicture(path);

      List<int> bytes = await File(path).readAsBytes();
      return base64.encode(bytes);

    } catch (e) {
      // If an error occurs, log the error to the console.
      print(e);
    }
  }

}
