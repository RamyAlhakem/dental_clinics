import 'package:dental_clinics_app/clinic/features/schedule/presentation/view/screens/tab_schedule_screen.dart';
import 'package:dental_clinics_app/clinic/features/schedule/presentation/view/widgets/tab_bar_schedule.dart';
import 'package:dental_clinics_app/core/componeents/app_app_bar.dart';
import 'package:dental_clinics_app/core/extensions/lang_extension.dart';
import 'package:dental_clinics_app/core/extensions/screen_extension.dart';
import 'package:dental_clinics_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
        height: 100,
        title: context.arb.schedule,
        leading: SizedBox(),
        bottom: TabBarSchedule(controller: _tabController),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          TabScheduleScreen(
            textBtnOne: "Decline",
            textBtnTwo: "Accept",
            backgroundColorBtnOne: AppColors.whiteColor,
            foregroundColorBtnOne: AppColors.primaryColor,
          ),
          TabScheduleScreen(
            textBtnOne: "Accepted",
            textBtnTwo: "",
            backgroundColorBtnOne: AppColors.oliveColor,
            foregroundColorBtnOne: AppColors.whiteColor,
            showSecoundBtn: false,
          ),
          TabScheduleScreen(
            textBtnOne: "Declined",
            textBtnTwo: "",
            backgroundColorBtnOne: AppColors.redWineColor,
            foregroundColorBtnOne: AppColors.whiteColor,
            showSecoundBtn: false,
          ),

          TabScheduleScreen(
            textBtnOne: "Completed",
            textBtnTwo: "",
            backgroundColorBtnOne: AppColors.oliveColor,
            foregroundColorBtnOne: AppColors.whiteColor,
            showSecoundBtn: false,
            color: AppColors.backgroundColorComplete,
          ),
        ],
      ),
    );
  }
}
