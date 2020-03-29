import 'package:feathers/app_constants/app_colors.dart';
import 'package:feathers/map_flow/map_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class MapView extends StatefulWidget {
  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  Completer<GoogleMapController> _controller = Completer();
  final _viewModel = MapViewModel();
  final _colors = AppColors();

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          maps(),
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset(
              "assets/mapview_assets/top.png",
              fit: BoxFit.cover,
              width: _width,
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 38.0, left: 15.0, right: 15.0),
              child: searchBox(),
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
                Icons.add,
                size: 26.0,
                color: _colors.menuBlue,
              ),
              onPressed: () {
                _showNavMenu(context);
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

  ///menu goes here
  void _showNavMenu(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            color: Colors.transparent,
            height: 400.0,
            child: Stack(
              
            ),
          );
        });
  }

  Widget maps() {
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: _viewModel.kGooglePlex,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
    );
  }

  Widget searchBox() {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          const BoxShadow(
            color: Colors.grey,
            blurRadius: 10.0
          )
        ],
        color: _colors.searchBoxGray,
          borderRadius: new BorderRadius.all(
            const Radius.circular(8.0),
          )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left:15.0),
            child: Text("Search birds..."),
          ),
          Padding(
            padding: const EdgeInsets.only(right:18.0),
            child: Image.asset("assets/mapview_assets/search.png"),
          )
        ],
      ),
      height: 45.0,
    );
  }

  void placeHolder() {
    _viewModel.initLocation();
    _viewModel.getCurrentLocation().then((loc) {
      print(loc.toString());
    });
  }
}
