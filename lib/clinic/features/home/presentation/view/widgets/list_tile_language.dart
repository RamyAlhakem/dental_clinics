import 'package:dental_clinics_app/core/componeents/svg_widget.dart';
import 'package:dental_clinics_app/core/services/cubit/services_cubit.dart';
import 'package:dental_clinics_app/core/services/cubit/services_state.dart';
import 'package:dental_clinics_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListTileLanguage extends StatelessWidget {
  final String text;
  final String languageCode;
  final VoidCallback onTap;
  const ListTileLanguage({
    super.key,
    required this.text,
    required this.onTap,
    required this.languageCode,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ServicesCubit, ServicesState>(
      builder: (context, state) {
        return ListTile(
          tileColor: AppColors.whiteColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: state.selectedLang.languageCode == languageCode
                  ? AppColors.primaryColor
                  : AppColors.lightGreyColor,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          onTap: onTap,
          leading: SvgWidget(icon: "translate"),
          title: Text(text),
          trailing: state.selectedLang.languageCode == languageCode
              ? SvgWidget(icon: "check_circle")
              : null,
        );
      },
    );
  }
}
