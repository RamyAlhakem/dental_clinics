import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dental_clinics_app/clinic/features/home/data/data_source/remote_data/home_remote_data_source_imp.dart';
import 'package:dental_clinics_app/clinic/features/home/data/data_source/remote_data/home_reomte_data_source.dart';
import 'package:dental_clinics_app/clinic/features/home/data/repository/home_repository_imp.dart';
import 'package:dental_clinics_app/clinic/features/home/domain/repository/home_repository.dart';
import 'package:dental_clinics_app/clinic/features/home/domain/use_case/get_inquiries_use_case.dart';
import 'package:dental_clinics_app/clinic/features/home/domain/use_case/home_use_case.dart';
import 'package:dental_clinics_app/clinic/features/home/domain/use_case/update_inquiry_use_case.dart';
import 'package:dental_clinics_app/clinic/features/home/presentation/cubit/home_cubit.dart';
import 'package:dental_clinics_app/core/services/di_locator/di_locator.dart';

initHomeDi() {
  sl.registerLazySingleton<HomeReomteDataSource>(
    () =>
        HomeReomteDataSourceImp(firebaseFirestore: FirebaseFirestore.instance),
  );
  sl.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImp(homeReomteDataSource: sl()),
  );
  sl.registerLazySingleton(
    () => HomeUseCase(
      getInquiriesUseCase: GetInquiriesUseCase(repository: sl()),
      updateInquiryUseCase: UpdateInquiryUseCase(repository: sl()),
    ),
  );
  sl.registerFactory(() => HomeCubit(homeUseCase: sl()));
}
