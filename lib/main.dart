import 'package:dental_clinics_app/core/firebase/firebase_app.dart';
import 'package:dental_clinics_app/core/global/global_services.dart';
import 'package:dental_clinics_app/dental_clinics.dart';
import 'package:flutter/material.dart';

void main() async {
  await FirebaseApp.init();
  await GlobalServices.getAppVersion();
  runApp(const DentalClinics());
}
