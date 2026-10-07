import 'package:dental_clinics_app/clinic/features/profile/presentation/view/widgets/add_another_block_button.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/view/widgets/apply_widget.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/view/widgets/bottom_navigation_bar_available_times.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/view/widgets/duration_time_widget.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/view/widgets/time_block_widget.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/view/widgets/turn_day_widget.dart';
import 'package:dental_clinics_app/core/componeents/app_app_bar.dart';
import 'package:dental_clinics_app/core/componeents/app_text.dart';

import 'package:flutter/material.dart';

class ScreenDay extends StatefulWidget {
  const ScreenDay({super.key});

  @override
  State<ScreenDay> createState() => _ScreenDayState();
}

class _ScreenDayState extends State<ScreenDay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(title: "MON"),
      bottomNavigationBar: BottomNnavigationBarAvailable(onTap: () {}),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            TurnDayWidget(),
            SizedBox(height: 30),
            AppText(text: "Time blocks"),
            SizedBox(height: 10),
            TimeBlockWidget(),
            SizedBox(height: 20),
            AddAnotherBlockButton(),
            SizedBox(height: 30),
            AppText(text: "Appointment duration"),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 15,
              children: [
                DurationTimeWidget(),
                DurationTimeWidget(),
                DurationTimeWidget(),
                DurationTimeWidget(),
                DurationTimeWidget(),
              ],
            ),
            SizedBox(height: 30),
            ApplyWidget(),
          ],
        ),
      ),
    );
  }
}
