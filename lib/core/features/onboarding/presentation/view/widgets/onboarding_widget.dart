import 'package:dental_clinics_app/core/features/onboarding/presentation/view/widgets/onboarding_imag.dart';
import 'package:dental_clinics_app/core/services/cubit/services_cubit.dart';
import 'package:dental_clinics_app/core/services/cubit/services_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String img;
  const OnboardingWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<ServicesCubit, ServicesState>(
          builder: (context, state) {
            final isArabic = state.selectedLang.languageCode == "ar";
            return Container(
              alignment: isArabic
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: Text(
                title,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            );
          },
        ),
        Text(subtitle, style: Theme.of(context).textTheme.bodySmall),
        SizedBox(height: 30),
        OnboardingImage(img: img),
      ],
    );
  }
}
