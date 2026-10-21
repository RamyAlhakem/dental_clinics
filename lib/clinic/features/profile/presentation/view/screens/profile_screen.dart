import 'package:dental_clinics_app/clinic/features/profile/presentation/view/widgets/list_tile_profile.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/view/widgets/log_out_dialog.dart';
import 'package:dental_clinics_app/core/componeents/app_app_bar.dart';
import 'package:dental_clinics_app/core/dialog_app/dialog_app_animation.dart';
import 'package:dental_clinics_app/core/extensions/lang_extension.dart';
import 'package:dental_clinics_app/core/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:dental_clinics_app/core/features/auth/presentation/cubit/auth_state.dart';
import 'package:dental_clinics_app/core/routing/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(title: context.arb.profile, leading: const SizedBox()),
      body: Column(
        children: [
          ListTileProfile(
            onTap: () {
              context.pushNamed(RouteNames.editProfile);
            },
            title: context.arb.editProfile,
            icon: "person_edit",
          ),
          ListTileProfile(
            onTap: () => context.pushNamed(RouteNames.languageScreen),
            title: context.arb.language,
            icon: "language",
          ),
          ListTileProfile(
            onTap: () => context.pushNamed(RouteNames.availableTimes),
            title: context.arb.availableTimes,
            icon: "event_available",
          ),
          ListTileProfile(
            onTap: () => context.pushNamed(RouteNames.services),
            title: context.arb.services,
            icon: "medical_services",
          ),
          ListTileProfile(
            onTap: () => context.pushNamed(RouteNames.contactSupportScreen),
            title: context.arb.contactSupportTeam,
            icon: "help",
          ),
          BlocListener<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthSignOutState) {
                context.goNamed(RouteNames.roleSelction);
              }
            },
            child: ListTileProfile(
              onTap: () {
                DialogAppAnimation.show(
                  context,
                  childPageBuilder: const LogOutDialog(),
                );
              },
              title: "Logout",
              icon: "exit_to_app",
            ),
          ),
        ],
      ),
    );
  }
}
