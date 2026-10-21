import 'package:dental_clinics_app/core/componeents/app_text.dart';
import 'package:dental_clinics_app/core/componeents/app_text_form_field.dart';
import 'package:dental_clinics_app/core/extensions/lang_extension.dart';
import 'package:dental_clinics_app/core/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:dental_clinics_app/core/features/auth/presentation/cubit/auth_state.dart';
import 'package:dental_clinics_app/core/features/auth/presentation/view/widgets/forgot_password_widget.dart';
import 'package:dental_clinics_app/core/routing/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignInWidget extends StatelessWidget {
  final TextEditingController email;
  final TextEditingController password;
  final GlobalKey<FormState> formState;
  const SignInWidget({
    super.key,
    required this.email,
    required this.password,
    required this.formState,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formState,
      child: Column(
        children: [
          AppText(text: context.arb.email),
          const SizedBox(height: 5),
          AppTextFormField(
            validator: (text) {
              if (text!.isEmpty) {
                return context.arb.invalidInput;
              }
              return null;
            },
            controller: email,
            hintText: context.arb.email,
            labelText: context.arb.enterYourEmail,
            icon: "mail",
          ),
          const SizedBox(height: 20),
          AppText(text: context.arb.password),
          const SizedBox(height: 5),
          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              return AppTextFormField(
                onTap: () {
                  context.read<AuthCubit>().changeShowPass(!state.isHide);
                },
                obscureText: state.isHide,
                suffixIcon: state.isHide ? "visibility_off" : "visibility",
                validator: (text) {
                  if (text!.isEmpty) {
                    return context.arb.invalidInput;
                  }
                  return null;
                },
                controller: password,
                hintText: context.arb.password,
                labelText: context.arb.enterYourPassword,
                icon: "lock",
              );
            },
          ),
          const SizedBox(height: 2),
          ForgotPasswordWidget(
            text: context.arb.forgotPassword,
            onTap: () {
              context.pushNamed(RouteNames.resetPassword);
              // if (email.text.isEmpty) {
              //   AppSnackBar.showError(
              //     context,
              //     msg: context.arb.pleaseEnterYourEmailFirst,
              //   );
              // } else {
              //   context.read<AuthCubit>().resetPassword(email: email.text);
              // }
            },
          ),
        ],
      ),
    );
  }
}
