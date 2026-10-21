import 'package:dental_clinics_app/core/componeents/app_button_gredient.dart';
import 'package:dental_clinics_app/core/componeents/button.dart';
import 'package:dental_clinics_app/core/extensions/lang_extension.dart';
import 'package:dental_clinics_app/core/extensions/screen_extension.dart';
import 'package:dental_clinics_app/core/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:dental_clinics_app/core/features/auth/presentation/cubit/auth_state.dart';
import 'package:dental_clinics_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class LogOutDialog extends StatelessWidget {
  const LogOutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,

          children: [
            Lottie.asset(
              "assets/lottie/Logout.json",
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Logout",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            Text(
              "Are you sure you want to logout of your account?",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 20,
              children: [
                AppButton(
                  backgroundColor: AppColors.whiteColor,
                  foregroundColor: AppColors.primaryColor,
                  onPressed: () => context.pop(),
                  text: context.arb.previous,
                  width: context.screenWidth / 3.5,
                ),
                BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    if (state is AuthLoadingState) {
                      return AppButtonGredient(
                        isLoading: true,
                        onTap: () {
                          context.read<AuthCubit>().signOut();
                        },
                        text: "Logout",
                        width: context.screenWidth / 3.5,
                      );
                    } else {
                      return AppButtonGredient(
                        onTap: () {
                          context.read<AuthCubit>().signOut();
                        },
                        text: "Logout",
                        width: context.screenWidth / 3.5,
                      );
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
    ;
  }
}
