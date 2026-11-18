import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dental_clinics_app/clinic/features/profile/data/data_source/remote_data/profile_remote_data_source.dart';
import 'package:dental_clinics_app/clinic/features/profile/data/data_source/remote_data/profile_remote_data_source_imp.dart';
import 'package:dental_clinics_app/clinic/features/profile/data/repository/profile_repository_imp.dart';
import 'package:dental_clinics_app/clinic/features/profile/domain/repository/profile_repository.dart';
import 'package:dental_clinics_app/clinic/features/profile/domain/use_cases/add_new_service_use_case.dart';
import 'package:dental_clinics_app/clinic/features/profile/domain/use_cases/edit_service_use_case.dart';
import 'package:dental_clinics_app/clinic/features/profile/domain/use_cases/get_info_use_case.dart';
import 'package:dental_clinics_app/clinic/features/profile/domain/use_cases/profile_use_case.dart';
import 'package:dental_clinics_app/clinic/features/profile/domain/use_cases/save_day_use_case.dart';
import 'package:dental_clinics_app/clinic/features/profile/domain/use_cases/save_single_day_use_case.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:dental_clinics_app/core/services/di_locator/di_locator.dart';

initProfileDi() {
  sl.registerLazySingleton<ProfileRemoteDataSource>(
    () => ProfileRemoteDataSourceImp(
      firebaseFirestore: FirebaseFirestore.instance,
    ),
  );
  sl.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImp(profileRemoteDataSource: sl()),
  );
  sl.registerLazySingleton(
    () => ProfileUseCase(
      getInfoUseCase: GetInfoUseCase(repository: sl()),
      addNewServiceUseCase: AddNewServiceUseCase(repository: sl()),
      editServiceUseCase: EditServiceUseCase(repository: sl()),
      saveDayUseCase: SaveDayUseCase(repository: sl()),
      saveSingleDayUseCase: SaveSingleDayUseCase(repository: sl()),
    ),
  );
  sl.registerFactory(() => ProfileCubit(profileUseCase: sl()));
}
