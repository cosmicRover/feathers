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
          
          
          
          
          SizedBox(height: 40),
          ListView(
            children: <Widget>[
              FutureBuilder<Bird>(
            future: futureBird,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data.name, style: TextStyle(fontFamily: 'Gibson', fontSize: 40, color: Colors.black),);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
            },
          ),
              

              
              

              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/detailsView_assets/FullBackground.png",
                  fit: BoxFit.fill,
                  width: _width,
                ),
              ),
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
