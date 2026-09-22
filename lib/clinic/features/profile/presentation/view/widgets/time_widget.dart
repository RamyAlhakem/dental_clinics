import 'package:dental_clinics_app/core/extensions/screen_extension.dart';
import 'package:dental_clinics_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class TimeWidget extends StatelessWidget {
  final String time;
  const TimeWidget({super.key, required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: context.screenWidth / 2.6,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        border: Border.all(color: AppColors.primaryColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        time,
        style: Theme.of(
          context,
        ).textTheme.bodyLarge!.copyWith(color: AppColors.primaryColor),
      ),
    );
  }
}
