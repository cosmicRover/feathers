import 'package:feathers/services/location_service.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapViewModel {
  LocationService locationService = LocationService();
  LocationData locationData;

  final CameraPosition kGooglePlex = CameraPosition(
    target: LatLng(37.33163361, -122.03031807),
    zoom: 14.4746,
  );

  String initLocation() {
    locationService
        .checkService()
        .then((value) => locationService.permissionStatus().then((value) {
              return "location enabled";
            }));
  }

  Future<LocationData> getCurrentLocation() async {
    return locationService.getLocation();
  }

}
