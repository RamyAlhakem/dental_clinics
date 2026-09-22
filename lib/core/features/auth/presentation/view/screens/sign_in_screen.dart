import 'package:dental_clinics_app/core/componeents/app_app_bar.dart';
import 'package:dental_clinics_app/core/componeents/app_button_gredient.dart';
import 'package:dental_clinics_app/core/extensions/lang_extension.dart';
import 'package:dental_clinics_app/core/features/auth/presentation/view/widgets/sign_in_widget.dart';
import 'package:dental_clinics_app/core/features/auth/presentation/view/widgets/sign_widget.dart';
import 'package:dental_clinics_app/core/routing/route_names.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(title: context.arb.signIn),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          // spacing: 20,
          children: [
            SignInWidget(),
            Spacer(),
            AppButtonGredient(
              text: context.arb.signIn,
              onTap: () => context.pushNamed(RouteNames.bottomNavigationBar),
            ),
            SizedBox(height: 5),
            SignWidget(
              text: context.arb.dontHaveAnAccountSignUpHere,
              onTap: () => context.pushNamed(RouteNames.signUp),
            ),
            SizedBox(height: 85),
          ],
        ),
      ),
    );
  }
}
