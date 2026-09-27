import 'package:dental_clinics_app/core/features/auth/data/models/user_model.dart';
import 'package:dental_clinics_app/core/features/auth/domain/uses_cases/auth_use_case.dart';
import 'package:dental_clinics_app/core/features/auth/domain/uses_cases/sign_up_use_case.dart';
import 'package:dental_clinics_app/core/features/auth/presentation/cubit/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthUseCase authUseCase;
  AuthCubit({required this.authUseCase}) : super(AuthInitialState());
  signUp({required UserModel user, required String role}) async {
    emit(AuthLoadingState());
    final result = await authUseCase.signUpUseCase.call(user: user, role: role);
    if (result.data != null) {
      emit(AuthSuccessState());
    } else {
      emit(AuthFailedState(msg: result.msg!));
    }
  }

  signIn({required String email, required String password}) async {
    emit(AuthLoadingState());
    final result = await authUseCase.signInUseCase.call(
      email: email,
      password: password,
    );
    if (result.data != null) {
      emit(AuthSuccessState());
    } else {
      emit(AuthFailedState(msg: result.msg!));
    }
  }
}
