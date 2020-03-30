import 'dart:io';
import 'package:feathers/app_constants/app_colors.dart';
import 'package:feathers/details_flow/details_view.dart';
import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:feathers/camera_flow/camera_dialog.dart';

class cameraView extends StatefulWidget {
  @override
  _cameraViewState createState() => _cameraViewState();
}

class _cameraViewState extends State<cameraView> {
  File _image;
  final _colors = AppColors();

  Future _getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;

      showDialog(
          context: context,
          builder: (BuildContext context) => cameraDialog(
            
              title: "Blue Jay",
              buttonText: "Learn More",

              selectedImage: AssetImage('assets/cameraView_assets/blue.jpg')
               ));
      print('_image: $_image');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image:
                        AssetImage('assets/cameraView_assets/cameraBack.png'),
                    fit: BoxFit.fill)),
          ),
          Center(child: Text("Upload a picture of a bird", style: TextStyle(fontFamily: 'Gibson', color: Colors.white, fontSize: 25))),
          Align(
            alignment: Alignment(0, 0.35),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: GestureDetector(
                child: flrButton(),
                onTap: () => _getImage(), // TO DO: Instantiate Image Picker
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Container(
          height: 70.0,
          width: 70.0,
          child: FittedBox(
            child: FloatingActionButton(
              child: Icon(
                Icons.arrow_downward,
                size: 26.0,
                color: _colors.menuBlue,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
        Center(
          child: Icon(
            Icons.camera_alt,
            size: 40,
            color: Color(0xFF020D53),
          ),
        ),
      ],
    ),
  );
}
