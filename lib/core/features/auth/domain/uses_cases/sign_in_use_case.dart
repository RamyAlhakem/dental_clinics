import 'package:dental_clinics_app/core/errors/app_result.dart';
import 'package:dental_clinics_app/core/features/auth/domain/entities/user_entitie.dart';
import 'package:dental_clinics_app/core/features/auth/domain/repository/auth_repository.dart';
import 'package:dental_clinics_app/core/features/auth/domain/uses_cases/auth_use_case.dart';

class SignInUseCase {
  final AuthRepository repository;
  SignInUseCase({required this.repository});
  Future<AppResult<UserEntitie>> call({
    required String email,
    required String password,
  }) async {
    return await repository.signIn(email: email, password: password);
  }
}
