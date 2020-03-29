import 'package:location/location.dart';
import 'dart:async';

class LocationService{
  Location location = Location();
  bool _serviceEnabled;
  PermissionStatus _permissionGranted;

  Future<void> checkService() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }
  }

  Future<void> permissionStatus() async {
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
  }

  Future<LocationData> getLocation() async {
    return await location.getLocation();
  }

}