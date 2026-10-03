import 'package:dental_clinics_app/clinic/features/profile/presentation/view/widgets/bottom_navigation_bar_available_times.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/view/widgets/drop_down_service_widget.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/view/widgets/service_status_widget.dart';
import 'package:dental_clinics_app/core/componeents/app_app_bar.dart';
import 'package:dental_clinics_app/core/componeents/app_text.dart';
import 'package:dental_clinics_app/core/componeents/app_text_form_field.dart';
import 'package:dental_clinics_app/core/componeents/svg_widget.dart';
import 'package:dental_clinics_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class AddNewServiceScreen extends StatefulWidget {
  const AddNewServiceScreen({super.key});

  @override
  State<AddNewServiceScreen> createState() => _AddNewServiceScreenState();
}

class _AddNewServiceScreenState extends State<AddNewServiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(title: "Add New Service"),
      bottomNavigationBar: BottomNnavigationBarAvailable(),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            AppText(text: "Service name"),
            SizedBox(height: 5),
            DropDownServiceWidget(),
            SizedBox(height: 20),
            AppText(text: "Doctor name"),
            SizedBox(height: 5),
            AppTextFormField(
              hintText: "Doctor name",
              labelText: "Enter doctor name",
              icon: "account_circle",
            ),
            SizedBox(height: 30),
            ServiceStatusWidget(),
            Divider(color: AppColors.darkGreyColor),
            Row(
              spacing: 10,
              children: [
                SvgWidget(icon: "info"),
                Text(
                  "Service will be visible to patients when enabled",
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: AppColors.iconColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
