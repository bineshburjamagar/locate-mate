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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkLocation();
  }

  checkLocation() async {
    ref.read(getLocationProvider);
  }

  Set<Polygon> myPolygon() {
    final polygons = ref.watch(polygonsProvider);

    Set<Polygon> polygonSet = {};
    polygonSet.add(Polygon(
        polygonId: const PolygonId('test'),
        points: polygons,
        strokeColor: Colors.red));

    return polygons.isEmpty ? polygonSet : {};
  }

  @override
  Widget build(BuildContext context) {
    final location = ref.watch(getLocationProvider);
    final mateLocation = ref.watch(selectedMateProvider);

    // ref.listen(getLocationProvider, (pre, next) {
    //   if (next != null) {
    //     mapController.move(next, 18.0);
    //   }
    // });

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
                      position: location,
                      draggable: true,
                      onDragEnd: (value) {},
                    ),
                    Marker(
                      markerId: const MarkerId("marker2"),
                      position: LatLng(mateLocation.lat, mateLocation.lang),
                      draggable: true,
                      onDragEnd: (value) {},
                    ),
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
