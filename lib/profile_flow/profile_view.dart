import 'package:feathers/app_constants/app_colors.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  AppColors _colors = AppColors();

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    int current = 0;

    return Scaffold(
      backgroundColor: _colors.profileBlue,
      body: Stack(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 90.0),
                      child: Image.asset(
                        "assets/profileview_assets/tree_back.png",
                        fit: BoxFit.contain,
//                  height: _height - 150,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 190.0),
                      child: Container(
                        height: 200.0,
                        child: Stack(
                          children: <Widget>[
                            FlareActor(
                              "assets/login_assets/play.flr",
                              fit: BoxFit.contain,
                              animation: "stand_by",
                              color: _colors.mainYellow,
                            ),
                            Align(
                                alignment: Alignment.bottomCenter,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "32",
                                      style: TextStyle(
                                          fontSize: 32.0,
                                          color: _colors.profileBlue),
                                    ),
//                                    SizedBox(
//                                      height: 4.0,
//                                    ),
                                    Text(
                                      "Birds Discovered",
                                      style:
                                          TextStyle(color: _colors.profileBlue),
                                    )
                                  ],
                                )),
                            Container(
                              child: Stack(
                                children: <Widget>[
                                  
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
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
                //go back to mapView
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
