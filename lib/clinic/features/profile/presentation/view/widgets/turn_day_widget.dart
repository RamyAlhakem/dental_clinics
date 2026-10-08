import 'package:dental_clinics_app/clinic/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/cubit/profile_state.dart';
import 'package:dental_clinics_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TurnDayWidget extends StatelessWidget {
  const TurnDayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.lighterPrimaryColor,
      child: ListTile(
        title: Text(
          "Open on Mondays",
          style: Theme.of(context).textTheme.bodySmall,
        ),
        subtitle: Text(
          "Patients can book this day",
          style: Theme.of(context).textTheme.labelMedium,
        ),
        trailing: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            return Switch(
              value: state.enabledDay,
              onChanged: (val) {
                context.read<ProfileCubit>().changeEnabledDay(val);
              },
            );
          },
        ),
      ),
    );
  }
}
