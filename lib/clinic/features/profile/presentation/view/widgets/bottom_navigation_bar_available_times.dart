import 'package:dental_clinics_app/core/componeents/app_button_gredient.dart';
import 'package:dental_clinics_app/core/componeents/button.dart';
import 'package:dental_clinics_app/core/extensions/lang_extension.dart';
import 'package:dental_clinics_app/core/extensions/screen_extension.dart';
import 'package:dental_clinics_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class BottomNnavigationBarAvailable extends StatelessWidget {
  const BottomNnavigationBarAvailable({super.key});

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
              onPressed: () {},
              text: context.arb.previous,
              width: context.screenWidth / 2.5,
            ),
            AppButtonGredient(
              width: context.screenWidth / 2.5,
              text: context.arb.save,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
