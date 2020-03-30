import 'dart:io';
import 'package:feathers/details_flow/details_view.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:feathers/camera_flow/camera_view.dart';

class cameraDialog extends StatelessWidget {
  final String title, buttonText, buttonRoute;
  //final Image selectedImage;
  final AssetImage selectedImage;
  

  cameraDialog(
      {@required this.title,
      @required this.buttonText,
      @required this.buttonRoute,
      @required this.selectedImage});

  static const double padding = 20.0;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(padding),
      ),
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(padding),
            decoration: BoxDecoration(
                color: Color(0xFF122C93),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(padding)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                

                Container(child: Image.asset('assets/cameraView_assets/blue.jpg'),),
                SizedBox(height: 20),
                 
                Text(title, style: TextStyle(fontFamily: 'Gibson',fontSize: 20, color: Colors.white),), 
                SizedBox(height: 20),

                
                Align(
            alignment: Alignment(0, 0.35),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: GestureDetector(
                child: flrButton(),
                onTap: () {
                  Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => detailsView()));
                }
              ),
            ),
          ),
                

              ],
            ),
          )
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
        FlareActor("assets/cameraView_assets/play.flr",
            fit: BoxFit.contain,
            animation: "stand_by",
            color: Color(0xFFF1D137)),
            Center(child: Text("Learn More", style: TextStyle(color: Color(0xFF02158B), fontFamily: 'Gibson'),),),
        
      ],
    ),
  );
}
