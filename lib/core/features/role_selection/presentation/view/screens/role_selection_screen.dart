import 'package:dental_clinics_app/core/componeents/app_button_gredient.dart';
import 'package:dental_clinics_app/core/extensions/lang_extension.dart';
import 'package:dental_clinics_app/core/features/auth/presentation/view/widgets/sign_widget.dart';
import 'package:dental_clinics_app/core/features/role_selection/presentation/view/widgets/selection_option_widget.dart';
import 'package:dental_clinics_app/core/routing/route_names.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RoleSelectionScreen extends StatefulWidget {
  const RoleSelectionScreen({super.key});

  @override
  State<RoleSelectionScreen> createState() => _RoleSelectionScreenState();
}

class _RoleSelectionScreenState extends State<RoleSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              // spacing: 30,
              children: [
                SizedBox(height: 20),
                SelectionOptionWidget(
                  title: "Sign In as clinic",
                  icon: "add_home_work",
                ),
                SizedBox(height: 30),
                SelectionOptionWidget(
                  title: "Sign In as patient",
                  icon: "supervisor_account",
                ),
                Spacer(),
                AppButtonGredient(
                  horizontal: 0,
                  text: context.arb.signIn,
                  onTap: () {
                    context.pushNamed(RouteNames.signIn);
                  },
                ),
                SizedBox(height: 5),
                SignWidget(
                  text: context.arb.dontHaveAnAccountSignUpHere,
                  onTap: () => context.pushNamed(RouteNames.signUp),
                ),
                SizedBox(height: 80),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
