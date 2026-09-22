import 'package:dental_clinics_app/core/componeents/appointment_card.dart';
import 'package:dental_clinics_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class TabScheduleScreen extends StatefulWidget {
  final Color color;
  final Color? backgroundColorBtnOne;
  final Color? foregroundColorBtnOne;
  final Color? backgroundColorBtnTwo;
  final Color? foregroundColorBtnTwo;
  final String textBtnOne;
  final String textBtnTwo;
  final bool showSecoundBtn;
  const TabScheduleScreen({
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
  State<TabScheduleScreen> createState() => _TabScheduleScreenState();
}

class _TabScheduleScreenState extends State<TabScheduleScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ListView.separated(
        itemCount: 7,
        separatorBuilder: (context, index) => SizedBox(height: 15),
        itemBuilder: (context, i) => AppointmentCard(
          color: widget.color,
          textBtnOne: widget.textBtnOne,
          textBtnTwo: widget.textBtnTwo,
          backgroundColorBtnOne: widget.backgroundColorBtnOne,
          foregroundColorBtnOne: widget.foregroundColorBtnOne,
          backgroundColorBtnTwo: widget.backgroundColorBtnTwo,
          foregroundColorBtnTwo: widget.foregroundColorBtnTwo,
          showSecoundBtn: widget.showSecoundBtn,
        ),
      ),
    );
  }
}
