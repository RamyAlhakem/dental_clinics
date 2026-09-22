import 'package:dental_clinics_app/core/componeents/svg_widget.dart';
import 'package:dental_clinics_app/core/extensions/screen_extension.dart';
import 'package:dental_clinics_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class ServicesWidget extends StatelessWidget {
  final String service;
  const ServicesWidget({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth / 2.5,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        border: Border.all(color: AppColors.primaryColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        spacing: 10,
        children: [
          SvgWidget(icon: "dentistry"),
          Text(
            service,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: AppColors.primaryColor,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
