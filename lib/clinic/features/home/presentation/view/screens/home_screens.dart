import 'package:dental_clinics_app/clinic/features/home/presentation/view/widgets/app_bar_home.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:dental_clinics_app/clinic/features/home/presentation/view/widgets/home_card.dart';
import 'package:dental_clinics_app/clinic/features/home/presentation/view/widgets/next_appointments_widget.dart';
import 'package:dental_clinics_app/core/componeents/appointment_card.dart';
import 'package:dental_clinics_app/core/extensions/lang_extension.dart';
import 'package:dental_clinics_app/core/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:dental_clinics_app/core/features/auth/presentation/cubit/auth_state.dart';
import 'package:dental_clinics_app/core/features/role_selection/presentation/cubit/role_cubit.dart';
import 'package:dental_clinics_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _getInfo() {
    final state = context.read<AuthCubit>().state;
    final role = context.read<RoleCubit>().state.selectedRole;
    if (state is AuthSuccessState) {
      context.read<ProfileCubit>().getInfo(
        role: role!.name,
        userId: state.user.id,
      );
    }
  }

  @override
  void initState() {
    _getInfo();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBarHome(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          spacing: 20,
          children: [
            Row(
              spacing: 20,
              children: [
                HomeCard(
                  title: context.arb.inquiries,
                  subtitle: "25",
                  icon: "help_clinic",
                ),
                HomeCard(
                  title: context.arb.appointments,
                  subtitle: "25",
                  icon: "calendar_clock_bigger",
                ),
              ],
            ),
            NextAppointmentsWidget(),
            AppointmentCard(
              textBtnOne: context.arb.complete,
              textBtnTwo: context.arb.edit,
              backgroundColorBtnOne: AppColors.whiteColor,
              foregroundColorBtnOne: AppColors.primaryColor,
            ),
            AppointmentCard(
              textBtnOne: context.arb.complete,
              textBtnTwo: context.arb.edit,
              backgroundColorBtnOne: AppColors.whiteColor,
              foregroundColorBtnOne: AppColors.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
