import 'package:dental_clinics_app/clinic/features/profile/presentation/view/widgets/contact_widget.dart';
import 'package:dental_clinics_app/core/componeents/app_app_bar.dart';
import 'package:dental_clinics_app/core/componeents/app_text.dart';
import 'package:dental_clinics_app/core/componeents/svg_widget.dart';
import 'package:dental_clinics_app/core/extensions/lang_extension.dart';
import 'package:dental_clinics_app/core/global/global_services.dart';
import 'package:dental_clinics_app/core/helper/helper.dart';
import 'package:flutter/material.dart';

class ContactSupportScreen extends StatefulWidget {
  const ContactSupportScreen({super.key});

  @override
  State<ContactSupportScreen> createState() => _ContactSupportScreenState();
}

class _ContactSupportScreenState extends State<ContactSupportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(title: context.arb.contactSupportTeam),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const AppText(text: "Welcome! We’re always here to assist you."),
            const SizedBox(height: 10),
            const AppText(
              text: "If you run into any issues, feel free to reach out to us.",
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
            const SizedBox(height: 20),
            ContactWidget(
              title: "ramyalhakem9@gmail.com",
              icon: "mail",
              onTap: () {
                Helper.launch(
                  Uri(scheme: "mailto", path: "ramyalhakem9@gmail.com"),
                );
              },
            ),
            const SizedBox(height: 20),
            ContactWidget(
              title: "+60 182253469",
              icon: "WhatsappLogo",
              onTap: () {
                Helper.launch(
                  Uri.parse(
                    "https://wa.me/60182253469?text=Hello,I would like to inquire about the clinic booking app",
                  ),
                );
              },
            ),
            const SizedBox(height: 220),
            const SvgWidget(icon: "icon logo"),
            const Spacer(),
            Text(
              "Version ${GlobalServices.appVersion}",
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ],
        ),
      ),
    );
  }
}
