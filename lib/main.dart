import 'package:feathers/app_constants/app_colors.dart';
import 'package:feathers/details_flow/details_view.dart';
import 'package:feathers/login_flow/login_view.dart';
import 'package:feathers/map_flow/map_view.dart';
import 'package:feathers/profile_flow/profile_view.dart';
import 'package:flutter/material.dart';

import 'camera_flow/camera_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppColors _colors = AppColors();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor: _colors.mainYellow,
        canvasColor: Colors.transparent,
        fontFamily: 'Gibson'
      ),

      home: LoginView(),

    );
  }
}
