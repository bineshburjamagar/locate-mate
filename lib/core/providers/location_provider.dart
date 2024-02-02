import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:location/location.dart';

final getLocationProvider =
    StateNotifierProvider<LocationProviderNotifier, LatLng?>((ref) {
  return LocationProviderNotifier(ref: ref);
});

final currentLocationProvider = StateProvider<List<LatLng>>((ref) {
  return [];
});

class LocationProviderNotifier extends StateNotifier<LatLng?> {
  LocationProviderNotifier({required this.ref}) : super(null) {
    locationPermission();
    locationStream();
  }

  final Ref ref;

  Location location = Location();

  locationPermission() async {
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

  locationStream() {
    location.onLocationChanged.listen((event) {
      List<LatLng> latLang = ref.read(currentLocationProvider);
      if (event.latitude != null && event.longitude != null) {
        LatLng location = LatLng(event.latitude!, event.longitude!);
        state = location;
        latLang.add(location);
      }
      ref
          .read(currentLocationProvider.notifier)
          .update((state) => state = latLang);
    });
  }
}
