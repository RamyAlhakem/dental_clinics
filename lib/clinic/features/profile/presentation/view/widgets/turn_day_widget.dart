import 'package:dental_clinics_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class TurnDayWidget extends StatelessWidget {
  const TurnDayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.lighterPrimaryColor,
      child: ListTile(
        title: Text(
          "Open on Mondays",
          style: Theme.of(context).textTheme.bodySmall,
        ),
        subtitle: Text(
          "Patients can book this day",
          style: Theme.of(context).textTheme.labelMedium,
        ),
        trailing: Switch(value: false, onChanged: (val) {}),
      ),
    );
  }
}
