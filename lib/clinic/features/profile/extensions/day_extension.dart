import 'package:dental_clinics_app/clinic/features/profile/domain/entities/service_entitie.dart';
import 'package:dental_clinics_app/core/extensions/lang_extension.dart';
import 'package:flutter/material.dart';

extension DayExtension on WeekDays {
  String getTitle(BuildContext context) {
    switch (this) {
      case WeekDays.monday:
        return context.arb.mon;
      case WeekDays.tuesday:
        return context.arb.tue;
      case WeekDays.wednesday:
        return context.arb.wed;
      case WeekDays.thursday:
        return context.arb.thu;
      case WeekDays.friday:
        return context.arb.fri;
      case WeekDays.saturday:
        return context.arb.sat;
      case WeekDays.sunday:
        return context.arb.sun;
    }
  }
}
