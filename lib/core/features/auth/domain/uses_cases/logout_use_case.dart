import 'package:dental_clinics_app/core/errors/app_result.dart';
import 'package:dental_clinics_app/core/features/auth/domain/entities/user_entitie.dart';
import 'package:dental_clinics_app/core/features/auth/domain/repository/auth_repository.dart';

class LogoutUseCase {
  final AuthRepository repository;
  const LogoutUseCase({required this.repository});
  Future<AppResult<UserEntitie>> call() async {
    return await repository.signOut();
  }
}
