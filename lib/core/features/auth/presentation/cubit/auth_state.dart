import 'package:dental_clinics_app/core/features/auth/domain/entities/user_entitie.dart';
import 'package:equatable/equatable.dart';

sealed class AuthState extends Equatable {
  final bool isHide;
  const AuthState({required this.isHide});
  @override
  List<Object?> get props => [isHide];
}

class AuthInitialState extends AuthState {
  const AuthInitialState({required super.isHide});
}

class AuthLoadingState extends AuthState {
  const AuthLoadingState({required super.isHide});
}

class AuthSuccessState extends AuthState {
  final UserEntitie user;
  const AuthSuccessState({required this.user, required super.isHide});
  @override
  List<Object?> get props => [user];
}

class AuthSuccessResetPasswordState extends AuthState {
  const AuthSuccessResetPasswordState({required super.isHide});
}

class AuthFailedResetPasswordState extends AuthState {
  final String msg;
  const AuthFailedResetPasswordState({
    required this.msg,
    required super.isHide,
  });
  @override
  List<Object?> get props => [msg];
}

class AuthFailedState extends AuthState {
  final String msg;
  const AuthFailedState({required this.msg, required super.isHide});
  @override
  List<Object?> get props => [msg];
}

class AuthSignOutState extends AuthState {
  final String msg;
  const AuthSignOutState({required this.msg, required super.isHide});
  @override
  List<Object?> get props => [msg];
}

class AuthChangingIsHidestate extends AuthState {
  const AuthChangingIsHidestate({required super.isHide});
}
