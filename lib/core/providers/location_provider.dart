import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

final getLocationProvider =
    StateNotifierProvider<LocationProviderNotifier, LatLng?>((ref) {
  return LocationProviderNotifier();
});

class LocationProviderNotifier extends StateNotifier<LatLng?> {
  LocationProviderNotifier() : super(null);

  locationPermission() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    locationData = await location.getLocation();

    state = LatLng(locationData.latitude ?? 0.0, locationData.longitude ?? 0.0);
  }
}
