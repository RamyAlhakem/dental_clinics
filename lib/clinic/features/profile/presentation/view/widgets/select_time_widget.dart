import 'package:dental_clinics_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class SelectTimeWidget extends StatelessWidget {
  const SelectTimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.lighterPrimaryColor.withValues(alpha: 0.2),
        border: Border.all(color: AppColors.primaryColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        spacing: 5,
        children: [
          Text(
            "Start",
            style: Theme.of(
              context,
            ).textTheme.bodySmall!.copyWith(color: AppColors.iconColor),
          ),

          Text("9:00 AM", style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }
}
