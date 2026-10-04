import 'package:dental_clinics_app/clinic/features/profile/data/models/service_model.dart';
import 'package:dental_clinics_app/clinic/features/profile/domain/repository/profile_repository.dart';
import 'package:dental_clinics_app/core/errors/app_result.dart';

class AddNewServiceUseCase {
  final ProfileRepository repository;
  AddNewServiceUseCase({required this.repository});
  Future<AppResult<String>> call({
    required String role,
    required String docId,
    required ServiceModel service,
  }) async {
    return await repository.addNewService(
      role: role,
      docId: docId,
      service: service,
    );
  }
}
