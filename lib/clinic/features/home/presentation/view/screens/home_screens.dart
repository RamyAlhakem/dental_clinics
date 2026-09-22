import 'package:dental_clinics_app/clinic/features/home/presentation/view/widgets/dialog_select_language.dart';
import 'package:dental_clinics_app/core/componeents/appointment_card.dart';
import 'package:dental_clinics_app/clinic/features/home/presentation/view/widgets/home_card.dart';
import 'package:dental_clinics_app/clinic/features/home/presentation/view/widgets/next_appointments_widget.dart';
import 'package:dental_clinics_app/core/componeents/app_app_bar.dart';
import 'package:dental_clinics_app/core/extensions/lang_extension.dart';
import 'package:dental_clinics_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dental_clinics_app/l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
        leadingWidth: 0,
        title: context.arb.hello,
        subtitle: "ramy alhakem",
        listTileLeading: Padding(
          padding: const EdgeInsets.all(3.0),
          child: SvgPicture.asset("assets/icons/logo.svg"),
        ),
        centerTitle: false,
        leading: SizedBox(),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => DialogSelectLanguage(),
              );
            },
            icon: Icon(Icons.language),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_outlined),
          ),
        ],
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
