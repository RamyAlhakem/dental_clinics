import 'dart:math';

import 'package:dental_clinics_app/clinic/features/profile/data/models/slot_model.dart';
import 'package:dental_clinics_app/clinic/features/profile/domain/entities/day_schedule_entities.dart';

class DayScheduleModels extends DayScheduleEntities {
  const DayScheduleModels({
    super.isEnabled,
    super.slots,
    super.appointmentDuration,
  });

  factory DayScheduleModels.fromJson(Map<String, dynamic> json) {
    return DayScheduleModels(
      isEnabled: json['isEnabled'] as bool,
      appointmentDuration: json['appointmentDuration'] as String,
      slots: (json['slots'] as List).map((e) => SlotModel.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'isEnabled': isEnabled,
      'slots': slots
          .map((slot) => SlotModel.fromEntity(slot).toJson())
          .toList(),
      'appointmentDuration': appointmentDuration,
    };
  }

  factory DayScheduleModels.fromEntity(DayScheduleEntities entity) {
    return DayScheduleModels(
      isEnabled: entity.isEnabled,
      slots: entity.slots,
      appointmentDuration: entity.appointmentDuration,
    );
  }
}
