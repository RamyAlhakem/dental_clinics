import 'package:dental_clinics_app/core/errors/app_result.dart';
import 'package:dental_clinics_app/core/features/auth/domain/entities/user_entitie.dart';
import 'package:dental_clinics_app/core/features/auth/domain/repository/auth_repository.dart';

class ResetPasswordUseCase {
  final AuthRepository repository;
  const ResetPasswordUseCase({required this.repository});
  Future<AppResult<UserEntitie>> call({required String email}) async {
    return await repository.resetPassword(email: email);
  }
}
