import 'package:dental_clinics_app/core/extensions/screen_extension.dart';
import 'package:dental_clinics_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class DayWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  const DayWidget({super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth / 3.8,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        border: Border.all(color: AppColors.primaryColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium!.copyWith(color: AppColors.primaryColor),
          ),
          Text(
            subTitle,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium!.copyWith(color: AppColors.primaryColor),
          ),
        ],
      ),
    );
  }
}
