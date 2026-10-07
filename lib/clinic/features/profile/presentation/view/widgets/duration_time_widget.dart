import 'package:dental_clinics_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class DurationTimeWidget extends StatelessWidget {
  const DurationTimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        border: Border.all(color: AppColors.primaryColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        "15m",
        style: Theme.of(
          context,
        ).textTheme.bodyMedium!.copyWith(color: AppColors.primaryColor),
      ),
    );
  }
}
