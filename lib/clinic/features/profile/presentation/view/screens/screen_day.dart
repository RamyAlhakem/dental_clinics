import 'package:dental_clinics_app/clinic/features/profile/data/data_source/local_data/profile_local_data_source_imp.dart';
import 'package:dental_clinics_app/clinic/features/profile/data/models/slot_model.dart';
import 'package:dental_clinics_app/clinic/features/profile/domain/entities/day_schedule_entities.dart';
import 'package:dental_clinics_app/clinic/features/profile/domain/entities/service_entitie.dart';
import 'package:dental_clinics_app/clinic/features/profile/domain/entities/slot_entities.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/cubit/profile_state.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/view/widgets/add_another_block_button.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/view/widgets/animated_list_widget.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/view/widgets/app_bar_day.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/view/widgets/apply_widget.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/view/widgets/bottom_day_widget.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/view/widgets/duration_time_widget.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/view/widgets/turn_day_widget.dart';
import 'package:dental_clinics_app/core/componeents/app_text.dart';
import 'package:dental_clinics_app/core/extensions/screen_extension.dart';
import 'package:dental_clinics_app/core/routing/route_names.dart';
import 'package:dental_clinics_app/core/snack_bars_app/app_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ScreenDay extends StatefulWidget {
  const ScreenDay({super.key});

  @override
  State<ScreenDay> createState() => _ScreenDayState();
}

class _ScreenDayState extends State<ScreenDay> {
  late List<SlotEntities> _slots;
  late GlobalKey<AnimatedListState> _key;
  late DayScheduleEntities _day;
  DayScheduleEntities getScheduleDay() {
    final selectedDay = context.read<ProfileCubit>().state.selectedDay;
    final schedule = context.read<ProfileCubit>().state.user!.schedule;
    switch (selectedDay) {
      case WeekDays.monday:
        return schedule.monday;
      case WeekDays.tuesday:
        return schedule.tuesday;
      case WeekDays.wednesday:
        return schedule.wednesday;
      case WeekDays.thursday:
        return schedule.thursday;
      case WeekDays.friday:
        return schedule.friday;
      case WeekDays.saturday:
        return schedule.saturday;
      case WeekDays.sunday:
        return schedule.sunday;
      default:
        return schedule.monday;
    }
  }

  @override
  void initState() {
    context.getInfo();
    _day = getScheduleDay();
    context.read<ProfileCubit>().setDay(_day);
    _slots = _day.slots;
    _key = GlobalKey<AnimatedListState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is SuccessDayProfileState) {
          AppSnackBar.showSuccess(context, msg: "Day saved successfully");
          context.pushReplacementNamed(RouteNames.availableTimes);
        }
      },
      child: Scaffold(
        appBar: const AppBarDay(),
        bottomNavigationBar: BottomDayWidget(slots: _slots),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              const TurnDayWidget(),
              const SizedBox(height: 30),
              const AppText(text: "Time blocks"),
              const SizedBox(height: 10),
              AnimatedListWidget(listKey: _key, slots: _slots),

              const SizedBox(height: 20),
              AddAnotherBlockButton(
                onTap: () {
                  _slots.insert(
                    0,
                    SlotModel(
                      startTime: TimeOfDay.now().format(context),
                      endTime: TimeOfDay.now().format(context),
                    ),
                  );
                  _key.currentState!.insertItem(
                    0,
                    duration: const Duration(seconds: 1),
                  );
                },
              ),
              const SizedBox(height: 30),
              const AppText(text: "Appointment duration"),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 15,
                children: ProfileLocalDataSourceIml()
                    .getStaticDurations()
                    .map((duration) => DurationTimeWidget(duration: duration))
                    .toList(),
              ),
              const SizedBox(height: 30),
              const ApplyWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
