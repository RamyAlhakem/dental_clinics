import 'package:dental_clinics_app/clinic/features/profile/domain/entities/service_entitie.dart';
import 'package:dental_clinics_app/core/extensions/lang_extension.dart';
import 'package:flutter/material.dart';

extension ServiceExtension on ServiceType {
  String getTitle(BuildContext context) {
    switch (this) {
      case ServiceType.restorative:
        return context.arb.restorative;
      case ServiceType.prosthodontics:
        return context.arb.prosthodontics;
      case ServiceType.cosmeeticDentistry:
        return context.arb.cosmetic;
      case ServiceType.oralSurgery:
        return context.arb.oralSurgery;
      case ServiceType.orthodontics:
        return context.arb.orthodontics;
      case ServiceType.pedodontics:
        return context.arb.pedodontics;
      case ServiceType.preventive:
        return context.arb.preventive;
    }
  }
}
