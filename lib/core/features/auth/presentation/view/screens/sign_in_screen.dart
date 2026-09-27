import 'package:dental_clinics_app/core/componeents/app_app_bar.dart';
import 'package:dental_clinics_app/core/componeents/app_button_gredient.dart';
import 'package:dental_clinics_app/core/extensions/lang_extension.dart';
import 'package:dental_clinics_app/core/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:dental_clinics_app/core/features/auth/presentation/cubit/auth_state.dart';
import 'package:dental_clinics_app/core/features/auth/presentation/view/widgets/sign_in_widget.dart';
import 'package:dental_clinics_app/core/features/auth/presentation/view/widgets/sign_widget.dart';
import 'package:dental_clinics_app/core/routing/route_names.dart';
import 'package:dental_clinics_app/core/snack_bars.dart/app_snack_bar.dart';
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
      appBar: AppAppBar(title: context.arb.signIn),
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccessState) {
            // context.pushReplacementNamed(RouteNames.bottomNavigationBar);
          } else if (state is AuthFailedState) {
            AppSnackBar.showError(context, msg: state.msg);
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
                        // context.pushReplacementNamed(
                        //   RouteNames.bottomNavigationBar,
                        // );
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
                onTap: () => context.pushNamed(RouteNames.signUp),
              ),
              SizedBox(height: 85),
            ],
          ),
        ),
      ),
    );
  }
}
