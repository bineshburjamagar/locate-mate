import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:locate_mate/core/apis/apis.dart';
import 'package:locate_mate/core/models/models.dart';

import '../providers/providers.dart';

final selectedMateProvider = StateProvider<MateModel>((ref) {
  return mateList.first;
});
final polygonsProvider = StateProvider<List<LatLng>>((ref) {
  return [];
});
final initialLocationProvider = StateProvider<LatLng?>((ref) {
  return;
});

class MateDetailCard extends ConsumerWidget {
  const MateDetailCard({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedData = ref.watch(selectedMateProvider);
    final location = ref.watch(getLocationProvider);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 15.0,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100.0),
                child: Image.network(
                  selectedData.image,
                  height: 50.0,
                  width: 50.0,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 10.0),
              Expanded(
                child: Text(
                  selectedData.fullName,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Text(
            selectedData.address,
            style: const TextStyle(fontSize: 16.0),
          ),
          const SizedBox(height: 10.0),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            onPressed: () async {
              Map<String, dynamic> params = {
                "origin": "${location?.latitude},${location?.longitude}",
                "destination": "${selectedData.lat},${selectedData.lang}",
                "key": dotenv.get('GOOGLEMAPKEY'),
              };
              var data =
                  await ref.read(getPolygonsProvider(params: params).future);

              var gg = data.routes.first.legs.first.steps
                  .map(
                    (e) => LatLng(
                      e.startLocation!.lat,
                      e.startLocation!.lng,
                    ),
                  )
                  .toList();
              ref
                  .read(initialLocationProvider.notifier)
                  .update((state) => state = location);
              ref.read(polygonsProvider.notifier).update((state) => state = gg);
            },
            child: const Text(
              'Directions',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
          )
        ],
      ),
    );
  }
}
