import 'package:dental_clinics_app/clinic/features/patients/presentation/view/widgets/list_tile_patient.dart';
import 'package:dental_clinics_app/core/componeents/app_app_bar.dart';
import 'package:dental_clinics_app/core/extensions/lang_extension.dart';
import 'package:flutter/material.dart';

class PatientsScreen extends StatefulWidget {
  const PatientsScreen({super.key});

  @override
  State<PatientsScreen> createState() => _PatientsScreenState();
}

class _PatientsScreenState extends State<PatientsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(title: context.arb.patients, leading: const SizedBox()),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.separated(
          itemCount: 10,
          separatorBuilder: (context, i) => const SizedBox(height: 20),
          itemBuilder: (context, i) => const ListTilePatient(),
        ),
      ),
    );
  }
}
