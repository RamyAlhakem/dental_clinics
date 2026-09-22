import 'package:dental_clinics_app/clinic/features/profile/presentation/view/widgets/expansion_tile_profile.dart';
import 'package:dental_clinics_app/core/componeents/app_app_bar.dart';
import 'package:dental_clinics_app/core/componeents/app_button_gredient.dart';
import 'package:dental_clinics_app/core/componeents/app_text_form_field.dart';
import 'package:dental_clinics_app/core/componeents/button.dart';
import 'package:dental_clinics_app/core/extensions/lang_extension.dart';
import 'package:dental_clinics_app/core/extensions/screen_extension.dart';
import 'package:dental_clinics_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(title: context.arb.editProfile),
      body: Column(
        children: [
          ExpansionTileProfile(
            title: context.arb.changeEmail,
            children: [
              AppTextFormField(
                hintText: context.arb.email,
                labelText: context.arb.enterYourEmail,
                icon: "mail",
              ),
            ],
          ),
          ExpansionTileProfile(
            title: context.arb.changePassword,
            children: [
              AppTextFormField(
                hintText: context.arb.currentPassword,
                labelText: context.arb.enterCurrentPassword,
                icon: "lock",
                suffixIcon: "visibility",
              ),
              SizedBox(height: 10),
              AppTextFormField(
                hintText: context.arb.newPassword,
                labelText: context.arb.enterNewPassword,
                icon: "lock",
                suffixIcon: "visibility",
              ),
              SizedBox(height: 10),
              AppTextFormField(
                hintText: context.arb.confirmNewPassword,
                labelText: context.arb.confirmYourNewPassword,
                icon: "lock",
                suffixIcon: "visibility",
              ),
            ],
          ),
          ExpansionTileProfile(
            title: context.arb.deleteAccount,
            children: [
              AppButton(
                onPressed: () {},
                text: context.arb.deleteMyAccount,
                width: context.screenWidth / 1.3,
                backgroundColor: AppColors.lightPrimary,
                foregroundColor: AppColors.redWineColor,
              ),
            ],
          ),
          Spacer(),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            child: Row(
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppButton(
                  backgroundColor: AppColors.whiteColor,
                  foregroundColor: AppColors.primaryColor,
                  width: context.screenWidth / 2.5,
                  onPressed: () {},
                  text: "Cancel",
                ),
                AppButtonGredient(
                  width: context.screenWidth / 2.5,
                  onTap: () {},
                  text: "Save",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
