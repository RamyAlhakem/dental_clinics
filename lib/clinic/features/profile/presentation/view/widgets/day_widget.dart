import 'package:dental_clinics_app/clinic/features/profile/extensions/day_extension.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/cubit/profile_state.dart';
import 'package:dental_clinics_app/core/extensions/screen_extension.dart';
import 'package:dental_clinics_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DayWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  final VoidCallback onTap;
  const DayWidget({
    super.key,
    required this.title,
    required this.subTitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: onTap,
          child: Container(
            width: context.screenWidth / 3.8,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: state.selectedDay == null
                  ? AppColors.whiteColor
                  : state.selectedDay!.getTitle(context) == title
                  ? AppColors.primaryColor
                  : AppColors.whiteColor,
              border: Border.all(color: AppColors.primaryColor),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: state.selectedDay == null
                        ? AppColors.primaryColor
                        : state.selectedDay!.getTitle(context) == title
                        ? AppColors.whiteColor
                        : AppColors.primaryColor,
                  ),
                ),
                // Text(
                //   subTitle,
                //   style: Theme.of(
                //     context,
                //   ).textTheme.bodyMedium!.copyWith(color: AppColors.primaryColor),
                // ),
              ],
            ),
          ),
        );
      },
    );
  }
}
