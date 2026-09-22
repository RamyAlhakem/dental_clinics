import 'package:dental_clinics_app/clinic/features/bottom_navigation_bar.dart/presentation/cubit/bottom_navigation_bar_cubit.dart';
import 'package:dental_clinics_app/core/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:dental_clinics_app/core/routing/routing_config.dart';
import 'package:dental_clinics_app/core/services/cubit/services_cubit.dart';
import 'package:dental_clinics_app/core/services/cubit/services_state.dart';
import 'package:dental_clinics_app/core/themes/app_theme.dart';
import 'package:dental_clinics_app/l10n/app_localizations.dart';
import 'package:dental_clinics_app/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DentalClinics extends StatefulWidget {
  const DentalClinics({super.key});

  @override
  State<DentalClinics> createState() => _DentalClinicsState();
}

class _DentalClinicsState extends State<DentalClinics> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => OnboardingCubit()),
        BlocProvider(create: (conteext) => BottomNavigationBarCubit()),
        BlocProvider(create: (conteext) => ServicesCubit()),
      ],

      child: BlocBuilder<ServicesCubit, ServicesState>(
        builder: (context, state) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getLightTheme(state.selectedLang.languageCode),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: state.selectedLang,

            routerConfig: RoutingConfig.router,
          );
        },
      ),
    );
  }
}
