import 'package:dental_clinics_app/clinic/features/profile/data/models/service_model.dart';
import 'package:dental_clinics_app/core/errors/app_result.dart';
import 'package:dental_clinics_app/core/features/auth/domain/entities/user_entitie.dart';

abstract class ProfileRepository {
  Future<AppResult<UserEntitie>> getInfo({
    required String role,
    required String userId,
  });
  Future<AppResult<String>> addNewService({
    required String role,
    required String docId,
    required ServiceModel service,
  });
}
