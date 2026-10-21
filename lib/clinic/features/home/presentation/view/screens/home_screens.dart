import 'package:dental_clinics_app/clinic/features/home/presentation/view/widgets/app_bar_home.dart';
import 'package:dental_clinics_app/clinic/features/home/presentation/view/widgets/home_card.dart';
import 'package:dental_clinics_app/clinic/features/home/presentation/view/widgets/next_appointments_widget.dart';
import 'package:dental_clinics_app/core/componeents/appointment_card.dart';
import 'package:dental_clinics_app/core/extensions/lang_extension.dart';
import 'package:dental_clinics_app/core/extensions/screen_extension.dart';
import 'package:dental_clinics_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
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
    );
  }
}
