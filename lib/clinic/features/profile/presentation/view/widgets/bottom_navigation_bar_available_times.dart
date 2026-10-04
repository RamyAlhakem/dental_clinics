import 'package:dental_clinics_app/core/componeents/app_button_gredient.dart';
import 'package:dental_clinics_app/core/componeents/button.dart';
import 'package:dental_clinics_app/core/extensions/lang_extension.dart';
import 'package:dental_clinics_app/core/extensions/screen_extension.dart';

import 'package:dental_clinics_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

class BottomNnavigationBarAvailable extends StatelessWidget {
  final bool isLoading;
  final VoidCallback onTap;
  const BottomNnavigationBarAvailable({
    super.key,
    required this.onTap,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [
            AppButton(
              backgroundColor: AppColors.whiteColor,
              foregroundColor: AppColors.primaryColor,
              onPressed: () => context.pop(),
              text: context.arb.previous,
              width: context.screenWidth / 2.5,
            ),
            AppButtonGredient(
              isLoading: isLoading,
              width: context.screenWidth / 2.5,
              text: context.arb.save,
              onTap: onTap,
            ),
          ],
        ),
      ),
    );
  }
}
