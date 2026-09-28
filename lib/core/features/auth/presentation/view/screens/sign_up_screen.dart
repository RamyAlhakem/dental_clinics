import 'package:dental_clinics_app/core/componeents/app_app_bar.dart';
import 'package:dental_clinics_app/core/componeents/app_button_gredient.dart';
import 'package:dental_clinics_app/core/componeents/button.dart';
import 'package:dental_clinics_app/core/componeents/success_dialog.dart';
import 'package:dental_clinics_app/core/extensions/lang_extension.dart';
import 'package:dental_clinics_app/core/extensions/screen_extension.dart';
import 'package:dental_clinics_app/core/features/auth/data/models/user_model.dart';
import 'package:dental_clinics_app/core/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:dental_clinics_app/core/features/auth/presentation/cubit/auth_state.dart';
import 'package:dental_clinics_app/core/features/auth/presentation/view/widgets/sign_up_widget.dart';
import 'package:dental_clinics_app/core/features/auth/presentation/view/widgets/sign_widget.dart';
import 'package:dental_clinics_app/core/features/role_selection/presentation/cubit/role_cubit.dart';
import 'package:dental_clinics_app/core/routing/route_names.dart';
import 'package:dental_clinics_app/core/snack_bars_app/app_snack_bar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  late final TextEditingController _name;
  late final TextEditingController _email;
  late final TextEditingController _phone;
  late final TextEditingController _password;
  late final TextEditingController _newPassword;
  @override
  void initState() {
    _name = TextEditingController();
    _email = TextEditingController();
    _phone = TextEditingController();
    _password = TextEditingController();
    _newPassword = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _phone.dispose();
    _password.dispose();
    _newPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(title: context.arb.signUp, leading: SizedBox()),
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthFailedState) {
            AppSnackBar.showError(context, msg: state.msg);
          } else if (state is AuthSuccessState) {
            showDialog(context: context, builder: (context) => SuccessDialog());
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              SignUpWidget(
                formState: _formState,
                clinicName: _name,
                email: _email,
                password: _password,
                newPassword: _newPassword,
                phone: _phone,
              ),

              SizedBox(height: context.screenHeight / 10),
              BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  if (state is AuthLoadingState) {
                    return AppButtonGredient(
                      isLoading: true,
                      horizontal: 14,
                      text: context.arb.signUp,
                      onTap: () {},
                    );
                  } else {
                    return AppButtonGredient(
                      horizontal: 14,
                      text: context.arb.signUp,
                      onTap: () async {
                        final selectedRole = context
                            .read<RoleCubit>()
                            .state
                            .selectedRole;
                        if (_formState.currentState!.validate()) {
                          final user = UserModel(
                            email: _email.text,
                            name: _name.text,
                            password: _password.text,
                            newPassword: _newPassword.text,
                            phone: _phone.text,
                          );
                          if (_password.text != _newPassword.text) {
                            AppSnackBar.showError(
                              context,
                              msg: "The password not match",
                            );
                          } else {
                            context.read<AuthCubit>().signUp(
                              user: user,
                              role: selectedRole!.name,
                            );
                          }
                        }
                      },
                    );
                  }
                },
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
      ),
    );
  }
}
