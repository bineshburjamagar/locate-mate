import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:locate_mate/core/models/models.dart';

import '../core/widgets/widgets.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: FlutterMap(
        options: MapOptions(
          onTap: (tapPosition, point) {},
          initialCenter: const LatLng(
            27.6981287,
            85.3438704,
          ),
          initialZoom: 18.0,
          backgroundColor: Colors.black,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.locate_mate',
          ),
          const MarkerLayer(
            markers: [
              Marker(
                point: LatLng(27.698068, 85.3430862),
                child: Icon(
                  Icons.location_on,
                  color: Colors.blue,
                ),
              ),
              Marker(
                point: LatLng(27.6981287, 85.3438704),
                child: Icon(
                  Icons.location_on,
                  color: Colors.red,
                  // size: 100,
                ),
              ),
            ],
          ),
          PolygonLayer(
            polygons: [
              Polygon(
                color: Colors.black,
                isFilled: true,
                borderColor: Colors.black,
                borderStrokeWidth: 2,
                label: 'text',
                points: [
                  const LatLng(27.6981287, 85.3438704),
                  const LatLng(27.698068, 85.3430862),
                ],
              ),
            ],
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
          )
        ],
      ),
    );
  }
}
