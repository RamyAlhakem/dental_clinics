import 'package:dental_clinics_app/core/componeents/svg_widget.dart';
import 'package:dental_clinics_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String icon;
  final bool isLoading;
  final VoidCallback? onTap;

  const HomeCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    this.isLoading = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 150,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 10,
            children: [
              Text(title),
              SvgWidget(icon: icon),
              if (isLoading)
                const SizedBox(
                  width: 30,
                  height: 30,
                  child: CircularProgressIndicator(color: AppColors.whiteColor),
                )
              else
                Text(
                  subtitle,
                  style: Theme.of(
                    context,
                  ).textTheme.headlineMedium!.copyWith(fontSize: 26),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
