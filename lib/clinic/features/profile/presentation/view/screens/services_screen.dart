import 'package:dental_clinics_app/clinic/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/view/widgets/services_list_widget.dart';
import 'package:dental_clinics_app/core/componeents/app_app_bar.dart';
import 'package:dental_clinics_app/core/componeents/app_text.dart';
import 'package:dental_clinics_app/core/componeents/svg_widget.dart';
import 'package:dental_clinics_app/core/extensions/lang_extension.dart';
import 'package:dental_clinics_app/core/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:dental_clinics_app/core/features/auth/presentation/cubit/auth_state.dart';
import 'package:dental_clinics_app/core/features/role_selection/presentation/cubit/role_cubit.dart';
import 'package:dental_clinics_app/core/routing/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  _getInfo() {
    final state = context.read<AuthCubit>().state;
    final role = context.read<RoleCubit>().state.selectedRole;
    if (state is AuthSuccessState) {
      context.read<ProfileCubit>().getInfo(
        role: role!.name,
        userId: state.user.id,
      );
    }
  }

  @override
  void initState() {
    _getInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: SvgWidget(icon: "add"),
        onPressed: () => context.pushNamed(RouteNames.addNewService),
      ),
      // bottomNavigationBar: BottomNnavigationBarAvailable(),
      appBar: AppAppBar(title: context.arb.services),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: ListView(
          children: [
            AppText(text: context.arb.whatServicesDoesTheClinicOffer),
            SizedBox(height: 20),
            ServicesListWidget(),
          ],
        ),
      ),
    );
  }
}
