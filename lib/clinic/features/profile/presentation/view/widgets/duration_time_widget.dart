import 'package:dental_clinics_app/clinic/features/profile/domain/entities/service_entitie.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/cubit/profile_state.dart';
import 'package:dental_clinics_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DurationTimeWidget extends StatelessWidget {
  final AppointmentDuration duration;
  const DurationTimeWidget({super.key, required this.duration});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            context.read<ProfileCubit>().selectDuration(duration);
          },
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: state.selectedDuration == duration
                  ? AppColors.primaryColor
                  : AppColors.whiteColor,
              border: Border.all(color: AppColors.primaryColor),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              duration.label,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: state.selectedDuration == duration
                    ? AppColors.whiteColor
                    : AppColors.primaryColor,
              ),
            ),
          ),
        );
      },
    );
  }
}
