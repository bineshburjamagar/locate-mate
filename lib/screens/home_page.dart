import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:locate_mate/core/providers/location_provider.dart';

import '../core/models/mate_model.dart';
import '../core/widgets/widgets.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;

  BitmapDescriptor pigMarkerIcon = BitmapDescriptor.defaultMarker;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkLocation();
    addCustomIcon();
    addPigCustomIcon();
  }

  checkLocation() async {
    ref.read(getLocationProvider);
  }

  void addCustomIcon() {
    BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size(34, 34)),
      "assets/images/pin.png",
    ).then(
      (icon) {
        setState(() {
          markerIcon = icon;
        });
      },
    );
  }

  void addPigCustomIcon() {
    BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size(34, 34)),
      "assets/images/pig.png",
    ).then(
      (icon) {
        setState(() {
          pigMarkerIcon = icon;
        });
      },
    );
  }

  moveCamera({required LatLng latLng}) {
    _controller.future
        .then((value) => value.animateCamera(CameraUpdate.newLatLng(latLng)));
  }

  @override
  Widget build(BuildContext context) {
    final location = ref.watch(getLocationProvider);
    final mateLocation = ref.watch(selectedMateProvider);
    final polygons = ref.watch(polygonsProvider);
    final initialLocation = ref.watch(initialLocationProvider);

    ref.listen(getLocationProvider, (pre, next) {
      if (next != null) {
        moveCamera(latLng: next);
      }
    });

    return Scaffold(
      body: Stack(
        children: [
          location != null
              ? GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: location,
                    zoom: 15.0,
                  ),
                  onMapCreated: (controller) {
                    _controller.complete(controller);
                  },
                  markers: {
                    Marker(
                      markerId: const MarkerId("marker1"),
                      position: initialLocation ?? location,
                      icon: markerIcon,
                      onDragEnd: (value) {},
                    ),
                    Marker(
                      markerId: const MarkerId("marker2"),
                      position: LatLng(mateLocation.lat, mateLocation.lang),
                      icon: markerIcon,
                      onDragEnd: (value) {},
                    ),
                    Marker(
                      markerId: const MarkerId("marker3"),
                      position: location,
                      icon: pigMarkerIcon,
                      onDragEnd: (value) {},
                    ),
                  },
                  polylines: {
                    if (polygons.isNotEmpty)
                      ...List.generate(
                        polygons.length,
                        (index) => Polyline(
                          polylineId: PolylineId(index.toString()),
                          points: polygons,
                          zIndex: index,
                          color: Colors.deepPurple,
                          width: 4,
                        ),
                      )
                  },
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 60.0,
                  child: ListView.separated(
                    padding: const EdgeInsets.only(left: 20.0),
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) {
                      return const SizedBox(width: 10.0);
                    },
                    itemBuilder: (context, index) {
                      return MateListWidget(
                        mateModel: mateList[index],
                      );
                    },
                    itemCount: mateList.length,
                  ),
                ),
                const MateDetailCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
