import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:locate_mate/core/models/models.dart';
import 'package:locate_mate/core/widgets/widgets.dart';

class MateListWidget extends ConsumerWidget {
  const MateListWidget({
    super.key,
    required this.mateModel,
  });
  final MateModel mateModel;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedData = ref.watch(selectedMateProvider);
    return InkWell(
      onTap: () => ref.read(selectedMateProvider.notifier).update(
            (state) => state = mateModel,
          ),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: selectedData.id == mateModel.id
                ? Colors.deepPurple
                : Colors.grey,
            width: 5,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.network(
            mateModel.image,
            fit: BoxFit.cover,
            height: 52.0,
            width: 52.0,
          ),
        ),
      ),
    );
  }
}
