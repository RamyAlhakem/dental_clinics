import 'package:dental_clinics_app/core/services/cubit/services_cubit.dart';
import 'package:dental_clinics_app/core/services/cubit/services_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordWidget extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const ForgotPasswordWidget({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ServicesCubit, ServicesState>(
      builder: (context, state) {
        final isArabic = state.selectedLang.languageCode == "ar";
        return GestureDetector(
          onTap: onTap,
          child: Container(
            alignment: isArabic ? Alignment.centerRight : Alignment.centerLeft,
            child: Text(text, style: Theme.of(context).textTheme.labelMedium),
          ),
        );
      },
    );
  }
}
