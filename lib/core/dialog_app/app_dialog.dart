import 'package:dental_clinics_app/core/componeents/button.dart';
import 'package:dental_clinics_app/core/extensions/screen_extension.dart';
import 'package:dental_clinics_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AppDialog {
  static _show(
    BuildContext context, {
    required String title,
    required String subTitle,
    required String icon,
    required String textBtn,
    required VoidCallback onPressed,
    double? width,
    double? height,
    BoxFit? fit,
    bool repeat = false,
  }) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Lottie.asset(
                "assets/lottie/$icon.json",
                repeat: repeat,
                width: width,
                height: height,
                fit: fit,
              ),
              Text(title, style: Theme.of(context).textTheme.bodySmall),
              SizedBox(height: 10),
              Text(
                subTitle,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 20),
              AppButton(
                onPressed: onPressed,
                text: textBtn,
                width: context.screenWidth / 2,
              ),
            ],
          ),
        ),
      ),
    );
  }

  static showSuccess(
    BuildContext context, {
    required String title,
    required String subTitle,
    required String textBtn,
    required VoidCallback onPressed,
    double? width,
    double? height,
    BoxFit? fit,
    bool repeat = false,
  }) {
    _show(
      context,
      title: title,
      subTitle: subTitle,
      icon: "Done",
      textBtn: textBtn,
      onPressed: onPressed,
      width: width,
      height: height,
      fit: fit,
      repeat: repeat,
    );
  }

  static showError(
    BuildContext context, {
    required String title,
    required String subTitle,
    required String textBtn,
    required VoidCallback onPressed,
    double? width,
    double? height,
    BoxFit? fit,
    bool repeat = false,
  }) {
    _show(
      context,
      title: title,
      subTitle: subTitle,
      icon: "Error",
      textBtn: textBtn,
      onPressed: onPressed,
      width: width,
      height: height,
      fit: fit,
      repeat: repeat,
    );
  }

  static showWarning(
    BuildContext context, {
    required String title,
    required String subTitle,
    required String textBtn,
    required VoidCallback onPressed,
    double? width,
    double? height,
    BoxFit? fit,
    bool repeat = false,
  }) {
    _show(
      context,
      title: title,
      subTitle: subTitle,
      icon: "Warning",
      textBtn: textBtn,
      onPressed: onPressed,
      width: width,
      height: height,
      fit: fit,
      repeat: repeat,
    );
  }

  static showReset(
    BuildContext context, {
    required String title,
    required String subTitle,
    required String textBtn,
    required VoidCallback onPressed,
    double? width,
    double? height,
    BoxFit? fit,
    bool repeat = false,
  }) {
    _show(
      context,
      title: title,
      subTitle: subTitle,
      icon: "email",
      textBtn: textBtn,
      onPressed: onPressed,
      width: width,
      height: height,
      fit: fit,
      repeat: repeat,
    );
  }
}
