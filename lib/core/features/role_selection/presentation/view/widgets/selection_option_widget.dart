import 'package:dental_clinics_app/core/extensions/screen_extension.dart';
import 'package:dental_clinics_app/core/features/role_selection/presentation/cubit/role_cubit.dart';
import 'package:dental_clinics_app/core/features/role_selection/presentation/cubit/role_state.dart';
import 'package:dental_clinics_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class SelectionOptionWidget extends StatelessWidget {
  final Roles role;
  final String title;
  final String icon;
  final VoidCallback onTap;
  const SelectionOptionWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    required this.role,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RoleCubit, RoleState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: onTap,
          child: Container(
            width: context.screenWidth / 1.3,
            height: context.screenHeight / 5,
            decoration: BoxDecoration(
              color: state.selectedRole == null
                  ? AppColors.whiteColor
                  : state.selectedRole == role
                  ? AppColors.primaryColor
                  : AppColors.whiteColor,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: AppColors.primaryColor),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/icons/$icon.svg",
                  color: state.selectedRole == null
                      ? AppColors.iconColor
                      : state.selectedRole == role
                      ? AppColors.whiteColor
                      : AppColors.iconColor,
                ),
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: state.selectedRole == null
                        ? AppColors.primaryColor
                        : state.selectedRole == role
                        ? AppColors.whiteColor
                        : AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
