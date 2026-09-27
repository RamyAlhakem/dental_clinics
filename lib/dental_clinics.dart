import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dental_clinics_app/clinic/features/bottom_navigation_bar.dart/presentation/cubit/bottom_navigation_bar_cubit.dart';
import 'package:dental_clinics_app/core/features/auth/data/data_source/remote_date/auth_remote_data_source_impl.dart';
import 'package:dental_clinics_app/core/features/auth/data/repository/auth_repository_impl.dart';
import 'package:dental_clinics_app/core/features/auth/domain/uses_cases/auth_use_case.dart';
import 'package:dental_clinics_app/core/features/auth/domain/uses_cases/sign_in_use_case.dart';
import 'package:dental_clinics_app/core/features/auth/domain/uses_cases/sign_up_use_case.dart';
import 'package:dental_clinics_app/core/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:dental_clinics_app/core/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:dental_clinics_app/core/features/role_selection/presentation/cubit/role_cubit.dart';
import 'package:dental_clinics_app/core/routing/routing_config.dart';
import 'package:dental_clinics_app/core/services/cubit/services_cubit.dart';
import 'package:dental_clinics_app/core/services/cubit/services_state.dart';
import 'package:dental_clinics_app/core/themes/app_theme.dart';
import 'package:dental_clinics_app/l10n/app_localizations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
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
          create: (conteext) => AuthCubit(
            authUseCase: AuthUseCase(
              signInUseCase: SignInUseCase(
                repository: AuthRepositoryImpl(
                  authRemoteDataSource: AuthRemoteDataSourceImpl(
                    firebaseAuth: FirebaseAuth.instance,
                    firebaseFirestore: FirebaseFirestore.instance,
                  ),
                ),
              ),
              signUpUseCase: SignUpUseCase(
                repository: AuthRepositoryImpl(
                  authRemoteDataSource: AuthRemoteDataSourceImpl(
                    firebaseAuth: FirebaseAuth.instance,
                    firebaseFirestore: FirebaseFirestore.instance,
                  ),
                ),
              ),
            ),
          ),
        ),
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
