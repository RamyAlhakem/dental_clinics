import 'package:dental_clinics_app/clinic/features/profile/data/models/service_model.dart';
import 'package:dental_clinics_app/clinic/features/profile/domain/repository/profile_repository.dart';
import 'package:dental_clinics_app/core/errors/app_result.dart';

class EditServiceUseCase {
  final ProfileRepository repository;
  EditServiceUseCase({required this.repository});
  Future<AppResult<String>> call({
    required String role,
    required String docId,
    required ServiceModel service,
    required ServiceModel newService,
  }) async {
    return await repository.editService(
      role: role,
      docId: docId,
      service: service,
      newService: newService,
    );
  }
}
