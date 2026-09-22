import 'package:dental_clinics_app/core/componeents/app_text.dart';
import 'package:dental_clinics_app/core/componeents/app_text_form_field.dart';
import 'package:dental_clinics_app/core/extensions/lang_extension.dart';
import 'package:dental_clinics_app/core/features/auth/presentation/view/widgets/forgot_password_widget.dart';
import 'package:flutter/material.dart';

class SignInWidget extends StatelessWidget {
  const SignInWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppText(text: context.arb.email),
        SizedBox(height: 5),
        AppTextFormField(
          hintText: context.arb.email,
          labelText: context.arb.enterYourEmail,
          icon: "mail",
        ),
        SizedBox(height: 20),
        AppText(text: context.arb.password),
        SizedBox(height: 5),
        AppTextFormField(
          hintText: context.arb.password,
          labelText: context.arb.enterYourPassword,
          icon: "lock",
        ),
        SizedBox(height: 2),
        ForgotPasswordWidget(text: context.arb.forgotPassword, onTap: () {}),
      ],
    );
  }
}
