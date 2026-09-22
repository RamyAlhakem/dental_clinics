import 'package:dental_clinics_app/core/componeents/button.dart';
import 'package:dental_clinics_app/core/extensions/screen_extension.dart';
import 'package:flutter/material.dart';

class AppointmentButtons extends StatelessWidget {
  final Color? backgroundColorBtnOne;
  final Color? foregroundColorBtnOne;
  final Color? backgroundColorBtnTwo;
  final Color? foregroundColorBtnTwo;
  final String textBtnOne;
  final String textBtnTwo;
  final bool showSecoundBtn;
  const AppointmentButtons({
    super.key,
    this.backgroundColorBtnOne,
    this.foregroundColorBtnOne,
    this.backgroundColorBtnTwo,
    this.foregroundColorBtnTwo,
    required this.textBtnOne,
    required this.textBtnTwo,
    this.showSecoundBtn = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 20,
      children: [
        AppButton(
          width: context.screenWidth / 2.8,
          backgroundColor: backgroundColorBtnOne,
          foregroundColor: foregroundColorBtnOne,
          text: textBtnOne,
          onPressed: () {},
        ),
        if (showSecoundBtn)
          AppButton(
            width: context.screenWidth / 2.8,
            backgroundColor: backgroundColorBtnTwo,
            foregroundColor: foregroundColorBtnTwo,
            text: textBtnTwo,
            onPressed: () {},
          ),
      ],
    );
  }
}
