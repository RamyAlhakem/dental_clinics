import 'package:dental_clinics_app/core/componeents/app_text.dart';
import 'package:dental_clinics_app/core/componeents/app_text_form_field.dart';
import 'package:dental_clinics_app/core/extensions/lang_extension.dart';
import 'package:flutter/material.dart';

class SignUpWidget extends StatelessWidget {
  final TextEditingController clinicName;
  final TextEditingController email;
  final TextEditingController phone;
  final TextEditingController password;
  final TextEditingController newPassword;
  final GlobalKey formState;
  const SignUpWidget({
    super.key,
    required this.email,
    required this.clinicName,
    required this.phone,
    required this.password,
    required this.newPassword,
    required this.formState,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formState,
      child: Column(
        children: [
          AppText(text: context.arb.clinicName),
          SizedBox(height: 5),
          AppTextFormField(
            validator: (val) {
              if (val!.isEmpty) {
                return "Invalid input";
              }
              return null;
            },
            controller: clinicName,
            hintText: context.arb.clinicName,
            labelText: context.arb.enterYourClinicName,
            icon: "add_home_work_smaller",
          ),
          SizedBox(height: 20),
          AppText(text: context.arb.email),
          SizedBox(height: 5),
          AppTextFormField(
            validator: (val) {
              if (val!.isEmpty) {
                return "Invalid input";
              }
              return null;
            },
            controller: email,
            hintText: context.arb.email,
            labelText: context.arb.enterYourEmail,
            icon: "mail",
          ),
          SizedBox(height: 20),
          AppText(text: context.arb.phone),
          SizedBox(height: 5),
          AppTextFormField(
            validator: (val) {
              if (val!.isEmpty) {
                return "Invalid input";
              }
              return null;
            },
            controller: phone,
            hintText: context.arb.phone,
            labelText: context.arb.enterYourPhone,
            icon: "call",
          ),
          SizedBox(height: 20),
          AppText(text: context.arb.password),
          SizedBox(height: 5),
          AppTextFormField(
            obscureText: true,
            validator: (val) {
              if (val!.isEmpty) {
                return "Invalid input";
              }
              return null;
            },
            controller: password,
            hintText: context.arb.password,
            labelText: context.arb.enterYourPassword,
            icon: "lock",
          ),

          SizedBox(height: 20),
          AppText(text: context.arb.confirmPassword),
          SizedBox(height: 5),
          AppTextFormField(
            obscureText: true,
            validator: (val) {
              if (val!.isEmpty) {
                return "Invalid input";
              }
              return null;
            },
            controller: newPassword,
            hintText: context.arb.confirmPassword,
            labelText: context.arb.confirmYourPassword,
            icon: "lock",
          ),
        ],
      ),
    );
  }
}
