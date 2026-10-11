import 'package:dental_clinics_app/clinic/features/profile/data/data_source/local_data/profile_local_data_source_imp.dart';
import 'package:dental_clinics_app/clinic/features/profile/data/models/schedule_days_models.dart';
import 'package:dental_clinics_app/clinic/features/profile/data/models/slot_model.dart';
import 'package:dental_clinics_app/clinic/features/profile/domain/entities/day_schedule_entities.dart';
import 'package:dental_clinics_app/clinic/features/profile/domain/entities/slot_entities.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/view/widgets/add_another_block_button.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/view/widgets/apply_widget.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/view/widgets/bottom_navigation_bar_available_times.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/view/widgets/duration_time_widget.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/view/widgets/time_block_widget.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/view/widgets/turn_day_widget.dart';
import 'package:dental_clinics_app/core/componeents/app_app_bar.dart';
import 'package:dental_clinics_app/core/componeents/app_text.dart';
import 'package:dental_clinics_app/core/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:dental_clinics_app/core/features/role_selection/presentation/cubit/role_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenDay extends StatefulWidget {
  const ScreenDay({super.key});

  @override
  State<ScreenDay> createState() => _ScreenDayState();
}

class _ScreenDayState extends State<ScreenDay> {
  List<SlotEntities> _slots = [];
  GlobalKey<AnimatedListState> _key = GlobalKey<AnimatedListState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(title: "MON"),
      bottomNavigationBar: BottomNnavigationBarAvailable(
        onTap: () {
          final role = context.read<RoleCubit>().state.selectedRole;
          final state = context.read<ProfileCubit>().state;
          context.read<ProfileCubit>().saveDay(
            role: role!.name,
            docId: state.user!.docId,
            scheduleDay: ScheduleDaysModels(
              monday: DayScheduleEntities(
                isEnabled: state.enabledDay,
                slots: _slots,
              ),
            ),
          );
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            TurnDayWidget(),
            SizedBox(height: 30),
            AppText(text: "Time blocks"),
            SizedBox(height: 10),
            AnimatedList(
              key: _key,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              initialItemCount: _slots.length,
              itemBuilder: (context, i, animation) {
                return SizeTransition(
                  sizeFactor: animation,
                  child: TimeBlockWidget(slot: _slots[i]),
                );
              },
            ),
            // TimeBlockWidget(),
            SizedBox(height: 20),
            AddAnotherBlockButton(
              onTap: () {
                _slots.insert(
                  0,
                  SlotEntities(
                    startTime: TimeOfDay.now().format(context),
                    endTime: TimeOfDay.now().format(context),
                  ),
                );
                _key.currentState!.insertItem(
                  0,
                  duration: Duration(seconds: 1),
                );
              },
            ),
            SizedBox(height: 30),
            AppText(text: "Appointment duration"),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 15,
              children: ProfileLocalDataSourceIml()
                  .getStaticDurations()
                  .map((duration) => DurationTimeWidget(duration: duration))
                  .toList(),
            ),
            SizedBox(height: 30),
            ApplyWidget(),
          ],
        ),
      ),
    );
  }
}
