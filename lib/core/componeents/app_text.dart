import 'package:dental_clinics_app/core/services/cubit/services_cubit.dart';
import 'package:dental_clinics_app/core/services/cubit/services_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppText extends StatelessWidget {
  final String text;
  const AppText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ServicesCubit, ServicesState>(
      builder: (context, state) {
        final isArabic = state.selectedLang.languageCode == "ar";
        return Container(
          alignment: isArabic ? Alignment.centerRight : Alignment.centerLeft,
          child: Text(text, style: Theme.of(context).textTheme.bodySmall),
        );
      },
    );
  }
}
