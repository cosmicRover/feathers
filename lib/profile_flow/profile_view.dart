import 'package:carousel_slider/carousel_slider.dart';
import 'package:feathers/app_constants/app_colors.dart';
import 'package:feathers/profile_flow/profile_view_model.dart';
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
    final _viewModel = ProfileViewViewModel();
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    var current = 0;

    return Scaffold(
      backgroundColor: _colors.profileBlue,
      body: Stack(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top:50.0, left:30.0),
                  child: Text(
                    "Hello Haily!",
                    style: TextStyle(
                        fontSize: 34.0,
                        color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:20.0, left:30.0),
                  child: Text(
                    "This is your timeline",
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white),
                  ),
                ),
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
                      padding: const EdgeInsets.only(top: 240.0),
                      child: Container(
                        height: 180.0,
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
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 450.0),
                      child: Container(
                          child: Column(
                        children: <Widget>[
                          CarouselSlider(
                              enableInfiniteScroll: true,
                              enlargeCenterPage: true,
                              height: 170.0,
                              aspectRatio: 2.0,
                              viewportFraction: 0.8,
                              initialPage: 0,
                              onPageChanged: (index) {
                                setState(() {
                                  current = index;
                                });
                              },
                              items: _viewModel.imageList.map((e) {
                                return Builder(
                                  builder: (BuildContext context) {
                                    return Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20.0)),
                                        child: Stack(
                                          children: <Widget>[
                                            Image.network(e, fit: BoxFit.fill),
                                            Align(
                                              alignment: Alignment.bottomLeft,
                                              child: Image.asset(
                                                "assets/profileview_assets/tag.png",
                                                height: 60.0,
                                                width: 230.0,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 16.0, left: 16.0),
                                              child: Align(
                                                alignment: Alignment.bottomLeft,
                                                child: Text(
                                                  "Blue Jay",
                                                  style: TextStyle(
                                                      fontSize: 18.0,
                                                      color: Colors.white),
                                                ),
                                              ),
                                            )
                                          ],
                                        ));
                                  },
                                );
                              }).toList())
                        ],
                      )),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Container(
                      width: _width,
                      child: Image.asset(
                        "assets/profileview_assets/badge.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
                Center(
                  child: Text(
                    "Badges Earned",
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 120.0,
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
