import 'package:dental_clinics_app/core/features/auth/domain/uses_cases/sign_in_use_case.dart';
import 'package:dental_clinics_app/core/features/auth/domain/uses_cases/sign_up_use_case.dart';

class AuthUseCase {
  final SignUpUseCase signUpUseCase;
  final SignInUseCase signInUseCase;
  const AuthUseCase({required this.signInUseCase, required this.signUpUseCase});
}
