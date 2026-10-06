import 'package:dental_clinics_app/clinic/features/profile/domain/use_cases/add_new_service_use_case.dart';
import 'package:dental_clinics_app/clinic/features/profile/domain/use_cases/edit_service_use_case.dart';
import 'package:dental_clinics_app/clinic/features/profile/domain/use_cases/get_info_use_case.dart';

class ProfileUseCase {
  final GetInfoUseCase getInfoUseCase;
  final AddNewServiceUseCase addNewServiceUseCase;
  final EditServiceUseCase editServiceUseCase;
  ProfileUseCase({
    required this.getInfoUseCase,
    required this.addNewServiceUseCase,
    required this.editServiceUseCase,
  });
}
