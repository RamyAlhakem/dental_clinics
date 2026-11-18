import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dental_clinics_app/core/features/auth/data/data_source/remote_date/auth_remote_data_source.dart';
import 'package:dental_clinics_app/core/features/auth/data/data_source/remote_date/auth_remote_data_source_impl.dart';
import 'package:dental_clinics_app/core/features/auth/data/repository/auth_repository_impl.dart';
import 'package:dental_clinics_app/core/features/auth/domain/repository/auth_repository.dart';
import 'package:dental_clinics_app/core/features/auth/domain/uses_cases/auth_use_case.dart';
import 'package:dental_clinics_app/core/features/auth/domain/uses_cases/logout_use_case.dart';
import 'package:dental_clinics_app/core/features/auth/domain/uses_cases/reset_password_use_case.dart';
import 'package:dental_clinics_app/core/features/auth/domain/uses_cases/sign_in_use_case.dart';
import 'package:dental_clinics_app/core/features/auth/domain/uses_cases/sign_up_use_case.dart';
import 'package:dental_clinics_app/core/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:dental_clinics_app/core/services/di_locator/di_locator.dart';
import 'package:firebase_auth/firebase_auth.dart';

initAuthDi() {
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(
      firebaseAuth: FirebaseAuth.instance,
      firebaseFirestore: FirebaseFirestore.instance,
    ),
  );
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(authRemoteDataSource: sl()),
  );
  sl.registerLazySingleton(
    () => AuthUseCase(
      signUpUseCase: SignUpUseCase(repository: sl()),
      signInUseCase: SignInUseCase(repository: sl()),
      resetPasswordUseCase: ResetPasswordUseCase(repository: sl()),
      logoutUseCase: LogoutUseCase(repository: sl()),
    ),
  );
  sl.registerFactory(() => AuthCubit(authUseCase: sl()));
}
