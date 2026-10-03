import 'package:dental_clinics_app/clinic/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/cubit/profile_state.dart';
import 'package:dental_clinics_app/core/componeents/app_text.dart';
import 'package:dental_clinics_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServiceStatusWidget extends StatelessWidget {
  const ServiceStatusWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText(text: "Service Status"),
        BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            return Row(
              children: [
                if (state.isEnabled)
                  Text(
                    "Enabled",
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: AppColors.oliveColor,
                    ),
                  )
                else
                  Text(
                    "Disabled",
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: AppColors.redColor,
                    ),
                  ),

                Switch(
                  value: state.isEnabled,
                  onChanged: (val) {
                    context.read<ProfileCubit>().changeSwitch(val);
                  },
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
