import 'package:dental_clinics_app/clinic/features/profile/domain/repository/profile_repository.dart';
import 'package:dental_clinics_app/core/errors/app_result.dart';
import 'package:dental_clinics_app/core/features/auth/domain/entities/user_entitie.dart';

class GetInfoUseCase {
  final ProfileRepository repository;
  GetInfoUseCase({required this.repository});
  Future<AppResult<UserEntitie>> call({
    required String role,
    required String userId,
  }) async {
    return await repository.getInfo(role: role, userId: userId);
  }
}
