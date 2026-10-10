import 'package:dental_clinics_app/clinic/features/profile/domain/entities/slot_entities.dart';

class DayScheduleEntities {
  final bool isEnabled;
  final List<SlotEntities> slots;
  const DayScheduleEntities({this.isEnabled = false, this.slots = const []});
}
