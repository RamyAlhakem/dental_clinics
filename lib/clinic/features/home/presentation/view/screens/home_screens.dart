import 'package:dental_clinics_app/clinic/features/home/presentation/cubit/home_cubit.dart';
import 'package:dental_clinics_app/clinic/features/home/presentation/cubit/home_state.dart';
import 'package:dental_clinics_app/clinic/features/home/presentation/view/widgets/app_bar_home.dart';
import 'package:dental_clinics_app/clinic/features/home/presentation/view/widgets/home_card.dart';
import 'package:dental_clinics_app/clinic/features/home/presentation/view/widgets/next_appointments_widget.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/cubit/profile_state.dart';
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
        }
      },
      child: Scaffold(
        appBar: const PreferredSize(
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
                  HomeCard(
                    title: context.arb.appointments,
                    subtitle: "25",
                    icon: "calendar_clock_bigger",
                  ),
                ],
              ),
              const NextAppointmentsWidget(),
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
      ),
    );
  }
}
