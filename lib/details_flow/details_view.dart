import 'package:feathers/details_flow/details_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:feathers/app_constants/app_colors.dart';
import 'dart:convert';

class detailsView extends StatefulWidget {
  @override
  _detailsViewState createState() => _detailsViewState();
}

class _detailsViewState extends State<detailsView> {
  AppColors _colors = AppColors();
  Future<Bird> futureBird;

  @override
  void initState() {
    super.initState();
    futureBird = fetchBirdData();
  }

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: _colors.profileBlue,
      body: Stack(
        children: <Widget>[
          ListView(
            children: <Widget>[
              FutureBuilder<Bird>(
                future: futureBird,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Container(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                          Padding(
                              padding: const EdgeInsets.only(left: 18, top: 58),
                              child: Text(
                                "${snapshot.data.name}",
                                style: TextStyle(
                                    fontSize: 29,
                                    fontFamily: 'Gibson',
                                    color: Colors.white),
                              )),
                          Image.asset(
                            "assets/detailsView_assets/jay.png",
                            fit: BoxFit.fill,
                            width: _width,
                          ),
                          Padding(
                            padding:const EdgeInsets.only(left: 18, top: 18),
                            
                            child: Text("Habitat",
                              style: TextStyle(
                                color: Color(0xFFF3D338),
                                fontSize: 20,
                              ))),
                          Padding(
                              padding: const EdgeInsets.only(left: 18, top: 18),
                              child: Text(
                                "${snapshot.data.habitat}",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Gibson',
                                    color: Colors.white),
                              )),

                               Padding(
                            padding:const EdgeInsets.only(left: 18, top: 18),
                            
                            child: Text("Plumage",
                              style: TextStyle(
                                color: Color(0xFFF3D338),
                                fontSize: 20,
                              ))),
                          Padding(
                              padding: const EdgeInsets.only(left: 18, top: 18),
                              child: Text(
                                "${snapshot.data.plumage}",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Gibson',
                                    color: Colors.white),
                              )),

                               Padding(
                            padding:const EdgeInsets.only(left: 18, top: 18),
                            
                            child: Text("Nest",
                              style: TextStyle(
                                color: Color(0xFFF3D338),
                                fontSize: 20,
                              ))),
                          Padding(
                              padding: const EdgeInsets.only(left: 18, top: 18),
                              child: Text(
                                "${snapshot.data.nest}",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Gibson',
                                    color: Colors.white),
                              )),

                              Padding(
                            padding:const EdgeInsets.only(left: 18, top: 18),
                            
                            child: Text("Diet",
                              style: TextStyle(
                                color: Color(0xFFF3D338),
                                fontSize: 20,
                              ))),
                          Padding(
                              padding: const EdgeInsets.only(left: 18, top: 18),
                              child: Text(
                                "${snapshot.data.diet}",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Gibson',
                                    color: Colors.white),
                              )),
                              Padding(
                            padding:const EdgeInsets.only(left: 18, top: 18),
                            
                            child: Text("Lifespan",
                              style: TextStyle(
                                color: Color(0xFFF3D338),
                                fontSize: 20,
                              ))),

                          Padding(
                              padding: const EdgeInsets.only(left: 18, top: 18),
                              child: Text(
                                "${snapshot.data.lifespan}",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Gibson',
                                    color: Colors.white),
                              )),

                              Padding(
                            padding:const EdgeInsets.only(left: 18, top: 18),
                            
                            child: Text("Conservation Status",
                              style: TextStyle(
                                color: Color(0xFFF3D338),
                                fontSize: 20,
                              ))),
                          Padding(
                              padding: const EdgeInsets.only(left: 18, top: 18),
                              child: Text(
                                "${snapshot.data.conservationStatus}",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Gibson',
                                    color: Colors.white),
                              )),
                              Padding(
                            padding:const EdgeInsets.only(left: 18, top: 18),
                            
                            child: Text("Fun facts",
                              style: TextStyle(
                                color: Color(0xFFF3D338),
                                fontSize: 20,
                              ))),
                          Padding(
                              padding: const EdgeInsets.only(left: 18, top: 18),
                              child: Text(
                                "${snapshot.data.funFacts[0]}",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Gibson',
                                    color: Colors.white),
                              )),
                              Padding(
                              padding: const EdgeInsets.only(left: 18, top: 18),
                              child: Text(
                                "${snapshot.data.funFacts[1]}",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Gibson',
                                    color: Colors.white),
                              )),

                              

                        SizedBox(height: 100,),
                        ]));
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return CircularProgressIndicator();
                },
              ),
              // Align(
              //   alignment: Alignment.center,
              //   child: Image.asset(
              //     "assets/detailsView_assets/FullBackground.png",
              //     fit: BoxFit.fill,
              //     width: _width,
              //   ),
              // ),
            ],
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

// Widget apiCall(){
//   return Container(
//     child: FutureBuilder<Bird>(
//             future: futureBird,
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 return Text(snapshot.data.name);
//               } else if (snapshot.hasError) {
//                 return Text("${snapshot.error}");
//               }
//               return CircularProgressIndicator();
//             },
//           ),

//   );
// }

// ListView(
//             children: <Widget>[
//               FutureBuilder<Bird>(
//                 future: futureBird,
//                 builder: (context, snapshot) {
//                   if (snapshot.hasData) {
//                     return Text(
//                       snapshot.data.name,
//                       style: TextStyle(
//                           fontFamily: 'Gibson',
//                           fontSize: 40,
//                           color: _colors.profileBlue),
//                     );
//                   } else if (snapshot.hasError) {
//                     return Text("${snapshot.error}");
//                   }
//                   return CircularProgressIndicator();
//                 },
//               ),
//               Align(
//                 alignment: Alignment.center,
//                 child: Image.asset(
//                   "assets/detailsView_assets/FullBackground.png",
//                   fit: BoxFit.fill,
//                   width: _width,
//                 ),
//               ),
//             ],
//           )
