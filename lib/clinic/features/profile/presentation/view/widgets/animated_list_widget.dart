import 'package:dental_clinics_app/clinic/features/profile/domain/entities/slot_entities.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/view/widgets/time_block_widget.dart';
import 'package:flutter/widgets.dart';

class AnimatedListWidget extends StatelessWidget {
  final GlobalKey<AnimatedListState> listKey;
  final List<SlotEntities> slots;
  const AnimatedListWidget({
    super.key,
    required this.listKey,
    required this.slots,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      key: listKey,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      initialItemCount: slots.length,
      itemBuilder: (context, i, animation) {
        return SizeTransition(
          sizeFactor: animation,
          child: TimeBlockWidget(
            slot: slots[i],

            removeTap: () {
              final item = slots[i];
              listKey.currentState!.removeItem(i, ((context, animation) {
                return SizeTransition(
                  sizeFactor: animation,
                  child: TimeBlockWidget(slot: item),
                );
              }), duration: Duration(seconds: 1));
              slots.removeAt(i);
            },
          ),
        );
      },
    );
  }
}
