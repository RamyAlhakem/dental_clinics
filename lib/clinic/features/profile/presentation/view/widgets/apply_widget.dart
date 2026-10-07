import 'package:dental_clinics_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class ApplyWidget extends StatelessWidget {
  const ApplyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: AppColors.lighterPrimaryColor.withValues(alpha: 0.5),
      child: ListTile(
        title: Text(
          "Apply to all days",
          style: Theme.of(
            context,
          ).textTheme.bodySmall!.copyWith(color: AppColors.primaryColor),
        ),
        subtitle: Text(
          "Mon–Fri will use this same schedule",
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.normal,
          ),
        ),
        leading: Checkbox(value: true, onChanged: (val) {}),
      ),
    );
  }
}
