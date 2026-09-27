import 'package:dental_clinics_app/core/errors/app_result.dart';
import 'package:dental_clinics_app/core/features/auth/data/models/user_model.dart';
import 'package:dental_clinics_app/core/features/auth/domain/entities/user_entitie.dart';
import 'package:dental_clinics_app/core/features/auth/domain/repository/auth_repository.dart';
import 'package:dental_clinics_app/core/features/auth/domain/uses_cases/auth_use_case.dart';

class SignUpUseCase {
  final AuthRepository repository;
  SignUpUseCase({required this.repository});
  Future<AppResult<UserEntitie>> call({
    required UserModel user,
    required String role,
  }) async {
    return await repository.signUp(user: user, role: role);
  }
}
