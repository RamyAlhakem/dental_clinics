import 'package:dental_clinics_app/clinic/features/bottom_navigation_bar.dart/presentation/cubit/bottom_navigation_bar_cubit.dart';
import 'package:dental_clinics_app/clinic/features/bottom_navigation_bar.dart/presentation/cubit/bottom_navigation_bar_state.dart';
import 'package:dental_clinics_app/clinic/features/home/presentation/view/screens/home_screens.dart';
import 'package:dental_clinics_app/clinic/features/patients/presentation/view/screens/patients_screen.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/view/screens/profile_screen.dart';
import 'package:dental_clinics_app/clinic/features/schedule/presentation/view/screens/schedule_screen.dart';
import 'package:dental_clinics_app/core/extensions/lang_extension.dart';
import 'package:dental_clinics_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  State<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  List pages = [
    HomeScreen(),
    ScheduleScreen(),
    PatientsScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBarCubit, BottomNavigationBarState>(
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state.selectedIndex,

            onTap: (val) {
              context.read<BottomNavigationBarCubit>().selectIndex(val);
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: context.arb.home,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.schedule_outlined),
                label: context.arb.schedule,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.people_outline),
                label: context.arb.patients,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_outlined),
                label: context.arb.profile,
              ),
            ],
          ),
          body: pages[state.selectedIndex],
        );
      },
    );
  }
}
