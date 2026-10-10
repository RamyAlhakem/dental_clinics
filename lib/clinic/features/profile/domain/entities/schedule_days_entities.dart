import 'package:dental_clinics_app/clinic/features/profile/domain/entities/day_schedule_entities.dart';

class ScheduleDaysEntites {
  final DayScheduleEntities monday;
  final DayScheduleEntities tuesday;
  final DayScheduleEntities wednesday;
  final DayScheduleEntities thursday;
  final DayScheduleEntities friday;
  final DayScheduleEntities saturday;
  final DayScheduleEntities sunday;
  const ScheduleDaysEntites({
    this.monday = const DayScheduleEntities(),
    this.tuesday = const DayScheduleEntities(),
    this.wednesday = const DayScheduleEntities(),
    this.thursday = const DayScheduleEntities(),
    this.friday = const DayScheduleEntities(),
    this.saturday = const DayScheduleEntities(),
    this.sunday = const DayScheduleEntities(),
  });
  @override
  String toString() =>
      'ScheduleDaysEntites(monday: $monday, tuesday: $tuesday, wednesday: $wednesday, thursday: $thursday, friday: $friday, saturday: $saturday, sunday: $sunday)';
}
