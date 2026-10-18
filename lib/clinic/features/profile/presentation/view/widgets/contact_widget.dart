import 'package:dental_clinics_app/core/componeents/svg_widget.dart';
import 'package:dental_clinics_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class ContactWidget extends StatelessWidget {
  final String title;
  final String icon;
  final VoidCallback onTap;
  const ContactWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          border: Border.all(color: AppColors.primaryColor),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          spacing: 10,
          children: [
            SvgWidget(icon: icon),
            Text(title, style: Theme.of(context).textTheme.labelMedium),
          ],
        ),
      ),
    );
  }
}
