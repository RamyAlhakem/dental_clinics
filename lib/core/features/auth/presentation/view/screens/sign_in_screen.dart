import 'package:dental_clinics_app/core/componeents/app_app_bar.dart';
import 'package:dental_clinics_app/core/componeents/app_button_gredient.dart';
import 'package:dental_clinics_app/core/dialog_app/app_dialog.dart';
import 'package:dental_clinics_app/core/extensions/lang_extension.dart';
import 'package:dental_clinics_app/core/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:dental_clinics_app/core/features/auth/presentation/cubit/auth_state.dart';
import 'package:dental_clinics_app/core/features/auth/presentation/view/widgets/sign_in_widget.dart';
import 'package:dental_clinics_app/core/features/auth/presentation/view/widgets/sign_widget.dart';
import 'package:dental_clinics_app/core/routing/route_names.dart';
import 'package:dental_clinics_app/core/snack_bars_app/app_snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  late final TextEditingController _email;
  late final TextEditingController _password;
  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(title: context.arb.signIn, leading: SizedBox()),
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccessState) {
            if (FirebaseAuth.instance.currentUser!.emailVerified) {
              context.pushReplacementNamed(RouteNames.bottomNavigationBar);
            } else {
              AppDialog.showWarning(
                width: 120,
                height: 120,
                fit: BoxFit.cover,
                context,
                title: "Verifiy your email address",
                subTitle: "Check your inbox to verify your email address",
                textBtn: "ok",
                onPressed: () {},
              );
            }
          } else if (state is AuthFailedState) {
            AppSnackBar.showError(
              context,
              msg: context.arb.invalidEmailOrPassword,
            );
          } else if (state is AuthSuccessResetPasswordState) {
            AppDialog.showReset(
              repeat: true,
              width: 120,
              height: 120,
              fit: BoxFit.cover,
              context,
              title: "Password Reset Link Sent",
              subTitle: "We have sent a password reset link to your email",
              textBtn: "Done",
              onPressed: () => context.pop(),
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            // spacing: 20,
            children: [
              SignInWidget(
                email: _email,
                password: _password,
                formState: _formState,
              ),
              Spacer(),
              BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  if (state is AuthLoadingState) {
                    return AppButtonGredient(
                      isLoading: true,
                      text: context.arb.signIn,
                      onTap: () {
                        context.read<AuthCubit>().signIn(
                          email: _email.text,
                          password: _password.text,
                        );
                      },
                    );
                  } else {
                    return AppButtonGredient(
                      text: context.arb.signIn,
                      onTap: () {
                        if (_formState.currentState!.validate()) {
                          context.read<AuthCubit>().signIn(
                            email: _email.text,
                            password: _password.text,
                          );
                        }
                      },
                    );
                  }
                },
              ),
              SizedBox(height: 5),
              SignWidget(
                text: context.arb.dontHaveAnAccountSignUpHere,
                onTap: () => context.pushReplacementNamed(RouteNames.signUp),
              ),
              SizedBox(height: 85),
            ],
          ),
        ),
      ),
    );
  }
}
