import 'package:dental_clinics_app/core/componeents/app_app_bar.dart';
import 'package:dental_clinics_app/core/componeents/app_button_gredient.dart';
import 'package:dental_clinics_app/core/extensions/lang_extension.dart';
import 'package:dental_clinics_app/core/extensions/screen_extension.dart';
import 'package:dental_clinics_app/core/features/auth/presentation/view/widgets/sign_up_widget.dart';
import 'package:dental_clinics_app/core/features/auth/presentation/view/widgets/sign_widget.dart';
import 'package:dental_clinics_app/core/routing/route_names.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(title: context.arb.signUp),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            SignUpWidget(),

            SizedBox(height: context.screenHeight / 10),
            AppButtonGredient(
              horizontal: 14,
              text: context.arb.signUp,
              onTap: () {},
            ),
            SizedBox(height: 5),
            SignWidget(
              text: context.arb.haveAnAccountSignInHere,
              onTap: () => context.pushNamed(RouteNames.signIn),
            ),
            SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}
