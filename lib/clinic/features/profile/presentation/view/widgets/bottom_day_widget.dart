import 'package:dental_clinics_app/clinic/features/profile/data/models/day_schedule_models.dart';
import 'package:dental_clinics_app/clinic/features/profile/data/models/schedule_days_models.dart';
import 'package:dental_clinics_app/clinic/features/profile/domain/entities/day_schedule_entities.dart';
import 'package:dental_clinics_app/clinic/features/profile/domain/entities/slot_entities.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/cubit/profile_state.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/view/widgets/bottom_navigation_bar_available_times.dart';
import 'package:dental_clinics_app/core/features/role_selection/presentation/cubit/role_cubit.dart';
import 'package:dental_clinics_app/core/snack_bars_app/app_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomDayWidget extends StatelessWidget {
  final List<SlotEntities> slots;

  const BottomDayWidget({super.key, required this.slots});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is LoadingUserInfoProfileState) {
          return BottomNnavigationBarAvailable(isLoading: true, onTap: () {});
        } else {
          return BottomNnavigationBarAvailable(
            onTap: () {
              _saveDay(context, slots: slots);
            },
          );
        }
      },
    );
  }
}

_saveDay(BuildContext context, {required List<SlotEntities> slots}) {
  if (slots.isEmpty) {
    AppSnackBar.showError(context, msg: "Please add time block first");
  } else {
    final role = context.read<RoleCubit>().state.selectedRole;
    final state = context.read<ProfileCubit>().state;
    final daySchedule = DayScheduleModels(
      isEnabled: state.enabledDay,
      slots: slots,
      appointmentDuration: state.selectedDuration!.label,
    );
    final scheduleDay = ScheduleDaysModels(
      monday: daySchedule,
      tuesday: daySchedule,
      wednesday: daySchedule,
      thursday: daySchedule,
      friday: daySchedule,
      saturday: daySchedule,
      sunday: daySchedule,
    );
    final currentday = state.selectedDay!.name;
    if (state.applyAll) {
      context.read<ProfileCubit>().saveDay(
        role: role!.name,
        docId: state.user!.docId,
        scheduleDay: scheduleDay,
      );
    } else {
      context.read<ProfileCubit>().saveSingleDay(
        role: role!.name,
        docId: state.user!.docId,
        day: daySchedule,
        dayKey: currentday,
      );
    }
  }
}
