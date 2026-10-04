import 'package:dental_clinics_app/clinic/features/profile/data/models/service_model.dart';
import 'package:dental_clinics_app/clinic/features/profile/extensions/service_extension.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/cubit/profile_state.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/view/widgets/bottom_navigation_bar_available_times.dart';
import 'package:dental_clinics_app/core/features/role_selection/presentation/cubit/role_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomWidgetAddNewService extends StatelessWidget {
  final TextEditingController controller;
  const BottomWidgetAddNewService({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is LoadingUserInfoProfileState) {
          return BottomNnavigationBarAvailable(
            isLoading: true,
            onTap: () {
              _addService(context, controller);
            },
          );
        } else {
          return BottomNnavigationBarAvailable(
            isLoading: false,
            onTap: () {
              _addService(context, controller);
            },
          );
        }
      },
    );
  }
}

_addService(BuildContext context, TextEditingController controller) {
  final role = context.read<RoleCubit>().state.selectedRole;
  final status = context.read<ProfileCubit>().state.isEnabled;
  final user = context.read<ProfileCubit>().state.user;
  final selectedService = context.read<ProfileCubit>().state.selectedService;

  context.read<ProfileCubit>().addNewService(
    role: role!.name,
    docId: user!.docId,
    service: ServiceModel(
      serviceName: selectedService!.getTitle(context),
      doctorName: controller.text,
      status: status,
    ),
  );
}
