import 'package:dental_clinics_app/core/componeents/app_button_gredient.dart';
import 'package:dental_clinics_app/core/componeents/app_text.dart';
import 'package:dental_clinics_app/core/extensions/lang_extension.dart';
import 'package:dental_clinics_app/core/features/auth/presentation/view/widgets/sign_widget.dart';
import 'package:dental_clinics_app/core/features/role_selection/presentation/cubit/role_cubit.dart';
import 'package:dental_clinics_app/core/features/role_selection/presentation/cubit/role_state.dart';
import 'package:dental_clinics_app/core/features/role_selection/presentation/view/widgets/selection_option_widget.dart';
import 'package:dental_clinics_app/core/routing/route_names.dart';
import 'package:dental_clinics_app/core/snack_bars_app/app_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                AppText(text: context.arb.selectAccountType),
                SizedBox(height: 30),
                SelectionOptionWidget(
                  role: Roles.clinics,
                  onTap: () {
                    context.read<RoleCubit>().selectClinic();
                  },
                  title: context.arb.clinic,
                  icon: "add_home_work",
                ),
                SizedBox(height: 30),
                SelectionOptionWidget(
                  role: Roles.patients,
                  onTap: () {
                    context.read<RoleCubit>().selectPatient();
                  },
                  title: context.arb.patient,
                  icon: "supervisor_account",
                ),
                Spacer(),
                AppButtonGredient(
                  horizontal: 0,
                  text: context.arb.signIn,
                  onTap: () {
                    final currentState = context.read<RoleCubit>().state;
                    if (currentState is RoleUnknownState) {
                      AppSnackBar.showError(
                        context,
                        msg: context.arb.pleaseSelectAccountType,
                      );
                    } else {
                      context.pushReplacementNamed(RouteNames.signIn);
                    }
                  },
                ),
                SizedBox(height: 5),
                SignWidget(
                  text: context.arb.dontHaveAnAccountSignUpHere,
                  onTap: () {
                    final currentState = context.read<RoleCubit>().state;
                    if (currentState is RoleUnknownState) {
                      AppSnackBar.showError(
                        context,
                        msg: context.arb.pleaseSelectAccountType,
                      );
                    } else {
                      context.pushReplacementNamed(RouteNames.signUp);
                    }
                  },
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
