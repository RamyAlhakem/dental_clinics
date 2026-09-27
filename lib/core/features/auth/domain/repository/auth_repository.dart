import 'package:dental_clinics_app/core/errors/app_result.dart';
import 'package:dental_clinics_app/core/features/auth/data/models/user_model.dart';
import 'package:dental_clinics_app/core/features/auth/domain/entities/user_entitie.dart';

abstract class AuthRepository {
  Future<AppResult<UserEntitie>> signUp({
    required UserModel user,
    required String role,
  });
  Future<AppResult<UserEntitie>> signIn({
    required String email,
    required String password,
  });
}
