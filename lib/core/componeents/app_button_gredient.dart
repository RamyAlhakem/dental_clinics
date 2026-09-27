import 'package:dental_clinics_app/core/extensions/screen_extension.dart';
import 'package:dental_clinics_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class AppButtonGredient extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final double? horizontal;
  final double? width;
  final bool isLoading;
  const AppButtonGredient({
    super.key,
    required this.text,
    required this.onTap,
    this.horizontal,
    this.width,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: horizontal ?? 0),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: width ?? context.screenWidth / 1.2,
        height: 45,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.scoundryColor,
              AppColors.primaryColor,
              AppColors.darkPrimary,
            ],
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: isLoading
            ? SizedBox(
                width: 20,
                height: 20,
                child: Center(
                  child: CircularProgressIndicator(color: AppColors.whiteColor),
                ),
              )
            : Text(
                text,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
      ),
    );
  }
}
