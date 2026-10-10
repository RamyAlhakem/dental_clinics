import 'package:dental_clinics_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class SelectTimeWidget extends StatelessWidget {
  final String time;
  final String title;
  final VoidCallback onTap;
  const SelectTimeWidget({
    super.key,
    required this.time,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
              title,
              style: Theme.of(
                context,
              ).textTheme.bodySmall!.copyWith(color: AppColors.iconColor),
            ),

            Text(time, style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      ),
    );
  }
}
