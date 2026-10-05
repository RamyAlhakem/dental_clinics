import 'package:dental_clinics_app/clinic/features/profile/domain/entities/service_entitie.dart';
import 'package:dental_clinics_app/core/extensions/lang_extension.dart';
import 'package:flutter/material.dart';

extension StringExtension on String {
  String getTitle(BuildContext context) {
    switch (this) {
      case "restorative":
        return context.arb.restorative;
      case "prosthodontics":
        return context.arb.prosthodontics;
      case "cosmeeticDentistry":
        return context.arb.cosmetic;
      case "oralSurgery":
        return context.arb.oralSurgery;
      case "orthodontics":
        return context.arb.orthodontics;
      case "pedodontics":
        return context.arb.pedodontics;
      case "preventive":
        return context.arb.preventive;
      default:
        return this;
    }
  }

  ServiceType getService() {
    switch (this) {
      case "restorative":
        return ServiceType.restorative;
      case "prosthodontics":
        return ServiceType.prosthodontics;
      case "cosmeeticDentistry":
        return ServiceType.cosmeeticDentistry;
      case "oralSurgery":
        return ServiceType.oralSurgery;
      case "orthodontics":
        return ServiceType.orthodontics;
      case "pedodontics":
        return ServiceType.pedodontics;
      case "preventive":
        return ServiceType.preventive;
      default:
        return ServiceType.preventive;
    }
  }
}
