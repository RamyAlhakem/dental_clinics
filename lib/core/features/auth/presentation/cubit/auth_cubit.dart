import 'package:dental_clinics_app/core/features/auth/data/models/user_model.dart';
import 'package:dental_clinics_app/core/features/auth/domain/uses_cases/auth_use_case.dart';
import 'package:dental_clinics_app/core/features/auth/presentation/cubit/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthUseCase authUseCase;
  AuthCubit({required this.authUseCase})
    : super(AuthInitialState(isHide: true));
  signUp({required UserModel user, required String role}) async {
    emit(AuthLoadingState(isHide: state.isHide));
    final result = await authUseCase.signUpUseCase.call(user: user, role: role);
    if (result.data != null) {
      emit(AuthSuccessState(user: result.data!, isHide: state.isHide));
    } else {
      emit(AuthFailedState(msg: result.msg!, isHide: state.isHide));
    }
  }

  signIn({required String email, required String password}) async {
    emit(AuthLoadingState(isHide: state.isHide));
    final result = await authUseCase.signInUseCase.call(
      email: email,
      password: password,
    );
    if (result.data != null) {
      emit(AuthSuccessState(user: result.data!, isHide: state.isHide));
    } else {
      emit(AuthFailedState(msg: result.msg!, isHide: state.isHide));
    }
  }

  resetPassword({required String email}) async {
    emit(AuthLoadingState(isHide: state.isHide));
    final result = await authUseCase.resetPasswordUseCase.call(email: email);
    if (result.data != null) {
      emit(AuthSuccessResetPasswordState(isHide: state.isHide));
    } else {
      emit(
        AuthFailedResetPasswordState(msg: result.msg!, isHide: state.isHide),
      );
    }
  }

  changeShowPass(bool val) {
    emit(AuthChangingIsHidestate(isHide: val));
  }

  signOut() async {
    emit(AuthLoadingState(isHide: state.isHide));
    final result = await authUseCase.logoutUseCase.call();
    if (result.data != null) {
      emit(AuthSignOutState(msg: result.msg!, isHide: true));
    } else {
      emit(AuthFailedState(msg: result.msg!, isHide: state.isHide));
    }
  }
}
