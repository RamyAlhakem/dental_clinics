import 'package:dental_clinics_app/clinic/features/home/presentation/cubit/home_cubit.dart';
import 'package:dental_clinics_app/clinic/features/home/presentation/cubit/home_state.dart';
import 'package:dental_clinics_app/clinic/features/home/presentation/view/widgets/app_bar_home.dart';
import 'package:dental_clinics_app/clinic/features/home/presentation/view/widgets/home_card.dart';
import 'package:dental_clinics_app/clinic/features/home/presentation/view/widgets/next_appointments_widget.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/cubit/profile_state.dart';
import 'package:dental_clinics_app/clinic/features/schedule/presentation/cubit/schedule_cubit.dart';
import 'package:dental_clinics_app/clinic/features/schedule/presentation/cubit/schedule_state.dart';
import 'package:dental_clinics_app/core/componeents/appointment_card.dart';
import 'package:dental_clinics_app/core/extensions/lang_extension.dart';
import 'package:dental_clinics_app/core/extensions/screen_extension.dart';
import 'package:dental_clinics_app/core/global/global_services.dart';
import 'package:dental_clinics_app/core/routing/route_names.dart';
import 'package:dental_clinics_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.getInfo();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is LoadedUserInfoProfileState) {
          GlobalServices.getInfo(context);

          context.read<HomeCubit>().getInquiries(
            role: GlobalServices.role,
            docId: GlobalServices.user.docId,
          );
          context.read<ScheduleCubit>().getAppointments(
            role: GlobalServices.role,
            docId: GlobalServices.user.docId,
          );
        }
      },
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBarHome(),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              Row(
                spacing: 20,
                children: [
                  BlocBuilder<HomeCubit, HomeState>(
                    builder: (context, state) {
                      if (state is HomeLoadedState) {
                        return HomeCard(
                          onTap: () =>
                              context.pushNamed(RouteNames.inquiriesScreen),
                          title: context.arb.inquiries,
                          subtitle: state.inquiries.length.toString(),
                          icon: "help_clinic",
                        );
                      } else if (state is HomeLoadingState) {
                        return HomeCard(
                          isLoading: true,
                          title: context.arb.inquiries,
                          subtitle: "0",
                          icon: "help_clinic",
                        );
                      } else {
                        return HomeCard(
                          title: context.arb.inquiries,
                          subtitle: "0",
                          icon: "help_clinic",
                        );
                      }
                    },
                  ),

                  BlocBuilder<ScheduleCubit, ScheduleState>(
                    builder: (context, state) {
                      if (state is ScheduleLoading) {
                        return HomeCard(
                          isLoading: true,
                          title: context.arb.appointments,
                          subtitle: "0",
                          icon: "calendar_clock_bigger",
                        );
                      } else if (state is ScheduleLoaded) {
                        return HomeCard(
                          title: context.arb.appointments,
                          subtitle: state.acceptedAppointments.length
                              .toString(),
                          icon: "calendar_clock_bigger",
                        );
                      } else {
                        return HomeCard(
                          title: context.arb.appointments,
                          subtitle: "0",
                          icon: "calendar_clock_bigger",
                        );
                      }
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const NextAppointmentsWidget(),
              const SizedBox(height: 20),
              BlocBuilder<ScheduleCubit, ScheduleState>(
                builder: (context, state) {
                  if (state is ScheduleLoaded) {
                    return ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: state.acceptedAppointments.length,
                      separatorBuilder: (context, i) =>
                          const SizedBox(height: 10),
                      itemBuilder: (context, i) => AppointmentCard(
                        title: state.acceptedAppointments[i].patientName,
                        subtitle: state
                            .acceptedAppointments[i]
                            .appointmentDateTime
                            .toString(),
                        textBtnOne: context.arb.complete,
                        textBtnTwo: context.arb.edit,
                        backgroundColorBtnOne: AppColors.whiteColor,
                        foregroundColorBtnOne: AppColors.primaryColor,
                      ),
                    );
                  } else if (state is ScheduleLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                    );
                  } else if (state is ScheduleError) {
                    return Center(child: Text(state.message));
                  } else {
                    return Text("No appointments");
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
