import 'package:dental_clinics_app/clinic/features/profile/presentation/view/widgets/bottom_navigation_bar_available_times.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/view/widgets/services_widget.dart';
import 'package:dental_clinics_app/core/componeents/app_app_bar.dart';
import 'package:dental_clinics_app/core/componeents/app_text.dart';
import 'package:dental_clinics_app/core/componeents/svg_widget.dart';
import 'package:dental_clinics_app/core/extensions/lang_extension.dart';
import 'package:dental_clinics_app/core/routing/route_names.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: SvgWidget(icon: "add"),
        onPressed: () => context.pushNamed(RouteNames.addNewService),
      ),
      // bottomNavigationBar: BottomNnavigationBarAvailable(),
      appBar: AppAppBar(title: context.arb.services),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: ListView(
          children: [
            AppText(text: context.arb.whatServicesDoesTheClinicOffer),
            SizedBox(height: 20),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 10,
              runSpacing: 10,
              children: [
                ServicesWidget(service: context.arb.preventive),
                ServicesWidget(service: context.arb.restorative),
                ServicesWidget(service: context.arb.oralSurgery),
                ServicesWidget(service: context.arb.cosmetic),
                ServicesWidget(service: context.arb.orthodontics),
                ServicesWidget(service: context.arb.implants),
                ServicesWidget(service: context.arb.pedodontics),
                ServicesWidget(service: context.arb.prosthodontics),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
