import 'package:dental_clinics_app/core/componeents/app_button_gredient.dart';
import 'package:dental_clinics_app/core/componeents/button.dart';
import 'package:dental_clinics_app/core/extensions/lang_extension.dart';
import 'package:dental_clinics_app/core/extensions/screen_extension.dart';
import 'package:dental_clinics_app/core/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:dental_clinics_app/core/features/auth/presentation/cubit/auth_state.dart';
import 'package:dental_clinics_app/core/snack_bars_app/app_snack_bar.dart';
import 'package:dental_clinics_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class BottomResetPasswordWidget extends StatelessWidget {
  final TextEditingController email;
  const BottomResetPasswordWidget({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 20,
        children: [
          AppButton(
            backgroundColor: AppColors.whiteColor,
            foregroundColor: AppColors.primaryColor,
            onPressed: () => context.pop(),
            text: context.arb.previous,
            width: context.screenWidth / 2.5,
          ),
          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              if (state is AuthLoadingState) {
                return AppButtonGredient(
                  isLoading: true,
                  width: context.screenWidth / 2.5,
                  text: context.arb.resetPassword,
                  onTap: () {},
                );
              } else {
                return AppButtonGredient(
                  width: context.screenWidth / 2.5,
                  text: context.arb.resetPassword,
                  onTap: () {
                    final reg = RegExp(r"^[\w-\.]+@[\w]+[\.][\w]{3}$");
                    if (email.text.isEmpty) {
                      AppSnackBar.showError(
                        context,
                        msg: context.arb.pleaseEnterYourEmailFirst,
                      );
                    } else if (reg.hasMatch(email.text)) {
                      context.read<AuthCubit>().resetPassword(
                        email: email.text,
                      );
                    } else {
                      AppSnackBar.showError(
                        context,
                        msg: "Email is not correct",
                      );
                    }
                  },
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
