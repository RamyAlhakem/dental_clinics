import 'package:dental_clinics_app/clinic/features/profile/domain/entities/slot_entities.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/cubit/profile_state.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/view/widgets/select_time_widget.dart';
import 'package:dental_clinics_app/core/componeents/svg_widget.dart';
import 'package:dental_clinics_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimeBlockWidget extends StatelessWidget {
  final SlotEntities slot;
  const TimeBlockWidget({super.key, required this.slot});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        border: Border.all(color: AppColors.primaryColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: AppColors.lighterPrimaryColor.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  "Morning",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
              Text(
                "Remove",
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge!.copyWith(color: AppColors.redWineColor),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            spacing: 30,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<ProfileCubit, ProfileState>(
                builder: (context, state) {
                  return SelectTimeWidget(
                    title: "Start",
                    time: slot.startTime,
                    onTap: () {
                      _showTimeStart(context, slot);
                    },
                  );
                },
              ),
              SvgWidget(icon: "line"),
              BlocBuilder<ProfileCubit, ProfileState>(
                builder: (context, state) {
                  return SelectTimeWidget(
                    title: "End",
                    time: slot.endTime,
                    onTap: () {
                      _showTimeEnd(context, slot);
                    },
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

_showTimeStart(BuildContext context, SlotEntities slot) async {
  final cubit = context.read<ProfileCubit>();
  final time = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
  );
  if (time != null) {
    slot.startTime = time.format(context);
    cubit.setStartTime();
  }
}

_showTimeEnd(BuildContext context, SlotEntities slot) async {
  final cubit = context.read<ProfileCubit>();
  final time = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
  );
  if (time != null) {
    slot.endTime = time.format(context);
    cubit.setEndTime();
  }
}
