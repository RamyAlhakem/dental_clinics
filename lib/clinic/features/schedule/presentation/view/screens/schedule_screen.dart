import 'package:dental_clinics_app/clinic/features/schedule/presentation/cubit/schedule_cubit.dart';
import 'package:dental_clinics_app/clinic/features/schedule/presentation/cubit/schedule_state.dart';
import 'package:dental_clinics_app/clinic/features/schedule/presentation/view/screens/tab_schedule_screen.dart';
import 'package:dental_clinics_app/clinic/features/schedule/presentation/view/widgets/tab_bar_schedule.dart';
import 'package:dental_clinics_app/core/componeents/app_app_bar.dart';
import 'package:dental_clinics_app/core/extensions/lang_extension.dart';
import 'package:dental_clinics_app/core/global/global_services.dart';
import 'package:dental_clinics_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    context.read<ScheduleCubit>().getAppointments(
      role: GlobalServices.role,
      docId: GlobalServices.user.docId,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
        height: 100,
        title: context.arb.schedule,
        leading: const SizedBox(),
        bottom: TabBarSchedule(controller: _tabController),
      ),
      body: BlocBuilder<ScheduleCubit, ScheduleState>(
        builder: (context, state) {
          if (state is ScheduleLoading) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.primaryColor),
            );
          } else if (state is ScheduleLoaded) {
            return TabBarView(
              controller: _tabController,
              children: [
                TabScheduleScreen(
                  appointments: state.pendingAppointments,
                  textBtnOne: "Decline",
                  textBtnTwo: "Accept",
                  backgroundColorBtnOne: AppColors.whiteColor,
                  foregroundColorBtnOne: AppColors.primaryColor,
                ),
                TabScheduleScreen(
                  appointments: state.acceptedAppointments,
                  textBtnOne: "Accepted",
                  textBtnTwo: "",
                  backgroundColorBtnOne: AppColors.oliveColor,
                  foregroundColorBtnOne: AppColors.whiteColor,
                  showSecoundBtn: false,
                ),
                TabScheduleScreen(
                  appointments: state.declinedAppointments,
                  textBtnOne: "Declined",
                  textBtnTwo: "",
                  backgroundColorBtnOne: AppColors.redWineColor,
                  foregroundColorBtnOne: AppColors.whiteColor,
                  showSecoundBtn: false,
                ),

                TabScheduleScreen(
                  appointments: state.completedAppointments,
                  textBtnOne: "Completed",
                  textBtnTwo: "",
                  backgroundColorBtnOne: AppColors.oliveColor,
                  foregroundColorBtnOne: AppColors.whiteColor,
                  showSecoundBtn: false,
                  color: AppColors.backgroundColorComplete,
                ),
              ],
            );
          } else {
            return const Center(child: Text('Error'));
          }
        },
      ),
    );
  }
}
