import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dental_clinics_app/clinic/features/bottom_navigation_bar/presentation/cubit/bottom_navigation_bar_cubit.dart';
import 'package:dental_clinics_app/clinic/features/home/presentation/cubit/home_cubit.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:dental_clinics_app/clinic/features/schedule/data/data_source/remote_data/schedule_remote_data_source_imp.dart';
import 'package:dental_clinics_app/clinic/features/schedule/data/repositories/schedule_repository_impl.dart';
import 'package:dental_clinics_app/clinic/features/schedule/domain/usecases/get_appointments_usecase.dart';
import 'package:dental_clinics_app/clinic/features/schedule/presentation/cubit/schedule_cubit.dart';
import 'package:dental_clinics_app/core/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:dental_clinics_app/core/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:dental_clinics_app/core/features/role_selection/presentation/cubit/role_cubit.dart';
import 'package:dental_clinics_app/core/routing/routing_config.dart';
import 'package:dental_clinics_app/core/services/cubit/services_cubit.dart';
import 'package:dental_clinics_app/core/services/cubit/services_state.dart';
import 'package:dental_clinics_app/core/services/di_locator/di_locator.dart';
import 'package:dental_clinics_app/core/themes/app_theme.dart';
import 'package:dental_clinics_app/l10n/app_localizations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DentalClinics extends StatefulWidget {
  const DentalClinics({super.key});

  @override
  State<DentalClinics> createState() => _DentalClinicsState();
}

class _DentalClinicsState extends State<DentalClinics> {
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => OnboardingCubit()),
        BlocProvider(create: (conteext) => BottomNavigationBarCubit()),
        BlocProvider(create: (conteext) => ServicesCubit()),
        BlocProvider(create: (conteext) => RoleCubit()),
        BlocProvider(
          create: (conteext) => ScheduleCubit(
            getAppointmentsUseCase: GetAppointmentsUseCase(
              repository: ScheduleRepositoryImpl(
                remoteDataSource: ScheduleRemoteDataSourceImpl(
                  firestore: FirebaseFirestore.instance,
                ),
              ),
            ),
          ),
        ),
        BlocProvider(create: (conteext) => sl<HomeCubit>()),
        BlocProvider(create: (conteext) => sl<ProfileCubit>()),
        BlocProvider(create: (conteext) => sl<AuthCubit>()),
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
