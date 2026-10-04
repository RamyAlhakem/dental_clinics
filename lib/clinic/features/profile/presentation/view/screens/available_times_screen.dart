import 'package:dental_clinics_app/clinic/features/profile/presentation/view/widgets/bottom_navigation_bar_available_times.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/view/widgets/day_widget.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/view/widgets/time_widget.dart';
import 'package:dental_clinics_app/core/componeents/app_app_bar.dart';
import 'package:dental_clinics_app/core/componeents/app_text.dart';
import 'package:dental_clinics_app/core/extensions/lang_extension.dart';
import 'package:flutter/material.dart';

class AvailableTimesScreen extends StatefulWidget {
  const AvailableTimesScreen({super.key});

  @override
  State<AvailableTimesScreen> createState() => _AvailableTimesScreenState();
}

class _AvailableTimesScreenState extends State<AvailableTimesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNnavigationBarAvailable(onTap: () {}),
      appBar: AppAppBar(title: context.arb.availableTimes),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            AppText(text: context.arb.daysOfTheWeek),
            SizedBox(height: 20),
            Wrap(
              alignment: WrapAlignment.center,

              spacing: 10,
              runSpacing: 10,
              children: [
                DayWidget(title: context.arb.mon, subTitle: "1"),
                DayWidget(title: context.arb.tue, subTitle: "2"),
                DayWidget(title: context.arb.wed, subTitle: "3"),
                DayWidget(title: context.arb.thu, subTitle: "4"),
                DayWidget(title: context.arb.fri, subTitle: "5"),
                DayWidget(title: context.arb.sat, subTitle: "6"),
                DayWidget(title: context.arb.sun, subTitle: "7"),
              ],
            ),
            SizedBox(height: 20),
            AppText(text: context.arb.selectAvailableTimes),
            SizedBox(height: 10),
            AppText(text: context.arb.morning),
            SizedBox(height: 10),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 10,
              runSpacing: 10,
              children: [
                TimeWidget(time: "9:00 AM"),
                TimeWidget(time: "9:30 AM"),
                TimeWidget(time: "10:00 AM"),
                TimeWidget(time: "10:30 AM"),
                TimeWidget(time: "11:00 AM"),
                TimeWidget(time: "11:30 AM"),
              ],
            ),
            SizedBox(height: 10),
            AppText(text: context.arb.evening),
            SizedBox(height: 10),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 10,
              runSpacing: 10,
              children: [
                TimeWidget(time: "12:00 PM"),
                TimeWidget(time: "12:30 PM"),
                TimeWidget(time: "1:00 PM"),
                TimeWidget(time: "1:30 PM"),
                TimeWidget(time: "2:00 PM"),
                TimeWidget(time: "2:30 PM"),
                TimeWidget(time: "3:00 PM"),
                TimeWidget(time: "3:30 PM"),
                TimeWidget(time: "4:00 PM"),
                TimeWidget(time: "4:30 PM"),
                TimeWidget(time: "5:00 PM"),
                TimeWidget(time: "5:30 PM"),
                TimeWidget(time: "6:00 PM"),
                TimeWidget(time: "6:30 PM"),
                TimeWidget(time: "7:00 PM"),
                TimeWidget(time: "7:30 PM"),
                TimeWidget(time: "8:00 PM"),
                TimeWidget(time: "8:30 PM"),
                TimeWidget(time: "9:00 PM"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
