import 'package:dental_clinics_app/clinic/features/profile/domain/entities/service_entitie.dart';
import 'package:dental_clinics_app/clinic/features/profile/extensions/string_extension.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/cubit/profile_state.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/view/widgets/bottom_widget_add_new_service.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/view/widgets/drop_down_service_widget.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/view/widgets/service_status_widget.dart';
import 'package:dental_clinics_app/core/componeents/app_app_bar.dart';
import 'package:dental_clinics_app/core/componeents/app_text.dart';
import 'package:dental_clinics_app/core/componeents/app_text_form_field.dart';
import 'package:dental_clinics_app/core/componeents/svg_widget.dart';
import 'package:dental_clinics_app/core/routing/route_names.dart';
import 'package:dental_clinics_app/core/snack_bars_app/app_snack_bar.dart';
import 'package:dental_clinics_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AddNewServiceScreen extends StatefulWidget {
  final ServiceEntities? service;
  const AddNewServiceScreen({super.key, this.service});

  @override
  State<AddNewServiceScreen> createState() => _AddNewServiceScreenState();
}

class _AddNewServiceScreenState extends State<AddNewServiceScreen> {
  late TextEditingController _doctorName;
  @override
  void initState() {
    if (widget.service != null) {
      _doctorName = TextEditingController(text: widget.service!.doctorName);
      context.read<ProfileCubit>().setData(
        status: widget.service!.status,
        selectedService: widget.service!.serviceName.getService(),
      );
    } else {
      _doctorName = TextEditingController();
      context.read<ProfileCubit>().clearData();
    }

    super.initState();
  }

  @override
  void dispose() {
    _doctorName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is SuccessUserInfoProfileState) {
          AppSnackBar.showSuccess(context, msg: state.msg);
          context.pushReplacementNamed(RouteNames.services);
        }
      },
      child: Scaffold(
        appBar: AppAppBar(title: "Add New Service"),
        bottomNavigationBar: BottomWidgetAddNewService(controller: _doctorName),

        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              AppText(text: "Service name"),
              SizedBox(height: 5),
              DropDownServiceWidget(),
              SizedBox(height: 20),
              AppText(text: "Doctor name"),
              SizedBox(height: 5),
              AppTextFormField(
                controller: _doctorName,
                hintText: "Doctor name",
                labelText: "Enter doctor name",
                icon: "account_circle",
              ),
              SizedBox(height: 30),
              ServiceStatusWidget(),
              Divider(color: AppColors.darkGreyColor),
              Row(
                spacing: 10,
                children: [
                  SvgWidget(icon: "info"),
                  Text(
                    "Service will be visible to patients when enabled",
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: AppColors.iconColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
