import 'package:dental_clinics_app/core/features/auth/domain/entities/user_entitie.dart';
import 'package:equatable/equatable.dart';

sealed class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthInitialState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthSuccessState extends AuthState {
  final UserEntitie user;
  AuthSuccessState({required this.user});
  @override
  List<Object?> get props => [user];
}

class AuthSuccessResetPasswordState extends AuthState {}

class AuthFailedResetPasswordState extends AuthState {
  final String msg;
  AuthFailedResetPasswordState({required this.msg});
  @override
  List<Object?> get props => [msg];
}

class AuthFailedState extends AuthState {
  final String msg;
  AuthFailedState({required this.msg});
  @override
  List<Object?> get props => [msg];
}
