import 'package:dental_clinics_app/core/componeents/circle_widget.dart';
import 'package:dental_clinics_app/core/componeents/svg_widget.dart';
import 'package:dental_clinics_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class ListTilePatient extends StatelessWidget {
  const ListTilePatient({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: AppColors.whiteColor,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: AppColors.primaryColor),
        borderRadius: BorderRadius.circular(10),
      ),
      leading: CircleWidget(text: "K", horizontal: 20, vertical: 15),
      title: Text(
        "Khaled Alhakem",
        style: Theme.of(context).textTheme.bodySmall,
      ),
      subtitle: Text(
        "0999641639",
        style: Theme.of(context).textTheme.labelMedium,
      ),
      trailing: SvgWidget(icon: "call flip"),
    );
  }
}
