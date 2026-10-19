import 'package:dental_clinics_app/core/componeents/app_app_bar.dart';
import 'package:dental_clinics_app/core/componeents/app_text_form_field.dart';
import 'package:dental_clinics_app/core/extensions/lang_extension.dart';
import 'package:dental_clinics_app/core/features/auth/presentation/view/widgets/bottom_reseet_password_widget.dart';
import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  late final TextEditingController _email;
  @override
  void initState() {
    _email = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(title: context.arb.resetPassword),
      bottomNavigationBar: BottomResetPasswordWidget(email: _email),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            AppTextFormField(
              validator: (text) {
                if (text!.isEmpty) {
                  return context.arb.invalidInput;
                }
                return null;
              },
              controller: _email,
              hintText: context.arb.email,
              labelText: context.arb.enterYourEmail,
              icon: "mail",
            ),
          ],
        ),
      ),
    );
  }
}
