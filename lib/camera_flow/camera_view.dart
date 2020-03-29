import 'package:flutter/material.dart';

class cameraView extends StatefulWidget {
  @override
  _cameraViewState createState() => _cameraViewState();
}

class _cameraViewState extends State<cameraView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                    'assets/cameraView_assets/cameraBack.png'), fit: BoxFit.fill
                    )
                  ),
                ),
Column(
  mainAxisAlignment: MainAxisAlignment.start,
  children: <Widget>[
    Expanded(
      flex: 2, 
      child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 60,
                  //child: IconButton(Icons.camera_enhance,color: Color(0xFF020D53),),
                  backgroundColor: Color(0xFFF1D137),
                  backgroundImage: AssetImage('assets/cameraView_assets/camIcon.png'), 
                  ) ,
              ],

      ),),
    )
  ],
)

        ],
      ),
    );
  }
}
