import 'package:dental_clinics_app/clinic/features/profile/data/data_source/local_data/profile_local_data_source_imp.dart';
import 'package:dental_clinics_app/clinic/features/profile/domain/entities/service_entitie.dart';
import 'package:dental_clinics_app/clinic/features/profile/extensions/day_extension.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/cubit/profile_state.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/view/widgets/day_widget.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/view/widgets/shift_widget.dart';
import 'package:dental_clinics_app/core/componeents/app_app_bar.dart';
import 'package:dental_clinics_app/core/componeents/app_text.dart';
import 'package:dental_clinics_app/core/componeents/svg_widget.dart';
import 'package:dental_clinics_app/core/extensions/lang_extension.dart';
import 'package:dental_clinics_app/core/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:dental_clinics_app/core/features/auth/presentation/cubit/auth_state.dart';
import 'package:dental_clinics_app/core/features/role_selection/presentation/cubit/role_cubit.dart';
import 'package:dental_clinics_app/core/routing/route_names.dart';
import 'package:dental_clinics_app/core/snack_bars_app/app_snack_bar.dart';
import 'package:dental_clinics_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AvailableTimesScreen extends StatefulWidget {
  const AvailableTimesScreen({super.key});

  @override
  State<AvailableTimesScreen> createState() => _AvailableTimesScreenState();
}

class _AvailableTimesScreenState extends State<AvailableTimesScreen> {
  _setData(WeekDays? selectedDay) {
    final authState = context.read<AuthCubit>().state;
    final role = context.read<RoleCubit>().state.selectedRole;

    if (selectedDay != null) {
      context.read<ProfileCubit>().selectDay(
        selectedDay,
        role: role!.name,
        userId: (authState as AuthSuccessState).user.id,
      );
    }
  }

  @override
  void initState() {
    final selectedDay = context.read<ProfileCubit>().state.selectedDay;
    _setData(selectedDay);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final state = context.read<ProfileCubit>().state;
          if (state.selectedDay == null) {
            AppSnackBar.showError(context, msg: "Please select day first");
          } else {
            context.pushNamed(RouteNames.screenDay);
          }
        },
        child: const SvgWidget(icon: "add"),
      ),
      // bottomNavigationBar: BottomNnavigationBarAvailable(onTap: () {}),
      appBar: AppAppBar(title: context.arb.availableTimes),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            AppText(text: context.arb.daysOfTheWeek),
            const SizedBox(height: 20),
            Wrap(
              alignment: WrapAlignment.center,

              spacing: 10,
              runSpacing: 10,
              children: ProfileLocalDataSourceIml()
                  .getStaticWeekDays()
                  .map(
                    (day) => DayWidget(
                      title: day.getTitle(context),
                      subTitle: "1",
                      onTap: () {
                        _setData(day);
                      },
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 20),
            BlocBuilder<ProfileCubit, ProfileState>(
              builder: (context, state) {
                if (state is LoadingUserInfoProfileState) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    ),
                  );
                } else if (state is LoadedDayUserInfoProfileState) {
                  return ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: state.shifts.length,
                    separatorBuilder: (context, i) => const SizedBox(height: 10),
                    itemBuilder: (context, i) {
                      return ShiftWidget(
                        shift: state.shifts[i],
                        day: state.day,
                      );
                    },
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
