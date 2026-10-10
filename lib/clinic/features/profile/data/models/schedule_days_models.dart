import 'package:dental_clinics_app/clinic/features/profile/data/models/day_schedule_models.dart';

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
      monday: DayScheduleModels.fromJson(json["monday"]),
      tuesday: DayScheduleModels.fromJson(json["tuesday"]),
      wednesday: DayScheduleModels.fromJson(json["wednesday"]),
      thursday: DayScheduleModels.fromJson(json["thursday"]),
      friday: DayScheduleModels.fromJson(json["friday"]),
      saturday: DayScheduleModels.fromJson(json["saturday"]),
      sunday: DayScheduleModels.fromJson(json["sunday"]),
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
