import 'package:dental_clinics_app/clinic/features/profile/data/data_source/local_data/profile_local_data_source_imp.dart';
import 'package:dental_clinics_app/clinic/features/profile/extensions/service_extension.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/cubit/profile_state.dart';
import 'package:dental_clinics_app/core/componeents/svg_widget.dart';
import 'package:dental_clinics_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DropDownServiceWidget extends StatelessWidget {
  const DropDownServiceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            border: Border.all(color: AppColors.blackColor),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              SvgWidget(icon: "medical_services"),
              SizedBox(width: 15),
              Expanded(
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    isExpanded: true,
                    dropdownColor: AppColors.backgroundColor,
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: AppColors.titlColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),

                    value: state.selectedService,
                    hint: Text("Select Service"),
                    items: ProfileLocalDataSourceIml()
                        .getStaticServices()
                        .map(
                          (service) => DropdownMenuItem(
                            value: service,
                            child: Text(service.getTitle(context)),
                          ),
                        )
                        .toList(),

                    onChanged: (val) {
                      context.read<ProfileCubit>().selectService(val!);
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
