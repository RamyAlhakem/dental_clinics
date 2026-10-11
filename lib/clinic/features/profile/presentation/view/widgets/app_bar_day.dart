import 'package:dental_clinics_app/clinic/features/profile/extensions/day_extension.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/cubit/profile_state.dart';
import 'package:dental_clinics_app/core/componeents/app_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBarDay extends StatelessWidget implements PreferredSizeWidget {
  const AppBarDay({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return AppAppBar(title: state.selectedDay!.getTitle(context));
      },
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60);
}
