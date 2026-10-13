import 'package:dental_clinics_app/clinic/features/profile/data/models/day_schedule_models.dart';
import 'package:dental_clinics_app/clinic/features/profile/domain/entities/day_schedule_entities.dart';

import 'package:dental_clinics_app/clinic/features/profile/domain/entities/schedule_days_entities.dart';

class ScheduleDaysModels extends ScheduleDaysEntites {
  const ScheduleDaysModels({
    super.monday,
    super.tuesday,
    super.wednesday,
    super.thursday,
    super.friday,
    super.saturday,
    super.sunday,
  });
  factory ScheduleDaysModels.fromJson(Map<String, dynamic> json) {
    return ScheduleDaysModels(
      monday: json["monday"] != null
          ? DayScheduleModels.fromJson(json["monday"])
          : const DayScheduleEntities(),
      tuesday: json["tuesday"] != null
          ? DayScheduleModels.fromJson(json["tuesday"])
          : const DayScheduleEntities(),
      wednesday: json["wednesday"] != null
          ? DayScheduleModels.fromJson(json["wednesday"])
          : const DayScheduleEntities(),
      thursday: json["thursday"] != null
          ? DayScheduleModels.fromJson(json["thursday"])
          : const DayScheduleEntities(),
      friday: json["friday"] != null
          ? DayScheduleModels.fromJson(json["friday"])
          : const DayScheduleEntities(),
      saturday: json["saturday"] != null
          ? DayScheduleModels.fromJson(json["saturday"])
          : const DayScheduleEntities(),
      sunday: json["sunday"] != null
          ? DayScheduleModels.fromJson(json["sunday"])
          : const DayScheduleEntities(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "monday": DayScheduleModels.fromEntity(monday).toJson(),
      "tuesday": DayScheduleModels.fromEntity(tuesday).toJson(),
      "wednesday": DayScheduleModels.fromEntity(wednesday).toJson(),
      "thursday": DayScheduleModels.fromEntity(thursday).toJson(),
      "friday": DayScheduleModels.fromEntity(friday).toJson(),
      "saturday": DayScheduleModels.fromEntity(saturday).toJson(),
      "sunday": DayScheduleModels.fromEntity(sunday).toJson(),
    };
  }
}
