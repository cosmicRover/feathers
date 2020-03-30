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

  List<Marker> birdMarkers = [
    Marker(
        markerId: MarkerId('mark1'),
        draggable: true,
        position: LatLng(37.3318, -122.0310),
        icon: BitmapDescriptor.fromAsset("assets/mapview_assets/pin1.png")
    ),
    Marker(
        markerId: MarkerId('mark1'),
        draggable: true,
        position: LatLng(37.331, -122.035),
        icon: BitmapDescriptor.fromAsset("assets/mapview_assets/pin2.png")
    ),
    Marker(
        markerId: MarkerId('mark1'),
        draggable: true,
        position: LatLng(37.331, -122.039),
        icon: BitmapDescriptor.fromAsset("assets/mapview_assets/pin3.png")
    ),
    Marker(
        markerId: MarkerId('mark1'),
        draggable: true,
        position: LatLng(37.330, -122.037),
        icon: BitmapDescriptor.fromAsset("assets/mapview_assets/pin4.png")
    ),
    Marker(
        markerId: MarkerId('mark1'),
        draggable: true,
        position: LatLng(37.330, -122.036),
        icon: BitmapDescriptor.fromAsset("assets/mapview_assets/pin5.png")
    )
  ];
}
