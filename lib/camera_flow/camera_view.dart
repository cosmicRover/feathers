import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

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
                Align(
            alignment: Alignment(0,0.35),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: GestureDetector(
                child: flrButton(),
                onTap: () => print("hello"),
              ),
            ),
          ),


        ],
      ),
    );
  }
}

 Widget flrButton() {
    return Container(
      height: 130.0,
      child: Stack(
        children: <Widget>[
          
          FlareActor(
            "assets/cameraView_assets/play.flr",
            fit: BoxFit.contain,
            animation: "stand_by",
            color: Color(0xFFF1D137)
          ),
          Center(child: Icon(Icons.camera_alt, size: 40, color: Color(0xFF020D53),),),
        ],
      ),
    );
  }
