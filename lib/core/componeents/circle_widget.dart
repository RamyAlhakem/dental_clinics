import 'package:dental_clinics_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class CircleWidget extends StatelessWidget {
  final String text;
  final double horizontal;
  final double vertical;
  const CircleWidget({
    super.key,
    required this.text,
    this.horizontal = 30,
    this.vertical = 25,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        border: Border.all(color: AppColors.primaryColor),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Text(
        text,
        style: Theme.of(
          context,
        ).textTheme.titleLarge!.copyWith(color: AppColors.primaryColor),
      ),
    );
  }
}
