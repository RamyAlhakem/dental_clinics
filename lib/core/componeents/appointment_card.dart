import 'package:dental_clinics_app/core/componeents/appointment_buttons.dart';
import 'package:dental_clinics_app/core/componeents/button.dart';
import 'package:dental_clinics_app/core/componeents/circle_widget.dart';
import 'package:dental_clinics_app/core/extensions/screen_extension.dart';
import 'package:dental_clinics_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class AppointmentCard extends StatelessWidget {
  final Color color;
  final Color? backgroundColorBtnOne;
  final Color? foregroundColorBtnOne;
  final Color? backgroundColorBtnTwo;
  final Color? foregroundColorBtnTwo;
  final String textBtnOne;
  final String textBtnTwo;
  final bool showSecoundBtn;
  const AppointmentCard({
    super.key,
    this.backgroundColorBtnOne,
    this.foregroundColorBtnOne,
    this.backgroundColorBtnTwo,
    this.foregroundColorBtnTwo,
    required this.textBtnOne,
    required this.textBtnTwo,
    this.showSecoundBtn = true,
    this.color = AppColors.lighterPrimaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: AppColors.primaryColor),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: AppColors.darkGreyColor,
            offset: Offset(0, 3),
            blurRadius: 1,
          ),
        ],
      ),
      child: Column(
        spacing: 20,
        children: [
          Row(
            spacing: 10,
            children: [
              CircleWidget(text: "K"),
              Column(
                spacing: 5,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Khaled Alhakem",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Row(
                    spacing: 10,
                    children: [
                      Text(
                        "Date: 12/12/2026",
                        style: Theme.of(context).textTheme.labelMedium!
                            .copyWith(fontWeight: FontWeight.normal),
                      ),
                      Text(
                        "Time: 4:00 Pm",
                        style: Theme.of(context).textTheme.labelMedium!
                            .copyWith(fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Service : whiting",
                        style: Theme.of(context).textTheme.labelMedium!
                            .copyWith(color: AppColors.blackColor),
                      ),
                      // Text(
                      //   "Doctor:Dr.mhd sroji",
                      //   style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      //     color: AppColors.blackColor,
                      //   ),
                      // ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          AppointmentButtons(
            textBtnOne: textBtnOne,
            textBtnTwo: textBtnTwo,
            backgroundColorBtnOne: backgroundColorBtnOne,
            backgroundColorBtnTwo: backgroundColorBtnTwo,
            foregroundColorBtnOne: foregroundColorBtnOne,
            foregroundColorBtnTwo: foregroundColorBtnTwo,
            showSecoundBtn: showSecoundBtn,
          ),
        ],
      ),
    );
  }
}
