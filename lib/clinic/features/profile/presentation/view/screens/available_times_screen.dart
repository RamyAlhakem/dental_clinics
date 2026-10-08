import 'package:dental_clinics_app/clinic/features/profile/data/data_source/local_data/profile_local_data_source_imp.dart';
import 'package:dental_clinics_app/clinic/features/profile/extensions/day_extension.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/view/widgets/day_widget.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/view/widgets/time_widget.dart';
import 'package:dental_clinics_app/core/componeents/app_app_bar.dart';
import 'package:dental_clinics_app/core/componeents/app_text.dart';
import 'package:dental_clinics_app/core/componeents/svg_widget.dart';
import 'package:dental_clinics_app/core/extensions/lang_extension.dart';
import 'package:dental_clinics_app/core/routing/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AvailableTimesScreen extends StatefulWidget {
  const AvailableTimesScreen({super.key});

  @override
  State<AvailableTimesScreen> createState() => _AvailableTimesScreenState();
}

class _AvailableTimesScreenState extends State<AvailableTimesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pushNamed(RouteNames.screenDay);
        },
        child: SvgWidget(icon: "add"),
      ),
      // bottomNavigationBar: BottomNnavigationBarAvailable(onTap: () {}),
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
              children: ProfileLocalDataSourceIml()
                  .getStaticWeekDays()
                  .map(
                    (day) => DayWidget(
                      title: day.getTitle(context),
                      subTitle: "1",
                      onTap: () {
                        context.read<ProfileCubit>().selectDay(day);
                      },
                    ),
                  )
                  .toList(),
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
