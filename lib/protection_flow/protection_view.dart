import 'package:feathers/app_constants/app_colors.dart';
import 'package:flutter/material.dart';

class ProtectionView extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    AppColors _colors = AppColors();

    return Scaffold(
        body: Stack(children: <Widget>[
      ListView(children: <Widget>[
        Image.asset("assets/protectionView_assets/Background.png", fit: BoxFit.fill)
      ]),
      Align(
        alignment: Alignment.topCenter,
        child: Image.asset(
          "assets/mapview_assets/top.png",
          fit: BoxFit.cover,
          width: _width,
        ),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Image.asset(
          "assets/mapview_assets/bottom.png",
          fit: BoxFit.cover,
          width: _width,
        ),
      )
    ]),
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
//              shape: RoundedRectangleBorder(
//                  borderRadius: BorderRadius.all(Radius.circular(12.0))),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
