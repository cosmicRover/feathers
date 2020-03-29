import 'package:feathers/login_flow/login_view.dart';
import 'package:flutter/material.dart';

import 'camera_flow/camera_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(

      ),
      home: cameraView(),
    );
  }
}