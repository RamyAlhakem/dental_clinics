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
}
