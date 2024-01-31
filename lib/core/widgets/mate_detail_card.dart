import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:locate_mate/core/models/models.dart';

final selectedMateProvider = StateProvider<MateModel>((ref) {
  return mateList.first;
});

class MateDetailCard extends ConsumerWidget {
  const MateDetailCard({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedData = ref.watch(selectedMateProvider);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 15.0,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(selectedData.fullName),
        ],
      ),
    );
  }
}
