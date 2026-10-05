import 'package:dental_clinics_app/clinic/features/profile/extensions/string_extension.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/cubit/profile_state.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/view/widgets/services_widget.dart';
import 'package:dental_clinics_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServicesListWidget extends StatelessWidget {
  const ServicesListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is FailedUserInfoProfileState) {
          return Center(
            child: Text(
              "Something went wrong",
              style: Theme.of(
                context,
              ).textTheme.bodySmall!.copyWith(color: AppColors.darkGreyColor),
            ),
          );
        } else if (state is LoadingUserInfoProfileState) {
          return Center(
            child: CircularProgressIndicator(color: AppColors.primaryColor),
          );
        } else {
          return Wrap(
            alignment: WrapAlignment.center,
            spacing: 10,
            runSpacing: 10,
            children: state.user!.services
                .map((service) => ServicesWidget(service: service))
                .toList(),
          );
        }
      },
    );
  }
}
